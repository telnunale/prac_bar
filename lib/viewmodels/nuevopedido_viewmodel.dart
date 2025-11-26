import 'package:flutter/material.dart';
import 'package:prac_bar/model/producto.dart';

class NuevopedidoViewmodel extends ChangeNotifier {
  String _mesa = "";
  List<Producto> _productosSelecionados = [];

  //crear getters para poder accede al estado
  String get mesa => _mesa;
  List<Producto> get productosSeleccionados => _productosSelecionados;

  void agregarProducto(Producto p){
    _productosSelecionados.add(p);
    notifyListeners();//avisar de que hubo un cambio
  }



}
