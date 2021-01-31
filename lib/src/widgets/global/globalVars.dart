library my_prj.globals;

//LOG SECURITY
bool isLogged = false;

//DATA SETTINGS
//server
String ip = "137.116.219.96";
String port = "80";

//casa
// String ip = "192.168.0.13";
// String port = "8080";

//clase
// String ip = "10.10.12.219";
// String port = "8080";

//ASSETS
String assetsPathIcon = "public/assets/icons";
String assetsPathImages = "public/assets/img";

//USER
int id = null;
String name = null;
String apellido = null;
String email = null;

//DATA
var localizaciones = [];
var rutas = [];
var puntos = [];


//FILTER DATA
String loc = null;
String trans = null;
String ruta_nombre = null;
bool ruta_iniciada = false;