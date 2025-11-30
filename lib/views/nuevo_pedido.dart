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
                        SeleccionarProductos(viewModel: PedidosViewModel()),
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
              onPressed: () {
                int nMesa = int.tryParse(mesa.text) ?? 0;

                Pedido p = new Pedido(nMesa!, productos);
                Navigator.pushNamed(
                  context,
                  DetallesPedido.routeName,
                  arguments: p,
                );
              },
              child: const Text('Ver Resumen'),
            ),
            TextButton(
              onPressed: () {
                //widget.viewModel.resetPedidos();
                Navigator.pop(context, null);
              },
              child: const Text('Cancelar'),
            ),
            TextButton(
              onPressed: () {
                int? nMesa = int.tryParse(mesa.text);
                Pedido pedidoOK = new Pedido(0, []);
                if (nMesa != null && productos.isNotEmpty) {
                  pedidoOK = widget.viewModel.agregarPedido(productos, nMesa);
                }

                if (pedidoOK.nMesa != 0 || pedidoOK.productos.isNotEmpty) {
                  Navigator.pop(context, pedidoOK);
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
