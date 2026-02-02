import 'package:flutter/material.dart';
import 'package:prac_bar/model/pedido.dart';
import 'package:prac_bar/model/producto.dart';


/// Gestiona el estado de los pedidos y la lógica de negocio entre vistas.
class PedidosViewModel extends ChangeNotifier {
  int _mesaTemporal = 0;
  int get mesaTemporal => _mesaTemporal;
  set mesaTemporal(int m) {
    _mesaTemporal = m;
  }

  List<Pedido> _pedidos = [];

  List<Pedido> get pedidos => _pedidos;


/// Intenta agregar un pedido si la mesa es válida y no existe previamente.
  Pedido agregarPedido(List<Producto> productos, mesa) {
    if (mesa != 0) {
      Pedido p = Pedido(mesa, productos);
      _pedidos.add(p);
      notifyListeners();
      resetProductosSeleccionados();
      return p;
    }

    return Pedido(0, []);
  }
 ///Comprueba si existe un pedido en la lista, se comprueba mediante el numero mesa. 
  bool existePedido(Pedido p) {
    return _pedidos.any((pedido) => pedido.nMesa == p.nMesa);
  }

/// Cargamos unos pedidos de prueba en el Array de pedidos
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

  /// Valida si el input de mesa y productos es apto para proceder al resumen.
  /// Controla que el string de mesa sea numérico y que haya productos elegidos.
  bool validarPedido(nmesa, List<Producto> productos) {
    bool isOK = false;
    int? mesa = int.tryParse(nmesa);

    if (mesa != null && productos.isNotEmpty && mesa > 0) {
      isOK = true;
    } else {
      return false;
    }
    Pedido exisPedido = new Pedido(mesa, productos);
    if (this.existePedido(exisPedido)) {
      return false;
    }

    mesaTemporal = mesa;
    return isOK;
  }

  List<Producto> _productosSelecionados = [];
  ///devuelve los productos que el usuario a seleccionado antes de realizar el pedido
  List<Producto> get productosSeleccionados => _productosSelecionados;

/// Agrega un producto al array de productosSeleccionados y si existe lo elimina del array
  void agregarProductoSeleccionado(Producto p) {
    //bool estaSeleccionado = productoEstaSeleccionado(p.id);
    final esta = productosSeleccionados.indexWhere(
      (producto) => producto.id == p.id,
    );
    if (esta >= 0) {
      _productosSelecionados.removeAt(esta);
    } else {
      _productosSelecionados.add(p);
    }
    notifyListeners(); //avisar de que hubo un cambio
  }
  /// Elimina todos los productos del array de productos seleccionados
  void resetProductosSeleccionados() {
    _productosSelecionados.clear();
  }

/// Comprueba si un producto ha sido selecionado por el usuario
  bool productoEstaSeleccionado(int id) {
    return _productosSelecionados.any((producto) => producto.id == id);
  }
}
