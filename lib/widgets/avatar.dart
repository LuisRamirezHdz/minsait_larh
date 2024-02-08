part of 'widgets.dart';

class Avatar extends StatefulWidget {
  final String? url;
  final double? radius;

  const Avatar({
    Key? key,
    this.url = "",
    this.radius = 0,
  }) : super(key: key);

  @override
  State<Avatar> createState() => _AvatarState();
}

class _AvatarState extends State<Avatar> {
  dynamic screen;

  @override
  Widget build(BuildContext context) {
    screen = MediaQuery.of(context).size;

    if (widget.url == "")
      return CircleAvatar(
        radius: widget.radius,
        backgroundImage: AssetImage('assets/images/no_avatar.png'),
        backgroundColor: Colors.transparent,
      );
    //if ( picture.startsWith('http') )
    return CircleAvatar(
      backgroundColor: Colors.white,
      radius: widget.radius,
      backgroundImage: /*FadeInImage(
        image: */
          NetworkImage(widget.url!),
      /* placeholder: AssetImage('assets/jar-loading.gif'),
        fit: BoxFit.cover,
      ),*/
    );
    /* return FadeInImage(
      width: widget.radius,
      image: NetworkImage(widget.url!),
      placeholder: AssetImage('assets/jar-loading.gif'),
      fit: BoxFit.cover,
    );*/
  }
}
