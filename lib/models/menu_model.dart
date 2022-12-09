class Menu{
  late String tipo;
  late int cantidad;

  Menu({
    required this.tipo,
    required this.cantidad
  });

  void aumentaCantidad(){
    this.cantidad++;
  }

  void reduceCantidad(){
    this.cantidad--;
    if(cantidad <=0) cantidad = 0;
  }

  int getCantidad(){
    return this.cantidad;
  }

  String getTipo(){
    return this.tipo;
  }
}