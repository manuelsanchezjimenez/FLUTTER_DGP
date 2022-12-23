// Copyright 2019 Aleksander Woźniak
// SPDX-License-Identifier: Apache-2.0

import 'dart:collection';

import 'package:app_dgp/models/ActivityDbModel.dart';
import 'package:app_dgp/mongodb.dart';
import 'package:table_calendar/table_calendar.dart';

/// Example event class.
class Event {

  final String title;
  Event(this.title);

  @override
  String toString() => title;
}


/// Example events.
///
/// Using a [LinkedHashMap] is highly recommended if you decide to use a map.
