import 'package:flutter/material.dart';
import 'package:prac_bar/model/pedido.dart';
import 'package:prac_bar/model/producto.dart';
import 'package:prac_bar/viewmodels/pedidos_viewmodel.dart';
import 'package:prac_bar/views/detalles_pedido.dart';
import 'package:prac_bar/views/seleccionar_productos.dart';

class NuevoPedido extends StatefulWidget {
  final PedidosViewModel viewModel;
  const NuevoPedido({super.key, required this.viewModel});

  @override
  State<NuevoPedido> createState() => _NuevoPedido();
}
/// Pantalla para crear un nuevo pedido.
/// Permite seleccionar la mesa y los productos.
/// Utiliza el [PedidosViewModel] para validar y gestionar el pedido temporal.
/// Muestra un resumen del pedido antes de confirmarlo.
/// Utiliza la pantalla [SeleccionarProductos] para elegir los productos.

class _NuevoPedido extends State<NuevoPedido> {
  List<Producto> productos = [];
  final TextEditingController mesa = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Crea tu pedido")),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            TextField(
              controller: mesa,
              decoration: const InputDecoration(labelText: "Mesa de pedido"),
            ),
            const SizedBox(height: 12),

            ElevatedButton(
              onPressed: () async {
                final r = await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        SeleccionarProductos(viewModel: widget.viewModel),
                  ),
                );
                if (!mounted) return;
                setState(() {
                  if (r != null) {
                    productos = r;
                  }
                });
              },
              child: Text('Seleccionar Productos'),
            ),
            const SizedBox(height: 10),
            if (productos.isNotEmpty)
              Expanded(
                child: ListView.builder(
                  itemCount: productos.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(productos[index].nombre),
                      subtitle: Text("${productos[index].precio} €"),
                    );
                  },
                ),
              ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.all(10),
        child: Row(
          children: [
            TextButton(
              //boton de ver resumen
              onPressed: () {
                //int? nMesa = int.tryParse(mesa.text);
                bool isOK = widget.viewModel.validarPedido(
                  mesa.text,
                  productos,
                );

                if (isOK) {
                  Pedido resumenPedido = new Pedido(
                    widget.viewModel.mesaTemporal,
                    productos,
                  );
                  Navigator.pushNamed(
                    context,
                    DetallesPedido.routeName,
                    arguments: resumenPedido,
                  );
                } else {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: const Text("Error"),
                        content: const Text("Error al validar pedido"),
                        actions: [
                          TextButton(
                            onPressed: () => Navigator.pop(context),
                            child: Text("ok"),
                          ),
                        ],
                      );
                    },
                  );
                }
              },
              child: const Text('Ver Resumen'),
            ),
            TextButton(
              onPressed: () {
                widget.viewModel.resetProductosSeleccionados();
                Navigator.pop(context, null);
              },
              child: const Text('Cancelar'),
            ),
            TextButton(
              onPressed: () {
                Pedido pedidoOK = new Pedido(0, []);
                bool isOK = widget.viewModel.validarPedido(
                  mesa.text,
                  productos,
                );

                if (isOK) {                
                  Navigator.pop(context, Pedido(widget.viewModel.mesaTemporal, productos));
                } else {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: const Text("Error"),
                        content: const Text("Error al validar pedido"),
                        actions: [
                          TextButton(
                            onPressed: () => Navigator.pop(context),
                            child: Text("ok"),
                          ),
                        ],
                      );
                    },
                  );
                }
              },
              child: const Text('Confirmar'),
            ),
          ],
        ),
      ),
    );
  }
}
