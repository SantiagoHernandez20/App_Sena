# Aplicacion Tienda Sena

## A.D.S.O, ficha: 2558346.
 
La intencion de este Readme es mostrar todo lo que conlleva el desarrollo de la aplicacion, desde la maqueta hasta el producto final.
Se planteo realizar una tienda virtual basada en la tienda de productos del CBA, el objetivo principal es que se asemeje a una tienda virtual real que contenga carrito de compras, registro y validación de usuarios en una base de datos y que genere facturación electrónica para que el cliente por medio de su dispositivo móvil pueda reclamar sus productos adquiridos.

A continuación, se hablará de las principales funciones y librerías, que se usaron para lograr elobjetivo final:

Este proyecto busca evaluar los conocimientos en el aprendizaje del framework Flutter y lenguaje
dart. Se planteo realizar una tienda virtual basada en la tienda de productos del CBA, el objetivo
principal es que se asemeje a una tienda virtual real que contenga carrito de compras, registro y
validación de usuarios en una base de datos y que genere facturación electrónica; para que el
cliente por medio de su dispositivo móvil pueda reclamar sus productos adquiridos.
A continuación, se hablará de las principales funciones y librerías, que se usaron para lograr el
objetivo final:

**URL_Launcher**

La librería URL_Launcher sirve para que nuestra aplicación flutter se conecte con otras aplicaciones sean web o Android, en este proyecto se usó para poder enviar la factura de los productos CBA por vía WhatsApp. Otro uso que se le dio fue que conectara con un aplicativo web para realizar el pago del pedido en línea con la pasarela de pagos epayco Davivienda, que permite
pagar el pedido sea en efectivo, tarjeta de crédito, PayPal y Daviplata.

**Instalación:**
En consola:
$ flutter pub add url_launcher

En el archivo pubspec.yaml:
dependencies:
 url_launcher: ^6.1.7
 
En el archivo dart donde se va a trabajar:
import 'package:url_launcher/url_launcher.dart';
**
Como Usar:**

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
final Uri _url = Uri.parse('https://flutter.dev');

void main() => runApp(
 const MaterialApp(
 home: Material(
 child: Center(
 child: ElevatedButton(
 onPressed: _launchUrl,
 child: Text('Show Flutter homepage'),
 ),
 ),
 ),
 ),
 );
Future<void> _launchUrl() async {
 if (!await launchUrl(_url)) {
 throw 'Could not launch $_url';
 }
}

**WhatsApp**

El link que se uso para enviar el mensaje a WhatsApp, directamente traído desde el api que garantiza su función tanto en WhatsApp web como en el aplicativo móvil. A este link se le carga una variable con toda la información de la factura para que el vendedor tenga en cuenta la información sobre los productos que vendió para su respectiva entrega.
**
Link:**

https://wa.me/${telefono}?text=${variable con la factura}


### **Figma:**

En este figma tenemos la idea inicial de lo que será nuestro proyecto, este figma consta de 15 pantallas:
- Pantalla- login
- Pantalla-pedidos del usuario
- Pantalla-Inicio
- Pantalla-Drawer
- Pantalla-Modal
- Pantalla-Envio de factura whatsApp
- Pantalla-Inicio sesión para acceder al carrito
- Pantalla-Restablecer contraseña 1
- Pantalla-Restablecer contraseña 2
- Pantalla-Registro de usuario
- Pantalla-Inicio 2
- Pantalla-Modal 2
- Pantalla-Buscador 1
- Pantalla-Buscador 2
- Pantalla-Drawer 2

Link para visualizar la maqueta:

https://www.figma.com/proto/y1tBzhQnb44mvvNTli03NT/Untitled?node-id=45%3A3&scaling=scale-down&page-id=0%3A1&starting-point-node-id=45%3A3&show-proto-sidebar=1




### **Buscador:**
SearchDelegate:

