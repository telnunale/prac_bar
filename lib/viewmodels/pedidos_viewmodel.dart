import 'package:flutter/material.dart';
import 'package:prac_bar/model/pedido.dart';


// Necisto un modelo que sea lista de pedidos???
//Las logica de las funciones se hace aquin ¿?¿

class PedidosViewModel extends ChangeNotifier {
  List<Pedido> _pedidos = [];
  List<Pedido> get pedidos => _pedidos;

  //void porque no se necesita devolver un valor con notify listener ya se avisa a la vista
  void agregarPedido(Pedido p){
      _pedidos.add(p); 
      notifyListeners();
  }

  

}
