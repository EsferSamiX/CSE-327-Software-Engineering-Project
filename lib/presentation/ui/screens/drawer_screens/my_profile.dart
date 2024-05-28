import 'package:flutter/material.dart';
import 'package:relax_ride/getx_controller/main_controller.dart';
import 'package:relax_ride/presentation/ui/utility/app_colors.dart';

class MyProfile extends StatefulWidget {
  const MyProfile({super.key});

  @override
  State<MyProfile> createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
  MainController mainController = MainController();

  @override
  void initState() {
    super.initState();
    // Call getUserDetails() when the page loads
    // getUserDetails();
  }

  @override
  Widget build(BuildContext context) {
    mainController.fnameController.text =
        mainController.userData.data!.fname.toString();
    mainController.lnameController.text =
        mainController.userData.data!.lname.toString();
    mainController.phoneController.text =
        mainController.userData.data!.phone.toString();
    mainController.cityController.text =
        mainController.userData.data!.city.toString();
    mainController.emailController.text =
        mainController.userData.data!.email.toString();
    String username = mainController.userData.data!.fname.toString() +
        mainController.userData.data!.fname.toString();

    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Container(
                  height: MediaQuery.of(context).size.height / 3,
                  color: AppColors.primaryColor,
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        const Text(
                          'Profile',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Stack(
                          alignment: AlignmentDirectional.bottomEnd,
                          children: [
                            const CircleAvatar(
                              radius: 60,
                              backgroundImage:
                                  AssetImage('assets/images/user1.png'),
                            ),
                            Positioned(
                              right: 0,
                              bottom: 0,
                              child: GestureDetector(
                                onTap: () {
                                  _showProfileOptionsDialog(context);
                                },
                                child: Container(
                                  padding: const EdgeInsets.all(8),
                                  decoration: const BoxDecoration(
                                    color: Colors.white,
                                    shape: BoxShape.circle,
                                  ),
                                  child: const Icon(Icons.camera_alt_outlined),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        Text(
                          username,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          mainController.userData.data!.phone.toString(),
                          style: const TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height / 3 - 20,
            left: 0,
            right: 0,
            bottom:
                0, // This will ensure it starts from just below the upper portion
            child: ClipRRect(
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(26),
              ),
              child: Container(
                decoration: const BoxDecoration(
                  color: AppColors.p1,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(26),
                    topRight: Radius.circular(26),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        ListTile(
                          title: const Text('First Name'),
                          subtitle: TextFormField(
                            controller: mainController.fnameController,
                            // initialValue: mainController
                            //     .userData!.data!.fname
                            //     .toString(),
                            decoration: const InputDecoration(
                              hintText: 'Enter your first name',
                            ),
                            onChanged: (value) {},
                          ),
                        ),
                        ListTile(
                          title: const Text('Last Name'),
                          subtitle: TextFormField(
                            controller: mainController.lnameController,
                            // initialValue: mainController
                            //     .userDataLocal!.data!.lname
                            //     .toString(),
                            decoration: const InputDecoration(
                                // hintText: 'Enter your first name',
                                ),
                            onChanged: (value) {},
                          ),
                        ),
                        ListTile(
                          title: const Text('City'),
                          subtitle: TextFormField(
                            controller: mainController.cityController,
                            // initialValue: mainController
                            //     .userDataLocal!.data!.city
                            //     .toString(),
                            decoration: const InputDecoration(
                                //  hintText: 'Enter your first name',
                                ),
                            onChanged: (value) {},
                          ),
                        ),
                        ListTile(
                          title: const Text('Phone'),
                          subtitle: TextFormField(
                            controller: mainController.phoneController,
                            // initialValue: mainController
                            //     .userDataLocal!.data!.phone
                            //     .toString(),
                            decoration: const InputDecoration(
                                //hintText: 'Enter your first name',
                                ),
                            onChanged: (value) {},
                          ),
                        ),
                        ListTile(
                          title: const Text('Email'),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              TextFormField(
                                controller: mainController.emailController,
                                // initialValue: mainController
                                //     .userDataLocal!.data!.email
                                //     .toString(),
                                decoration: const InputDecoration(
                                    //hintText: 'Enter your email',
                                    ),
                                onChanged: (value) {},
                              ),
                              const SizedBox(height: 50),
                              ElevatedButton(
                                onPressed: () {
                                  // Add logic to save email
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text('Data updated!'),
                                    ),
                                  );
                                },
                                child: const Text('Save'),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

void _showProfileOptionsDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text("Profile Picture"),
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              GestureDetector(
                child: const Text("Change Profile Picture"),
                onTap: () {
                  // Add logic to change profile picture
                  Navigator.pop(context);
                },
              ),
              const Padding(padding: EdgeInsets.all(8.0)),
              GestureDetector(
                child: const Text("Remove Profile Picture"),
                onTap: () {
                  // Add logic to remove profile picture
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
      );
    },
  );
}
