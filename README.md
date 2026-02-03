# prac_bar
## Descripción
**prac_bar** es una aplicación móvil desarrollada en Flutter diseñada para la gestión de pedidos en un bar. Permite a los trabajadores crear, visualizar y gestionar pedidos asociados a mesas de forma rápida e intuitiva, sin necesidad de papel ni sistemas externos.
## Tecnologías usadas:
    - Framework: Flutter (v3.x+)
    - Lenguaje: Dart
    - Arquitectura: MVVM (Model-View-ViewModel).
## Características 
- **Gestión de pedidos:** crear, visualizar y confirmar pedidos asociados a una mesa concreta.
- **Selección de productos:** elegir productos de un catálogo disponible con indicación visual de los ya seleccionados.
- **Resumen de pedido:** ver el detalle completo de un pedido antes de confirmarlo, incluyendo productos y precio total.
- **Validación de datos:** comprobación de que la mesa y los productos sean válidos antes de crear el pedido, con mensajes de error informativos.
- **Datos iniciales:** carga automática de pedidos de ejemplo al iniciar la aplicación para facilitar las pruebas.
- **Arquitectura MVVM:** separación clara entre la capa de vista y la lógica de negocio mediante el patrón ViewModel con `ChangeNotifier`.


