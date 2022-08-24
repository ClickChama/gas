import 'package:gas/pages/MainPage.dart';
import 'package:gas/pages/pedidos/pedido.dart';
import 'package:gas/pages/pedidos/pedidos.dart';
import 'package:gas/user/address/binding/address_binding.dart';
import 'package:get/get.dart';

abstract class AppPages {
  static final pages = <GetPage>[
    GetPage(
      name: PagesRoutes.initalRote,
      page: () => const MainPage(),
    ),
    GetPage(
      name: PagesRoutes.PedidoRoute,
      page: () => PedidoPage(),
    ),
    GetPage(
      name: PagesRoutes.PedidosRoute,
      page: () => const TodosPedidosPage(),
    ),
  ];
}

abstract class PagesRoutes {
  // ignore: constant_identifier_names
  static const String initalRote = '/';
  static const String PedidoRoute = '/pedido';
  static const String PedidosRoute = '/pedidos';
}
