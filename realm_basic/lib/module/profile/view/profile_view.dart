import 'package:flutter/material.dart';
import 'package:realm_basic/core.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({Key? key}) : super(key: key);

  Widget build(context, ProfileController controller) {
    controller.view = this;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile"),
        actions: [
          IconButton(
            onPressed: () async {
              var users = UserProfileService.instance.get();
              for (var user in users) {
                UserProfileService.instance.delete(user as UserProfile);
              }
              controller.doLogout();
            },
            icon: const Icon(
              Icons.refresh,
              size: 24.0,
            ),
          ),
          IconButton(
            onPressed: () => controller.doLogout(),
            icon: const Icon(
              Icons.logout,
              size: 24.0,
            ),
          ),
        ],
      ),
      body: Container(
        padding: const EdgeInsets.all(20.0),
        child: StreamBuilder(
          stream: UserProfileService.instance.currentUserSnapshot(),
          builder: (context, snapshot) {
            if (snapshot.data == null) return Container();
            if (snapshot.data!.results.isEmpty) return Container();
            var data = snapshot.data?.results.first;

            return Column(
              children: [
                QImagePicker(
                  label: "Photo",
                  hint: "Your photo",
                  validator: Validator.required,
                  value: data?.photo,
                  onChanged: (value) {
                    UserProfileService.instance.updateProfile(
                      photo: value,
                    );
                  },
                ),
                QTextField(
                  label: "Name",
                  hint: "Your email",
                  validator: Validator.required,
                  suffixIcon: Icons.abc,
                  value: data?.name,
                  onChanged: (value) {
                    UserProfileService.instance.updateProfile(
                      name: value,
                    );
                  },
                ),
                QTextField(
                  label: "Email",
                  hint: "Your email",
                  validator: Validator.email,
                  suffixIcon: Icons.email,
                  value: data?.email,
                  enabled: false,
                  onChanged: (value) {},
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  @override
  State<ProfileView> createState() => ProfileController();
}
