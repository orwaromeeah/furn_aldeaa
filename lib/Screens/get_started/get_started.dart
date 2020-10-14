import 'package:flutter/material.dart';
import 'package:furn_aldeaa/Constants.dart';
import 'package:furn_aldeaa/Screens/enter_adress/enter_adress.dart';
import 'package:furn_aldeaa/widgets/RoundedButton.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class GetStarted extends StatefulWidget {
  static const String id = 'getStarted';

  @override
  _GetStartedState createState() => _GetStartedState();
}

class _GetStartedState extends State<GetStarted> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: yellow,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('images/Group4077.png'),
                      fit: BoxFit.cover),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(20.0),
                      topLeft: Radius.circular(20.0))),
              height: 230,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
                    height: 50,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: 60,
                        ),
                        Text(
                          "lets get started",
                          style: TextStyle(
                              color: brown,
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        ),
                        Container(
                          width: 60,
                          child: FlatButton(
                              onPressed: () => {
                                    Navigator.pushReplacement(
                                        context,
                                        new MaterialPageRoute(
                                            builder: (BuildContext context) =>
                                                EnterAddress()))
                                  },
                              child: Text(
                                "Skip",
                                style: TextStyle(color: brown),
                              )),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                    child: Divider(
                      color: Colors.grey.withOpacity(0.5),
                      thickness: 0.5,
                    ),
                  ),
                  RoundedButton(
                    title: "Continue with facebook",
                    backgroundColor: brown,
                    iconColor: Colors.white,
                    onPressed: () => {},
                    icon: FontAwesomeIcons.facebook,
                    textColor: Colors.white,
                  ),
                  Center(
                    child: Text(
                      "or",
                      style: TextStyle(fontSize: 18, color: brown),
                    ),
                  ),
                  Padding(
                      padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                      child: FlatButton(
                        height: 40,
                        onPressed: () => {opensheet(context)},
                        child: Text('Continue with email',
                            style: TextStyle(fontSize: 15, color: brown)),
                        textColor: brown,
                        shape: RoundedRectangleBorder(
                            side: BorderSide(
                                color: brown,
                                width: 2,
                                style: BorderStyle.solid),
                            borderRadius: BorderRadius.circular(35)),
                      ))
                ],
              ),
            ),
          ],
        ));
  }
}

void opensheet(context) async {
  showModalBottomSheet<dynamic>(
      context: (context),
      isDismissible: false,
      builder: (context) {
        return Page1();
      });
}

class Page1 extends StatefulWidget {
  @override
  _Page1State createState() => _Page1State();
}

class _Page1State extends State<Page1> {
  int currentview = 0;
  List<Widget> pages;

