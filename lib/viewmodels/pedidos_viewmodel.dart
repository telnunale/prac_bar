import 'package:flutter/material.dart';
import 'package:prac_bar/model/pedido.dart';
import 'package:prac_bar/model/producto.dart';

// Necisto un modelo que sea lista de pedidos???
//Las logica de las funciones se hace aquin ¿?¿

class PedidosViewModel extends ChangeNotifier {
  List<Pedido> _pedidos = [];
  List<Pedido> get pedidos => _pedidos;

  void agregarPedido(Pedido p) {
    _pedidos.add(p);
    notifyListeners();
  }

  //String _mesa = "";
  List<Producto> _productosSelecionados = [];
  //void porque no se necesita devolver un valor con notify listener ya se avisa a la vista

  //crear getters para poder accede al estado
  //String get mesa => _mesa;
  List<Producto> get productosSeleccionados => _productosSelecionados;

  void agregarProductoSeleccionado(Producto p) {
    _productosSelecionados.add(p);
    notifyListeners(); //avisar de que hubo un cambio
  }

  bool productoEstaSeleccionado(int id) {
    return _productosSelecionados.any((producto) => producto.id == id);    
  }
}
