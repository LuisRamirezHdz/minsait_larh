part of 'styles.dart';

const theme = Color(0xFF183051);

const primary = Color.fromRGBO(27, 59, 75, 1);
const secondary = Color(0x99183051);

const grey = Color(0xFF707070);
const greyText = Color.fromARGB(0, 0, 0, 1);

const greyLight = Color.fromARGB(255, 244, 243, 243);

const orange = Color(0xFFE15C0A);
const orangeLight = Color.fromARGB(128, 225, 92, 10);

const green = Color(0xFF46E240);
const lightGrey = Color.fromARGB(172, 255, 255, 255);

const loginBackground = Color(0xFF2A4F82);

LinearGradient blackGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      const Color(0xFF000000).withOpacity(0.4),
      const Color(0xFF000000).withOpacity(0.1),
      const Color(0xFF000000).withOpacity(0.4),
    ]);

LinearGradient primaryGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      const Color(0xFF183051),
      const Color(0xFF183051).withOpacity(0.3),
    ]);
