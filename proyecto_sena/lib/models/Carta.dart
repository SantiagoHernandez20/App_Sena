// Modelo para el contenido de las cartas 

class Carta{
  final int id;
  final String nombre;
  final double precio;
  final String imagen;
  final String descripcion;

  const Carta({required this.id,required this.nombre,required this.precio,required this.imagen,required this.descripcion});
}

final lacteos = [
  const Carta(id: 1, nombre: "Botella de Leche", precio: 14000, imagen: "leche.png", descripcion: "La leche proporciona nutrientes esenciales y es una fuente importante de energía\nalimentaria, proteínas de alta calidad y grasas."),
  const Carta(id: 2, nombre: "Tarro de Arequipe", precio: 8000, imagen: "arequipe.png", descripcion: "El dulce de leche, también conocido como arequipe es un producto elaborado a base de azúcar y leche."),
  const Carta(id: 3, nombre: "Calostros", precio: 5000, imagen: "calostros.png", descripcion: "El calostro es rico en inmunoglobulinas, que ofrecen una protección natural a los terneros recién nacidos."),
  const Carta(id: 4, nombre: "Cuajada x 500G", precio: 10990, imagen: "cuajada.png", descripcion:"La cuajada es un producto lácteo, de textura cremosa,\nelaborado con leche coagulada por acción del cuajo."),
  const Carta(id: 5, nombre: "Flan", precio: 2700, imagen: "flan.png", descripcion:"Se denomina flan a una preparación gastronómica cuyos ingredientes principales son\nazúcar, leche y huevo."),
  const Carta(id: 6, nombre: "Leche Condensada x 400G", precio: 6594, imagen: "condensada.png", descripcion:"La leche condensada se obtiene eliminando parte del agua que contiene la leche de\npartida y añadiendo azúcar."),
  const Carta(id: 7, nombre: "Queso Mozzarella x 250G", precio: 12590, imagen: "mozarela.png", descripcion:"La mozzarella es un queso fresco elaborado a partir de la leche de vaca."),
  const Carta(id: 8, nombre: "Leche de Cabra x 1 Litro", precio: 18000,imagen: "leche_cabra.png", descripcion:"La leche de cabra es una mezcla en equilibrio de proteínas, grasas,\ncarbohidratos, sales y otros componentes."),
  const Carta(id: 9, nombre: "Yogur de Fresa", precio: 3190, imagen: "yogur.png", descripcion:"El yogur se define como el producto de leche coagulada obtenida por la\nfermentación láctica producida por la acción de las bacterias."),
  const Carta(id: 10, nombre: "Requeson", precio: 6500, imagen: "requeson.png", descripcion:"El requesón es un derivado lácteo elaborado a partir de la ebullición\ndel suero de leche que sobra al hacer otros quesos de pasta."),
];

final carnicos = [
  const Carta(id: 11, nombre: "Libra de carne", precio: 9000, imagen: "carne.png", descripcion: "La carne es una muy buena fuente de aminoácidos esenciales, vitaminas y minerales."),
  const Carta(id: 12, nombre: "Cubeta de Huevos", precio: 14500, imagen: "huevos.png", descripcion: "Es un alimento de elevado valor nutritivo, siendo su proteína de máxima calidad por su elevado poder biológico."),
  const Carta(id: 13, nombre: "Gallina", precio: 25000, imagen: "gallina.png", descripcion: "La gallina es fuente de minerales, entre ellos hierro y zinc de alta biodisponibilidad."),
  const Carta(id: 14, nombre: "Libra de pernil", precio: 8000, imagen: "pernil.png", descripcion: "La carne de pollo es una de las más recomendadas por los expertos para incorporar a nuestra\ndieta proteínas y nutrientes de alta calidad (valor biológico)."),
  const Carta(id: 15, nombre: "Jamon X 450G", precio: 12100, imagen: "jamon.png", descripcion:"El jamón es el nombre genérico del producto alimenticio obtenido de las patas traseras del cerdo."),
  const Carta(id: 16, nombre: "Salchicha", precio: 3950, imagen: "salchicha.png", descripcion:"Las salchichas son embutidos a base de carne picada."),
  const Carta(id: 17, nombre: "Chorizo", precio: 17590, imagen: "chorizo.png", descripcion:"El chorizo es fuente de minerales: hierro, zinc, magnesio, fósforo, selenio y sodio. "),
  const Carta(id: 18, nombre: "Butifarra", precio: 10390, imagen: "butifarra.png", descripcion:"La butifarra es un embutido fresco compuesto de carne picada de cerdo condimentada con sal,\npimienta y, a veces, otras especias."),
  const Carta(id: 19, nombre: "Tocino", precio: 7740, imagen: "tocino.png", descripcion:"El tocino nos aporta calcio, hierro, fósforo, sodio, potasio, proteínas y vitaminas B1, B6 y B12."),
  const Carta(id: 20, nombre: "Libra de Bagre", precio: 23000, imagen: "bagre.png", descripcion:"El bagre se considera denso en nutrientes, dado que es una buena fuente\nde una variedad de nutrientes pero bajo en calorías."),

];

