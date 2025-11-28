import 'package:flutter/material.dart';
import 'package:prac_bar/model/pedido.dart';
import 'package:prac_bar/model/producto.dart';

// Necisto un modelo que sea lista de pedidos???
//Las logica de las funciones se hace aquin ¿?¿

class PedidosViewModel extends ChangeNotifier {
  List<Pedido> _pedidos = [];

  List<Pedido> get pedidos => _pedidos;

  Pedido agregarPedido(List<Producto> productos, mesa) {
    if (mesa != 0) {
      Pedido p = Pedido(mesa, productos);
      bool pedidoOK = existePedido(p);
      if (!pedidoOK) {
        _pedidos.add(p);
        notifyListeners();
        return p;
      }
    }

    return Pedido(0, []);
  }

  bool existePedido(Pedido p) {
    return _pedidos.any((pedido) => pedido.nMesa == p.nMesa);
  }

  void cargaInicialPedidos() {
    _pedidos = [
      Pedido(1, [
        Producto(id: 1, nombre: 'Coca cola', precio: 2.00),
        Producto(id: 2, nombre: 'Fanta', precio: 2.40),
        Producto(id: 3, nombre: 'Agua', precio: 1.00),
        Producto(id: 4, nombre: 'Nestea', precio: 3.00),
      ]),
      Pedido(2, [
        Producto(id: 1, nombre: 'Coca cola', precio: 2.00),
        Producto(id: 4, nombre: 'Nestea', precio: 3.00),
        Producto(id: 6, nombre: 'Fuzetea', precio: 1.50),
        Producto(id: 7, nombre: 'Bravas', precio: 3.40),
        Producto(id: 8, nombre: 'Alioli', precio: 3.50),
      ]),
      Pedido(3, [
        Producto(id: 1, nombre: 'Coca cola', precio: 2.00),
        Producto(id: 6, nombre: 'Fuzetea', precio: 1.50),
        Producto(id: 8, nombre: 'Alioli', precio: 3.50),
      ]),
    ];
  }

  /*void resetPedidos(){
    _pedidos.clear();
  }*/

  //String _mesa = "";
  List<Producto> _productosSelecionados = [];
  //void porque no se necesita devolver un valor con notify listener ya se avisa a la vista

  //crear getters para poder accede al estado
  //String get mesa => _mesa;
  List<Producto> get productosSeleccionados => _productosSelecionados;

  void agregarProductoSeleccionado(Producto p) {
    bool estaSeleccionado = productoEstaSeleccionado(p.id);
    if (estaSeleccionado) {
      _productosSelecionados.remove(p);
    } else {
      _productosSelecionados.add(p);
    }

    notifyListeners(); //avisar de que hubo un cambio
  }

  void resetProductosSeleccionados() {
    _productosSelecionados.clear();
  }

  bool productoEstaSeleccionado(int id) {
    return _productosSelecionados.any((producto) => producto.id == id);
  }
}
