import "dart:io";
import "package:flutter/cupertino.dart";
import "package:flutter/material.dart";
import "package:image_picker/image_picker.dart";
import "package:path_provider/path_provider.dart";
import "package:social_media/models/User_preferences.dart";
import "package:social_media/models/user.dart";
import "package:social_media/widgets/ProfileWidget.dart";
import "package:social_media/widgets/button_widget.dart";
import "package:social_media/widgets/textfield_widget.dart";
import 'package:path/path.dart';

class EditProfilePage extends StatefulWidget {
  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  late User user;
  final icon = CupertinoIcons.moon_stars;
  @override
  void initState() {
    super.initState();

    user = UserPreferences.getUser();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          leading: BackButton(),
          backgroundColor: Colors.transparent,
          elevation: 0,
          actions: [
            IconButton(
              icon: Icon(icon),
              onPressed: () {},
            ),
          ],
        ),
        body: ListView(
          padding: EdgeInsets.symmetric(horizontal: 32),
          physics: BouncingScrollPhysics(),
          children: [
            ProfileWidget(
              imagePath: user.imagePath,
              isEdit: true,
              onClicked: () async {
                final image =
                    await ImagePicker().getImage(source: ImageSource.gallery);

                if (image == null) return;

                final directory = await getApplicationDocumentsDirectory();
                final name = basename(image.path);
                final imageFile = File('${directory.path}/$name');
                final newImage = await File(image.path).copy(imageFile.path);

                setState(() => user = user.copy(imagePath: newImage.path));
              },
            ),
            const SizedBox(
              height: 24,
            ),
            TextFieldWidget(
              label: 'Full Name',
              text: user.name,
              onChanged: (name) => user = user.copy(name: name),
            ),
            const SizedBox(
              height: 24,
            ),
            TextFieldWidget(
              label: 'Email',
              text: user.email,
              onChanged: (email) => user = user.copy(email: email),
            ),
            const SizedBox(
              height: 24,
            ),
            TextFieldWidget(
              label: 'About',
              text: user.about,
              maxLines: 5,
              onChanged: (about) => user = user.copy(about: about),
            ),
            const SizedBox(
              height: 24,
            ),
            ButtonWidget(
              text: 'save',
              onClicked: () {
                UserPreferences.setUser(user);
                Navigator.of(context).pop();
              },
            ),
          ],
        ),
      );
}
