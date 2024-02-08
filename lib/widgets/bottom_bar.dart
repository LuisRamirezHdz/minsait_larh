part of 'widgets.dart';

enum ActiveBottomBarIcon {
  home,
  profile,
  map,
}

class BottomBar extends StatefulWidget {
  final VoidCallback? home;
  final VoidCallback? balance;
  final VoidCallback? tracking;
  final ActiveBottomBarIcon active;

  BottomBar(
      {Key? key,
      this.home,
      this.balance,
      this.tracking,
      this.active = ActiveBottomBarIcon.home})
      : super(key: key);

  @override
  _BottomBarState createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  var screen;
  var safePadding;
  var normalIconSize;
  var selectedIconSize;

  @override
  Widget build(BuildContext context) {
    screen = MediaQuery.of(context).size;
    safePadding = MediaQuery.of(context).padding;
    normalIconSize = screen.width / 13;
    selectedIconSize = screen.width / 6.5;

    return Container(
      height: screen.height,
      width: screen.width,
      child: Column(
        children: [
          Expanded(child: Container()),
          Container(
            //height: (screen.height * 0.12),
            child: Stack(
              children: [
                Column(
                  children: [
                    Container(
                      //height: (screen.height / 28),
                      height: (screen.height / 25) - safePadding.bottom / 5,
                      width: screen.width,
                      color: Colors.transparent,
                    ),
                    Container(
                      //height: (screen.height / 8.5),
                      height: (screen.height / 8.7) - safePadding.bottom / 5,
                      width: screen.width,
                      color: primary,
                    ),
                  ],
                ),
                Container(
                  color: Colors.transparent,
                  padding: EdgeInsets.only(
                    left: screen.width / 20,
                    right: screen.width / 20,
                    //top: screen.width / 50
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      GestureDetector(
                        child: Container(
                          padding: (widget.active != ActiveBottomBarIcon.home)
                              ? EdgeInsets.only(top: screen.width / 10)
                              : EdgeInsets.only(),
                          child: Column(
                            children: [
                              (widget.active == ActiveBottomBarIcon.home)
                                  ? Container(
                                      width: selectedIconSize,
                                      height: selectedIconSize,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(
                                              screen.width),
                                          color: orange),
                                      padding: const EdgeInsets.all(12.0),
                                      child: Image(
                                          color: Colors.white,
                                          image: AssetImage(
                                              'assets/images/home.png'),
                                          fit: BoxFit.fitWidth),
                                    )
                                  : Container(
                                      width: normalIconSize,
                                      height: normalIconSize,
                                      child: Image(
                                          color: Colors.white,
                                          image: AssetImage(
                                              'assets/images/home.png'),
                                          fit: BoxFit.fitWidth),
                                    ),
                              SizedBox(
                                height: 5,
                              ),
                              Container(
                                  width: 70,
                                  height: 30,
                                  child: Text(
                                    'Home',
                                    style: white14W400,
                                    maxLines: 2,
                                    textAlign: TextAlign.center,
                                  ))
                            ],
                          ),
                        ),
                        onTap: widget.home ??
                            () => Navigator.of(context)
                                .pushReplacementNamed(Home.route),
                      ),
                      GestureDetector(
                        child: Container(
                          padding: (widget.active == ActiveBottomBarIcon.home)
                              ? EdgeInsets.only(top: screen.width / 10)
                              : EdgeInsets.only(),
                          child: Column(
                            children: [
                              (widget.active == ActiveBottomBarIcon.map)
                                  ? Container(
                                      width: selectedIconSize,
                                      height: selectedIconSize,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(
                                              screen.width),
                                          color: orange),
                                      padding: const EdgeInsets.all(12.0),
                                      child: Image(
                                          image: AssetImage(
                                              'assets/images/map.png'),
                                          color: Colors.white,
                                          fit: BoxFit.fitWidth),
                                    )
                                  : Container(
                                      width: normalIconSize,
                                      height: normalIconSize,
                                      child: Image(
                                          color: Colors.white,
                                          image: AssetImage(
                                              'assets/images/map.png'),
                                          fit: BoxFit.fitWidth),
                                    ),
                              SizedBox(
                                height: 5,
                              ),
                              Container(
                                  width: 80,
                                  height: 30,
                                  child: Text(
                                    'Mapa',
                                    style: white14W400,
                                    maxLines: 2,
                                    textAlign: TextAlign.center,
                                  ))
                            ],
                          ),
                        ),
                        onTap: widget.balance ??
                            () => Navigator.of(context)
                                .pushReplacementNamed(MapScreen.route),
                      ),
                      GestureDetector(
                        child: Column(
                          children: [
                            (widget.active == ActiveBottomBarIcon.profile)
                                ? Container(
                                    width: selectedIconSize,
                                    height: selectedIconSize,
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(screen.width),
                                        color: orange),
                                    padding: const EdgeInsets.all(12.0),
                                    child: Image(
                                        color: Colors.white,
                                        image: AssetImage(
                                            'assets/images/profile.png'),
                                        fit: BoxFit.fitWidth),
                                  )
                                : Container(
                                    width: normalIconSize,
                                    height: normalIconSize,
                                    child: Image(
                                        color: Colors.white,
                                        image: AssetImage(
                                            'assets/images/profile.png'),
                                        fit: BoxFit.fitWidth),
                                  ),
                            SizedBox(
                              height: 5,
                            ),
                            Container(
                                width: 85,
                                height: 30,
                                child: Text(
                                  'Perfil',
                                  //'Tracking de pedidos',
                                  style: white14W400,
                                  maxLines: 2,
                                  textAlign: TextAlign.center,
                                ))
                          ],
                        ),
                        onTap: widget.tracking ??
                            () => Navigator.of(context)
                                .pushReplacementNamed(Profile.route),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
