import 'package:e_commerce/views/auth_view/sign_in_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

class ChangePass extends StatefulWidget {
  ChangePass({Key? key}) : super(key: key);

  @override
  State<ChangePass> createState() => _ChangePassState();
}

class _ChangePassState extends State<ChangePass> {
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  var newpass = "";
  final newpassController = TextEditingController();
  var currentuser = FirebaseAuth.instance.currentUser;
  changep() async {
    try {
      await currentuser!.updatePassword(newpass);
      FirebaseAuth.instance.signOut();
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("Password Changed Successfully"),
      ));
    } catch (e) {
      Get.snackbar("error", "please try again");
    }
  }

  @override
  void dispose() {
    newpassController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: Column(
          children: [
            Container(
              color: Colors.white,
              width: double.infinity,
              height: 812 * 250 / Get.height,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image(
                      fit: BoxFit.fill,
                      image: NetworkImage(
                          "https://www.paymentsjournal.com/wp-content/uploads/2020/09/forgot-password-concept-illustration_114360-1123.jpg"))
                ],
              ),
            ),
            TextFormField(
              key: _formkey,
              validator: (value) {
                if (value == null) {
                  return "please enter new password";
                }
                {
                  return null;
                }
              },
              controller: newpassController,
              decoration: InputDecoration(
                hintText: "New Password",
                hintStyle: TextStyle(color: Colors.grey),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            ElevatedButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.blue)),
                onPressed: () async {
                  if (_formkey.currentState!.validate()) {
                    print("object");
                    setState(() {
                      newpass = newpassController.text;
                    });
                    await changep();
                    Get.offAll(SignInView());
                  }
                },
                child: Text(
                  "Change Password",
                  style: TextStyle(color: Colors.white),
                )),
          ],
        ),
      ),
    );
  }
}