final frutos = [
  const Carta(id: 21, nombre: "Calabaza", precio:11000, imagen: "calabaza.png", descripcion:"La calabaza es una buena fuente de vitamina E, hierro y ácido fólico."),
  const Carta(id: 22, nombre: "Cilantro", precio: 1000, imagen: "cilantro.png", descripcion:"El cilantro es una fuente maravillosa de fibra dietética, manganeso, hierro y magnesio."),
  const Carta(id: 23, nombre: "Manzana", precio: 1200, imagen: "manzana.png", descripcion:"La manzana es una fruta rica en vitaminas, entre las que destacan\nla vitamina A, la vitamina E o tocoferol y la vitamina C."),
  const Carta(id: 24, nombre: "Mora", precio: 6000, imagen: "moras.png", descripcion:"Una de las principales características de la mora es que aporta una buena cantidad de fibra.\nAsimismo, la mora contiene vitamina C, carotenos y vitamina E."),
  const Carta(id: 25, nombre: "Remolacha", precio: 2500, imagen: "remolacha.png", descripcion:"Es una excelente fuente de ácido fólico, así como de vitamina C y potasio. "),
  const Carta(id: 26, nombre: "Zanahoria X 500G", precio: 4500, imagen: "zanahoria.png", descripcion:"Es rica en varios nutrientes como Vitamina A y Carotenoides.\nSon una fuente de minerales como potasio, fósforo, magnesio, yodo y calcio."),
  const Carta(id: 27, nombre: "Cebolla Cabezona X 500G", precio: 5900, imagen: "cebolla_cabezona.png", descripcion:"La cebolla contiene azúcar natural, vitaminas A, B6, C y E.\nTambién minerales como el sodio, potasio, hierro y fibra alimentaria."),
  const Carta(id: 28, nombre: "Fresa 500G", precio: 5690, imagen: "fresa.png", descripcion:"Es rica en antioxidantes y minerales como manganesio, magnesio y potasio. Tiene vitamina C, B2, B3 y ácido fólico."),
  const Carta(id: 29, nombre: "Lechuga", precio: 5490, imagen: "lechuga.png", descripcion:"La lechuga es un alimento que aporta muy pocas calorías por su alto contenido en\nagua y su escasa cantidad de hidratos de carbono, proteínas y grasas."),
  const Carta(id: 30, nombre: "Arandano X 125G", precio: 7500, imagen: "arandano.png", descripcion:"Los arándanos azules son ricos en fibra, vitamina C, vitamina K y Manganeso."),
];

