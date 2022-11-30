import 'dart:ui';
import 'package:app_dgp/components/arrow_button.dart';
import 'package:app_dgp/constants.dart';
import 'package:app_dgp/models/UserDbModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_calendar_week/flutter_calendar_week.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';
import '../mongodb.dart';
import 'package:intl/date_symbol_data_local.dart';
import '../tareas.dart';

class TareasMenuScreen extends StatefulWidget {
  UserDbModel user;
  TareasMenuScreen({required this.user});

  @override
  _TareasMenuScreen createState() => _TareasMenuScreen();
}

class _TareasMenuScreen extends State<TareasMenuScreen> {
  final CalendarWeekController _controller = CalendarWeekController();
  late final ValueNotifier<List<Event>> _selectedEvents;

  CalendarFormat _calendarFormat = CalendarFormat.week;
  RangeSelectionMode _rangeSelectionMode = RangeSelectionMode
      .toggledOff; // Can be toggled on/off by longpressing a date
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
  DateTime? _rangeStart;
  DateTime? _rangeEnd;

  @override
  void initState() {
    super.initState();

    _selectedDay = _focusedDay;
    _selectedEvents = ValueNotifier(_getEventsForDay(_selectedDay!));
  }

  // Funciones para los eventos

  @override
  void dispose() {
    _selectedEvents.dispose();
    super.dispose();
  }

  List<Event> _getEventsForDay(DateTime day) {
    // Implementation example
    return kEvents[day] ?? [];
  }

  List<Event> _getEventsForRange(DateTime start, DateTime end) {
    // Implementation example
    final days = daysInRange(start, end);

    return [
      for (final d in days) ..._getEventsForDay(d),
    ];
  }

  void _onDaySelected(DateTime selectedDay, DateTime focusedDay) {
    if (!isSameDay(_selectedDay, selectedDay)) {
      setState(() {
        _selectedDay = selectedDay;
        _focusedDay = focusedDay;
        _rangeStart = null; // Important to clean those
        _rangeEnd = null;
        _rangeSelectionMode = RangeSelectionMode.toggledOff;
      });

      _selectedEvents.value = _getEventsForDay(selectedDay);
    }
  }

  void _onRangeSelected(DateTime? start, DateTime? end, DateTime focusedDay) {
    setState(() {
      _selectedDay = null;
      _focusedDay = focusedDay;
      _rangeStart = start;
      _rangeEnd = end;
      _rangeSelectionMode = RangeSelectionMode.toggledOn;
    });

    // `start` or `end` could be null
    if (start != null && end != null) {
      _selectedEvents.value = _getEventsForRange(start, end);
    } else if (start != null) {
      _selectedEvents.value = _getEventsForDay(start);
    } else if (end != null) {
      _selectedEvents.value = _getEventsForDay(end);
    }
  }

  // Construccion calendario

  AppBar buildAppBar() {
    return AppBar(
      backgroundColor: kPrimaryColor,
      elevation: 0,
      leading: Transform.scale(
          scale: 2,
          child: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          )),
      title: Text(
        "Tareas",
          style: TextStyle(
              fontSize: 35,
              fontWeight: FontWeight.bold,
              color: kPrimaryWhite,
              fontFamily: 'Escolar'
          )
      ),
      centerTitle: true,
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: buildAppBar(),
      body: Column(
        children: [
          TableCalendar<Event>(

            firstDay: kFirstDay,
            lastDay: kLastDay,
            focusedDay: _focusedDay,
            locale: 'es_ES',
            selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
            rangeStartDay: _rangeStart,
            rangeEndDay: _rangeEnd,
            calendarFormat: _calendarFormat,
            rangeSelectionMode: _rangeSelectionMode,
            eventLoader: _getEventsForDay,
            startingDayOfWeek: StartingDayOfWeek.monday,
            daysOfWeekHeight: size.height*0.08,
            daysOfWeekStyle: DaysOfWeekStyle(
              weekdayStyle: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey,
                  fontFamily: 'Escolar'
              ),
              weekendStyle: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey,
                  fontFamily: 'Escolar'
              ),
            ),
            headerStyle: HeaderStyle(
              formatButtonVisible : false,
              titleTextStyle: TextStyle(
                  fontSize:45 ,
                  fontWeight: FontWeight.bold,
                  color: Colors.blueGrey,
                  fontFamily: 'Escolar'
              ),
            ),
            calendarStyle: CalendarStyle(
              outsideTextStyle: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey,
                  fontFamily: 'Escolar'
              ),
              outsideDaysVisible: true,
              defaultTextStyle: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.blueGrey,
                  fontFamily: 'Escolar'
              ),
              weekendTextStyle:
              TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: kPrimaryColor,
                  fontFamily: 'Escolar'
              ),
              selectedTextStyle:  TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontFamily: 'Escolar'
              ),
              todayTextStyle:  TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: kPrimaryColor,
                  fontFamily: 'Escolar'
              ),
              todayDecoration:  BoxDecoration(
                  shape: BoxShape.rectangle,
                  color: kPrimaryLightColor
              ),
              selectedDecoration:
              BoxDecoration(
               shape: BoxShape.rectangle,
                color: kPrimaryColor
              )
            ),
            onDaySelected: _onDaySelected,
            onRangeSelected: _onRangeSelected,
            onFormatChanged: (format) {
              if (_calendarFormat != format) {
                setState(() {
                  _calendarFormat = format;
                });
              }
            },
            onPageChanged: (focusedDay) {
              _focusedDay = focusedDay;
            },
          ),
          SizedBox(height: size.height * 0.02),
          Expanded(
            child: ValueListenableBuilder<List<Event>>(
              valueListenable: _selectedEvents,
              builder: (context, value, _) {
                return ListView.builder(
                  itemCount: value.length,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: const EdgeInsets.symmetric(
                        horizontal: 12.0,
                        vertical: 5.0,
                      ),
                      decoration: BoxDecoration(
                        color: kPrimaryColor,
                        //border: Border.all(),
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      child: ListTile(
                        onTap: () => print('${value[index]}'),
                        title: Text(
                          '${value[index]}',
                          style: TextStyle(
                              fontSize: 55,
                              fontWeight: FontWeight.bold,
                              color: kPrimaryWhite,
                              fontFamily: 'Escolar'),
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