  @override
  void initState() {
    pages = [
      page1(),
      page2(),
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return pages[currentview];
  }

  Widget page1() {
    Color boxColor = Colors.black26;
    return Container(
      height: 350,
      decoration: BoxDecoration(
          borderRadius: new BorderRadius.only(
              topLeft: Radius.circular(10.0), topRight: Radius.circular(10.0))),
      child: Column(
        children: [
          Container(
            height: 50,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: 60,
                ),
                Text(
                  "Contineu with email",
                  style: TextStyle(
                      color: brown, fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Container(
                  width: 60,
                  child: FlatButton(
                      onPressed: () => {Navigator.pop(context)},
                      child: Icon(Icons.cancel)),
                )
              ],
            ),
          ),
          Divider(
            height: 5,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 80,
              decoration: BoxDecoration(
                border: Border.all(width: 2, color: boxColor),
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 8.0, right: 8.0, top: 4),
                    child: Text(
                      'Enter email *',
                      style: TextStyle(color: Colors.black87, fontSize: 15),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                    child: TextFormField(
                      onTap: () {
                        setState(() {
                          boxColor = Colors.black87;
                        });
                      },
                      onFieldSubmitted: (value) => {
                        setState(() {
                          currentview = 1;
                        })
                      },
                      textInputAction: TextInputAction.next,
                      onChanged: (value) {
                        setState(() {
                          boxColor = Colors.black54;
                        });
                      },
                      decoration: InputDecoration(
                          hintText: 'Enter email here',
                          border: InputBorder.none),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget page2() {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10.0), topRight: Radius.circular(10.0))),
      height: 500,
      width: double.maxFinite,
      child: (Column(
        children: [
          Container(
            height: 50,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 60,
                  child: FlatButton(
                      onPressed: () => {
                            setState(() {
                              currentview = 0;
                            })
                          },
                      child: Icon(Icons.arrow_back_ios_rounded)),
                ),
                Text(
                  "Create Account",
                  style: TextStyle(
                      color: brown, fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Container(
                  width: 60,
                  child: FlatButton(
                      onPressed: () => {Navigator.pop(context)},
                      child: Icon(Icons.cancel)),
                )
              ],
            ),
          ),
          Divider(
            height: 5,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                  child: Container(
                    height: 80,
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.05),
                      border: Border.all(
                          width: 1, color: Colors.black.withOpacity(0.2)),
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 8.0, right: 8.0, top: 4),
                          child: Text(
                            'Enter email *',
                            style:
                                TextStyle(color: Colors.black87, fontSize: 10),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                          child: TextFormField(
                            onTap: () {
                              setState(() {});
                            },
                            onFieldSubmitted: (value) => {
                              setState(() {
                                currentview = 2;
                              })
                            },
                            textInputAction: TextInputAction.next,
                            onChanged: (value) {
                              setState(() {});
                            },
                            decoration: InputDecoration(
                                hintText: 'Enter email here',
                                border: InputBorder.none),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 80,
                    child: Row(
                      children: [
                        Expanded(
                          child: Container(
                            height: 70,
                            decoration: BoxDecoration(
                              color: Colors.black.withOpacity(0.05),
                              border: Border.all(
                                  width: 1,
                                  color: Colors.black.withOpacity(0.1)),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0)),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 8.0, right: 8.0, top: 4),
                                  child: Text(
                                    'First Name *',
                                    style: TextStyle(
                                        color: Colors.black87, fontSize: 10),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 8.0, right: 8.0),
                                  child: TextFormField(
                                    onTap: () {
                                      setState(() {});
                                    },
                                    onFieldSubmitted: (value) => {
                                      setState(() {
                                        currentview = 2;
                                      })
                                    },
                                    textInputAction: TextInputAction.next,
                                    onChanged: (value) {
                                      setState(() {});
                                    },
                                    decoration: InputDecoration(
                                        hintText: 'First name here',
                                        border: InputBorder.none),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Expanded(
                          child: Container(
                            height: 70,
                            decoration: BoxDecoration(
                              color: Colors.black.withOpacity(0.05),
                              border: Border.all(
                                  width: 1,
                                  color: Colors.black.withOpacity(0.1)),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0)),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 8.0, right: 8.0, top: 4),
                                  child: Text(
                                    'Last name  *',
                                    style: TextStyle(
                                        color: Colors.black87, fontSize: 10),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 8.0, right: 8.0),
                                  child: TextFormField(
                                    onTap: () {
                                      setState(() {});
                                    },
                                    onFieldSubmitted: (value) => {
                                      setState(() {
                                        currentview = 2;
                                      })
                                    },
                                    textInputAction: TextInputAction.next,
                                    onChanged: (value) {
                                      setState(() {});
                                    },
                                    decoration: InputDecoration(
                                        hintText: 'Last name  here',
                                        border: InputBorder.none),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                  child: Container(
                    height: 70,
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.05),
                      border: Border.all(
                          width: 1, color: Colors.black.withOpacity(0.1)),
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 8.0, right: 8.0, top: 4),
                          child: Text(
                            'Password *',
                            style:
                                TextStyle(color: Colors.black87, fontSize: 10),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                          child: TextFormField(
                            onTap: () {
                              setState(() {});
                            },
                            obscureText: true,
                            textInputAction: TextInputAction.next,
                            onChanged: (value) {
                              setState(() {});
                            },
                            decoration: InputDecoration(
                                hintText: '**********',
                                border: InputBorder.none),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Row(
                  children: [
                    Text("By Continueing you accept the "),
                  ],
                )
              ],
            ),
          ),
        ],
      )),
    );
  }
}
