import 'package:prac_bar/model/producto.dart';

/// Representa un pedido.
class Pedido { 
  final int nMesa;
  final List<Producto> productos;

  Pedido(this.nMesa, this.productos);

  double precioTotal() {
    double contador = 0.0;
    productos.forEach((p) {
      contador += p.precio;
    });
    return contador;
  }

  int get productosTotales => productos.length;
}