final todos = [
  const Carta(id: 1, nombre: "Botella de Leche", precio: 14000, imagen: "leche.png", descripcion: "La leche proporciona nutrientes esenciales y es una fuente importante de energía\nalimentaria, proteínas de alta calidad y grasas."),
  const Carta(id: 2, nombre: "Tarro de Arequipe", precio: 8000, imagen: "arequipe.png", descripcion: "El dulce de leche, también conocido como arequipe es un producto elaborado a base de azúcar y leche."),
  const Carta(id: 3, nombre: "Calostros", precio: 5000, imagen: "calostros.png", descripcion: "El calostro es rico en inmunoglobulinas, que ofrecen una protección natural a los terneros recién nacidos."),
  const Carta(id: 4, nombre: "Cuajada x 500G", precio: 10990, imagen: "cuajada.png", descripcion:"La cuajada es un producto lácteo, de textura cremosa,\nelaborado con leche coagulada por acción del cuajo."),
  const Carta(id: 5, nombre: "Flan", precio: 2700, imagen: "flan.png", descripcion:"Se denomina flan a una preparación gastronómica cuyos ingredientes principales son\nazúcar, leche y huevo."),
  const Carta(id: 6, nombre: "Leche Condensada x 400G", precio: 6594, imagen: "condensada.png", descripcion:"La leche condensada se obtiene eliminando parte del agua que contiene la leche de\npartida y añadiendo azúcar."),
  const Carta(id: 7, nombre: "Queso Mozzarella x 250G", precio: 12590, imagen: "mozarela.png", descripcion:"La mozzarella es un queso fresco elaborado a partir de la leche de vaca."),
  const Carta(id: 8, nombre: "Leche de Cabra x 1 Litro", precio: 18000,imagen: "leche_cabra.png", descripcion:"La leche de cabra es una mezcla en equilibrio de proteínas, grasas,\ncarbohidratos, sales y otros componentes."),
  const Carta(id: 9, nombre: "Yogur de Fresa", precio: 3190, imagen: "yogur.png", descripcion:"El yogur se define como el producto de leche coagulada obtenida por la\nfermentación láctica producida por la acción de las bacterias."),
  const Carta(id: 10, nombre: "Requeson", precio: 6500, imagen: "requeson.png", descripcion:"El requesón es un derivado lácteo elaborado a partir de la ebullición\ndel suero de leche que sobra al hacer otros quesos de pasta."),
  const Carta(id: 11, nombre: "Libra de carne", precio: 9000, imagen: "carne.png", descripcion: "la carne es una muy buena fuente de aminoácidos esenciales, vitaminas y minerales."),
  const Carta(id: 12, nombre: "Cubeta de Huevos", precio: 14500, imagen: "huevos.png", descripcion: "Es un alimento de elevado valor nutritivo, siendo su proteína de máxima calidad por su elevado poder biológico."),
  const Carta(id: 13, nombre: "Gallina", precio: 25000, imagen: "gallina.png", descripcion: "La gallina es fuente de minerales, entre ellos hierro y zinc de alta biodisponibilidad."),
  const Carta(id: 14, nombre: "Libra de pernil", precio: 8000, imagen: "pernil.png", descripcion: "La carne de pollo es una de las más recomendadas por los expertos para incorporar a nuestra\ndieta proteínas y nutrientes de alta calidad (valor biológico)."),
  const Carta(id: 15, nombre: "Jamon X 450G", precio: 12100, imagen: "jamon.png", descripcion:"El jamón es el nombre genérico del producto alimenticio obtenido de las patas traseras del cerdo."),
  const Carta(id: 16, nombre: "Salchicha", precio: 3950, imagen: "salchicha.png", descripcion:"Las salchichas son embutidos a base de carne picada."),
  const Carta(id: 17, nombre: "Chorizo", precio: 17590, imagen: "chorizo.png", descripcion:"El chorizo es fuente de minerales: hierro, zinc, magnesio, fósforo, selenio y sodio. "),
  const Carta(id: 18, nombre: "Butifarra", precio: 10390, imagen: "butifarra.png", descripcion:"La butifarra es un embutido fresco compuesto de carne picada de cerdo condimentada con sal,\npimienta y, a veces, otras especias."),
  const Carta(id: 19, nombre: "Tocino", precio: 7740, imagen: "tocino.png", descripcion:"El tocino nos aporta calcio, hierro, fósforo, sodio, potasio, proteínas y vitaminas B1, B6 y B12."),
  const Carta(id: 20, nombre: "Libra de Bagre", precio: 23000, imagen: "bagre.png", descripcion:"El bagre se considera denso en nutrientes, dado que es una buena fuente\nde una variedad de nutrientes pero bajo en calorías."),
  const Carta(id: 21, nombre: "Calabaza", precio:11000, imagen: "calabaza.png", descripcion:"La calabaza es una buena fuente de vitamina E, hierro y ácido fólico."),
  const Carta(id: 22, nombre: "Cilantro", precio: 1000, imagen: "cilantro.png", descripcion:"El cilantro es una fuente maravillosa de fibra dietética, manganeso, hierro y magnesio."),
  const Carta(id: 23, nombre: "Manzana", precio: 1200, imagen: "manzana.png", descripcion:"La manzana es una fruta rica en vitaminas, entre las que destacan\nla vitamina A, la vitamina E o tocoferol y la vitamina C."),
  const Carta(id: 24, nombre: "Mora", precio: 6000, imagen: "moras.png", descripcion:"Una de las principales características de la mora es que aporta una buena cantidad de fibra.\nAsimismo, la mora contiene vitamina C, carotenos y vitamina E."),
  const Carta(id: 25, nombre: "Remolacha", precio: 2500, imagen: "remolacha.png", descripcion:"Es una excelente fuente de ácido fólico, así como de vitamina C y potasio. "),
  const Carta(id: 26, nombre: "Zanahoria X 500G", precio: 4500, imagen: "zanahoria.png", descripcion:"Es rica en varios nutrientes como Vitamina A y Carotenoides.\nSon una fuente de minerales como potasio, fósforo, magnesio, yodo y calcio."),
  const Carta(id: 27, nombre: "Cebolla Cabezona X 500G", precio: 5900, imagen: "cebolla_cabezona.png", descripcion:"La cebolla contiene azúcar natural, vitaminas A, B6, C y E.\nTambién minerales como el sodio, potasio, hierro y fibra alimentaria."),
  const Carta(id: 28, nombre: "Fresa 500G", precio: 5690, imagen: "fresa.png", descripcion:"Es rica en antioxidantes y minerales como manganesio, magnesio y potasio. Tiene vitamina C, B2, B3 y ácido fólico."),
  const Carta(id: 29, nombre: "Lechuga", precio: 5490, imagen: "lechuga.png", descripcion:"La lechuga es un alimento que aporta muy pocas calorías por su alto contenido en\nagua y su escasa cantidad de hidratos de carbono, proteínas y grasas."),
  const Carta(id: 30, nombre: "Arandano X 125G", precio: 7500, imagen: "arandano.png", descripcion:"Los arándanos azules son ricos en fibra, vitamina C, vitamina K y Manganeso."),
];