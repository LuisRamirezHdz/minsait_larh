import 'package:flutter/material.dart';
import 'package:minsait_larh/providers/review_list_provider.dart';
import 'package:minsait_larh/styles/styles.dart';
import 'package:provider/provider.dart';
import '../../widgets/widgets.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});
  static const route = 'Profile';

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  dynamic scaffoldKey = GlobalKey<ScaffoldState>();
  dynamic screen;
  dynamic safePadding;
  dynamic user;
  bool edit = false;

  // Focus
  FocusNode emailFocus = new FocusNode();

  @override
  void initState() {
    final reviewListProvider =
        Provider.of<ReviewListProvider>(context, listen: false);
    if (reviewListProvider.reviews.isEmpty) reviewListProvider.cargarReviews();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    screen = MediaQuery.of(context).size;
    safePadding = MediaQuery.of(context).padding;

    return Board(
      scaffoldKey: scaffoldKey,
      bottomBar: BottomBar(active: ActiveBottomBarIcon.profile),
      body: Stack(
        children: [
          const BackBodyApp(),
          SizedBox(
            height: screen.height,
            width: screen.width,
            child: Container(
                padding: EdgeInsets.symmetric(horizontal: screen.width / 20),
                child: Column(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [_profileDetails(), _down()],
                    ),
                  ],
                )),
          ),
        ],
      ),
    );
  }

  Widget _profileDetails() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: () async {
            //await _sinkPhoto();
          },
          child: Stack(alignment: Alignment.bottomRight, children: [
            Avatar(
                url:
                    "https://enertic.org/wp-content/uploads/2019/10/Minsait-e1575544359452.png",
                radius: screen.height / 18),
            /*Container(
              width: screen.width / 100,
              child: Icon(
                Icons.edit,
                color: Colors.white,
              ),
            ),*/
          ]),
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: screen.height / 75,
              ),
              Text(
                '¡Hola!',
                style: white18W400,
              ),
              SizedBox(
                height: screen.height / 50,
              ),
              Text(
                'Usuario',
                style: white18W600,
              ),
              SizedBox(
                height: screen.height / 150,
              ),
              Text(
                'Luis Angel Ramírez',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: white16W400,
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _down() {
    final reviewListProvider =
        Provider.of<ReviewListProvider>(context, listen: false);
    final reviews = reviewListProvider.reviews;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(
          height: screen.height / 50,
        ),
        SizedBox(
          height: screen.height / 1.58,
          width: screen.width - 2 * (screen.width / 10),
          child: SingleChildScrollView(
            physics: const ClampingScrollPhysics(),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              const Text(
                "Mis reseñas",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: screen.height / 2,
                // ignore: unnecessary_null_comparison
                child: reviews.isNotEmpty
                    ? ListView.builder(
                        itemCount: reviews.length,
                        itemBuilder: (_, i) => review(reviews[i]))
                    : Container(
                        child: Text(
                          "Aquí apareceran las reseñas que hagas",
                          style: black18W400,
                        ),
                      ),
              ),
              SizedBox(height: screen.height / 50),
              SizedBox(height: screen.height / 50),
            ]),
          ),
        ),
      ],
    );
  }

  Widget review(data) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Container(
          decoration: BoxDecoration(border: Border.all(color: primary)),
          padding: const EdgeInsets.all(10),
          margin: const EdgeInsets.symmetric(vertical: 10),
          height: screen.height / 10,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                data.movie,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: primary16W600,
              ),
              Text(
                data.review,
                style: primary14W300,
              ),
            ],
          )),
    );
  }
/*
  Future<void> _sinkPhoto() async {
    print("Tap foto");
    final pickedImage = await ImagePicker()
        .pickImage(source: ImageSource.gallery, maxWidth: 700);

    if (pickedImage != null) {
      BlocProvider.of<LoaderBloc>(context).show();

      File avatar = File(pickedImage.path);

      //Firebase
      f_storage.Reference storage = f_storage.FirebaseStorage.instance
          .ref()
          .child('user/' + _prefs.uuid.toString() + '/');

      final res = await FirebaseProvider.uploadFile(
          avatar,
          storage,
          FirebaseFirestore.instance.collection('user').doc(_prefs.uuid),
          'avatar');

      if (res['result'] == 'success') {
        BlocProvider.of<LoaderBloc>(context).dismiss();
        DocumentReference? userDocumentReference =
            FirebaseFirestore.instance.collection('user').doc(_prefs.uuid);
        FirebaseProvider.updateData(
            userDocumentReference, {"avatar": res['response']});
      } else {
        BlocProvider.of<LoaderBloc>(context).dismiss();

        alert(context, screen, 'Notificación',
            'No se pudo guardar la nueva foto');
      }
    }
  }
*/
}
