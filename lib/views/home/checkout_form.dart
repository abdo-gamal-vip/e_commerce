import 'package:e_commerce/widgets/small_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

class Checkform extends StatelessWidget {
  const Checkform({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Text(
            "Checkout",
            style: TextStyle(fontSize: 18, color: Colors.black),
          ),
          centerTitle: true,
          leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
          )),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Expanded(
            flex: 5,
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              SizedBox(
                height: 20,
              ),
              Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
                Image.asset("assets/checkbox.png"),
                Text(
                  "Billing address is the same as delivery address",
                  style: TextStyle(fontSize: 14),
                )
              ]),
              SizedBox(
                height: 20,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "street 1 ",
                    style: TextStyle(color: Colors.grey),
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      hintText: "21, Alex Davidson Avenue",
                      hintStyle: TextStyle(color: Colors.black),
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.black)),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "street 2 ",
                    style: TextStyle(color: Colors.grey),
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      hintText: "Opposite Omegatron, Vicent Quarters",
                      hintStyle: TextStyle(color: Colors.black),
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.black)),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "City ",
                    style: TextStyle(color: Colors.grey),
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      hintText: "Cairo .. alex .. elmanya",
                      hintStyle: TextStyle(color: Colors.black),
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.black)),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        "State ",
                        style: TextStyle(color: Colors.grey),
                      ),
                      Text(
                        "Countery ",
                        style: TextStyle(color: Colors.grey),
                      ),
                    ],
                  ),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          width: 100,
                          child: TextFormField(
                            decoration: InputDecoration(
                              hintText: "Lagos State",
                              hintStyle: TextStyle(color: Colors.black),
                              focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.black)),
                            ),
                          ),
                        ),
                        Container(
                          width: 100,
                          child: TextFormField(
                            decoration: InputDecoration(
                              hintText: "Nigeria",
                              hintStyle: TextStyle(color: Colors.black),
                              focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.black)),
                            ),
                          ),
                        ),
                      ]),
                  Row(children: [defSmallButton(txt: "Back", ontap: () {})]),
                ],
              ),
            ]),
          ),
        ),
      ),
    ));
  }
}
