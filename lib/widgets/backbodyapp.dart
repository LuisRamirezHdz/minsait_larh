part of 'widgets.dart';

class BackBodyApp extends StatelessWidget {
  const BackBodyApp({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screen = MediaQuery.of(context).size;

    return Container(
      height: screen.height,
      width: screen.width,
      color: Colors.white,
      child: Column(
        children: [
          Container(
            height: 0.15 * screen.height,
            width: screen.width,
            color: primary,
          ),
        ],
      ),
    );
  }
}