La aplicación contiene un AppBar, allí se encuentra un icono de una lupa donde los usuarios pueden buscar los productos que necesiten.
![image](https://user-images.githubusercontent.com/98421206/206737504-0b9667db-4274-477a-900c-c347860e61b2.png)
 
Al darle click al icono nos despliega una nueva pestaña que contiene 2 iconos mas y como tal el buscador, 
el primer icono es un arrow back (flecha para ir atrás) este icono se puede personalizar a través de  SearchDelegate.buildLeading donde se le dará su funcionamiento para regresar a la pantalla inicial
 
El segundo icono es una “X” que nos sirve para limpiar lo que el usuario digite, la funcionalidad de este y su personalización se pueden encontrar en SearchDelegate.buildActions .

![image](https://user-images.githubusercontent.com/98421206/206739598-a35fe1c2-eeb0-44dc-bc7c-4eddf8934754.png)
 
Tenemos otra opción para mostrar consultas sugeridas para el usuario el cual se realiza con 
SearchDelegate.buildSuggestions.
Cuando el usuario realiza la busqueda del producto, los resultados de la consulta serán regresados por SearchDelegate.buildResults.

Los resultados se pueden mostrar en la pantalla llamando a SearchDelegate.showResults y puede volver a mostrar las sugerencias llamando a SearchDelegate.showSuggestions .
Una vez que el usuario ha seleccionado un resultado de búsqueda, se debe llamar a SearchDelegate.close para eliminar la página de búsqueda de la parte superior de la pila de navegación y notificar a la persona que llama a showSearch sobre el resultado de búsqueda seleccionado.


### **Tabbar:**

En este tabbar que está debajo del AppBar, contiene 3 categorias, las cuales son:
-Lacteos
-Carnicos
-Frutas y Verduras

Cada carta del contenido cuenta con dos botones que son:
Añadir al carrito: nos agrega el producto al carrito de compras
Ver más: Nos muestra en pantalla un modal con detalles del producto

Login:

En esta pantalla nos muestra el login que cuanta con dos Textfield para que el usuario digite el email y su contraseña,. En la parte inferior de los Textfield tenemos 3 diferentes opciones que nos dirigen a otras pantallas, estas opciones son:
¿Olvido la contraseña?
En esta opción nos dirige a una página donde nos indica el paso a paso para restablecer la contraseña por si al usuario se le olvida la contraseña.

Iniciar Sesión
Una vez el usuario digita su email y contraseña correcto verificados en la base de datos Firebase se procede a dar click al botón donde lo dirige a la página principal de la aplicación.
¡Regístrese ahora!
Esta opción nos dirige a la página de registro en caso de que el usuario no tenga cuenta, allí nos pide varios datos para el registro que son:

- Nombres
- Apellidos
- Nombre de Usuario
- Tipo de Documento
- Numero de documento
- Teléfono fijo
- Teléfono celular
- Email
- Contraseña
- Confirmar Contraseña

Luego de estos datos hay un botón llamado “Registrarse Ahora” el cual nos envía la información nueva del usuario, abajo tenemos la opción “Iniciar Sesión” que nos dirige de nuevo al apartado de Iniciar Sesión.

![image](https://user-images.githubusercontent.com/98421206/206740740-ecca410c-105d-4f83-b666-19df3d01a458.png)

![image](https://user-images.githubusercontent.com/98421206/206740956-f3b17b37-b444-4ac8-9268-c7975e8bd819.png)




### **Librerías usadas para crear el pdf:**

pdf: ^3.8.4
printing: ^5.9.3
open_file: ^3.2.1

Además de las librerías anteriores, para desarrollar la parte del pdf utilizamos, las siguientes librerías:
- La primera librería que se utilizó fue pdf: ^3.8.4 :
La librería pdf, puede crear un documento completo de varias páginas con gráficos, imágenes y texto utilizando fuentes TrueType. Con la facilidad de uso que ya conoces.

Para hacer uso de aquella librería tenemos que importar las bibliotecas
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

**Un claro ejemplo seria el siguiente:**

final pdf = pw.Document();

pdf.addPage(pw.Page(
      pageFormat: PdfPageFormat.a4,
      build: (pw.Context context) {
        return pw.Center(
          child: pw.Text("Hello World"),
        ); // Center
      })); // Pag

**Para cargar una imagen desde la red usando el printing paquete**

final netImage = await networkImage('https://www.nfet.net/nfet.jpg');

pdf.addPage(pw.Page(build: (pw.Context context) {
  return pw.Center(
    child: pw.Image(netImage),
  ); // Center
})); // Page



**
Ejemplo más completo:**

import 'dart:io';

import 'package:pdf/widgets.dart' as pw;

Future<void> main() async {
  final pdf = pw.Document();

  pdf.addPage(
    pw.Page(
      build: (pw.Context context) => pw.Center(
        child: pw.Text('Hello World!'),
      ),
    ),
  );

  final file = File('example.pdf');
  await file.writeAsBytes(await pdf.save());
}
- La segunda librería que utilizamos para generar el pdf fue:
printing: ^5.9.3:
Un complemento que permite que las aplicaciones de Flutter generen e 		impriman documentos en impresoras compatibles con Android o iOS.
Esta librería la utilizamos para imprimir o descargar el pdf  de la compra. 

![image](https://user-images.githubusercontent.com/98421206/206741481-9d00432d-8242-4bab-b12c-c6cce8d6442f.png)


 

**Instalación:**

1.	Agregue este paquete al pubspec.yaml archivo de su paquete como se describe en la pestaña de instalación
2.	Importar las bibliotecas
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart'

Ejemplo:
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

Future<void> main() async {
  runApp(const MyApp('Printing Demo'));
}

class MyApp extends StatelessWidget {
  const MyApp(this.title, {Key? key}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text(title)),
        body: PdfPreview(
          build: (format) => _generatePdf(format, title),
        ),
      ),
    );
  }

  Future<Uint8List> _generatePdf(PdfPageFormat format, String title) async {
    final pdf = pw.Document(version: PdfVersion.pdf_1_5, compress: true);
    final font = await PdfGoogleFonts.nunitoExtraLight();

   



 pdf.addPage(
      pw.Page(
        pageFormat: format,
        build: (context) {
          return pw.Column(
            children: [
              pw.SizedBox(
                width: double.infinity,
                child: pw.FittedBox(
                  child: pw.Text(title, style: pw.TextStyle(font: font)),
                ),
              ),
              pw.SizedBox(height: 20),
              pw.Flexible(child: pw.FlutterLogo())
            ],
          );
        },
      ),
    );

    return pdf.save();
  }
}
open_file: ^3.2.1
Esta librería es un complemento para llamar a la aplicación nativa para	abrir archivos con resultado de cadena en flutter, compatible con ios, 	Android, pc y web.
dependencies:
  androidx
  open_file: ^ 3.2.1
  support
  open_file: ^1.3.0
import 'package:open_file/open_file.dart';


flutter_zoom_drawer: ^3.0.3
La librería zoom drawer, fue utilizada para darle una mejor imagen al 	drawer, como se muestra en la siguiente imagen:

![image](https://user-images.githubusercontent.com/98421206/206741590-8226e74a-acda-4be8-ab0d-660627cacf8f.png)

![image](https://user-images.githubusercontent.com/98421206/206741607-6df9d4d5-854b-4b3d-8788-5b97e3145180.png)

  


Zoom Drawer es una biblioteca para agregar una hermosa función de menú de modo de cajón deslizante con animaciones de menú. Usando esto, podemos convertirlo en un menú completamente personalizado según nuestros requisitos, podemos usar muchos tipos de controles deslizantes en el paquete del cajón de zoom.

Esto agregará una línea como esta al pubspec.yaml de su paquete (y ejecutará un implícito flutter pub get):

dependencies:
  flutter_zoom_drawer: ^3.0.3

Alternativamente, su editor podría admitir flutter pub get. Consulte los 		documentos de su editor para obtener más información.
Importarlo
Ahora en su código Dart, puede usar:
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';

**Formato imágenes:**

Se realizaron 30 imágenes por cada sesión (10 en la sesión de frutas y
verdura, 10 en lácteos y 10 en cárnicos) las imágenes tienen un formato
png por lo cual están de 300 de alto y 300 de ancho para que se vea de
una mejor forma y proporción en la Card.

![image](https://user-images.githubusercontent.com/98421206/206742121-77053496-2ffa-457b-835d-3da1003fa3d0.png)



**Epayco**
funciona creando un formulario HTML el cual valida la información de
entrada para asegurar los datos de sus clientes.

Uso
- La integración es personalizada y de forma sencilla se puede incluir nuestra librería de javascript del checkout en su sitio web.
-  Las respuestas de los estados de las transacciones son realizadas en
- JSON.
- La url de respuesta es utilizada para redirigir al usuario una vez terminada la operación. Se recomienda enviar en la URL un dato con el cual el sitio pueda identificar el registro

**Métodos de integración**

**Onpagecheckout:** este sirve para tener una mejor experiencia sin salirse
de la web, permite guardar información de tarjetas de crédito para futuras
compras, adaptable a todos los dispositivos, se incluyen todos los medios
de pago.

![image](https://user-images.githubusercontent.com/98421206/206742223-189db7f9-ceb0-4474-bca0-cbb7aabff5ba.png)

**Stándar Chechkout**: Tiene dominios seguros es decir que certifica la
seguridad, permite guardar información de tarjetas de crédito para
futuras compras, multi idioma, personalización (logo, colores,
información), todos los medios de pago incluidos.


![image](https://user-images.githubusercontent.com/98421206/206742298-71fadf1a-dd4a-48a0-8188-e076f673dfcf.png)


**
Como se generan los medios de pago en prueba**

ePayco le permite generar transacciones de prueba con el fin de que
pueda validar el funcionamiento de cada medio de pago y la respuesta
que obtiene al procesar una transacción.

![image](https://user-images.githubusercontent.com/98421206/206742400-105e04c2-bfa8-49d2-9d30-f16e5a24031b.png)


**Tarjeta de Crédito de prueba**
Luego de escoger el medio de pago Daviplata se ingresan datos, donde
piden su correo electrónico, nombres, tipo de documento, luego se da clic
en ‘Continuar’ donde se obtendrá un código de confirmación de forma
automática y se procesaran las transacciones

![image](https://user-images.githubusercontent.com/98421206/206742475-d4a9c656-4f65-4083-85bf-96ca6abc4a56.png)







