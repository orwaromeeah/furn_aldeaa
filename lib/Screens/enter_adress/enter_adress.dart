import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:furn_aldeaa/Constants.dart';
import 'package:furn_aldeaa/widgets/CustomTextField.dart';
import 'package:furn_aldeaa/widgets/RoundedButton.dart';
import 'package:furn_aldeaa/widgets/searchField.dart';




class EnterAddress extends StatefulWidget {
  static const String id = 'enterAddress';
  @override
  _EnterAdressState createState() => _EnterAdressState();
}

class _EnterAdressState extends State<EnterAddress> {
  int deliveryState = 0;
  final TextEditingController _textController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 40.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox(
                  width: 50,
                ),
                Container(
                  width: 200,
                  child: CupertinoSlidingSegmentedControl(
                      groupValue: 0,
                      backgroundColor: Colors.black12,
                      children: const <int, Widget>{
                        0: Text('Delivery'),
                        1: Text('Pickup'),
                      },
                      onValueChanged: (value) {
                        setState(() {
                          deliveryState = value;
                        });
                      }),
                ),
                IconButton(
                    icon: Icon(
                      Icons.close,
                      size: 30,
                    ),
                    onPressed: null),
              ],
            ),
          ),
          Container(
            height: 10,
            decoration: BoxDecoration(color: Colors.grey.shade200),
          ),
          Container(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Stack(
                alignment: const Alignment(1.0, 1.0),
                children: [
                  TextField(
                    controller: _textController,
                    onChanged: (value) {
                      setState(() {
                        print(value);
                      });
                    },
                    decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Colors.grey.shade300, width: 3.0),
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        ),
                        prefixIcon: Icon(Icons.location_on_outlined),
                        contentPadding: EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 20.0),
                        border: OutlineInputBorder(
                            borderSide: new BorderSide(color: Colors.grey)),
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.black38, width: 3.0),
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        ),
                        hintText: 'Enter a new address'),
                  ),
                  _textController.text.length > 0
                      ? new IconButton(
                          icon: new Icon(
                            Icons.cancel_outlined,
                            color: Colors.black54,
                          ),
                          onPressed: () {
                            setState(() {
                              _textController.clear();
                            });
                          })
                      : new Container(
                          height: 0.0,
                        )
                ],
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 8.0, right: 8.0),
              child: ListView(
                children: [
                  LocationCell(
                      location: 'Current location',
                      details: 'Unable to access',
                      isChecked: false,
                      icon: Icons.location_searching_rounded),
                  LocationCell(
                    location: 'Banyas Tartous',
                    details: 'some text some text',
                    isChecked: true,
                    icon: Icons.location_on_outlined,
                  )
                ],
              ),
            ),
          ),
          RoundedButton(
            onPressed: () {},
            title: "Done",
            backgroundColor: brown,
            textColor: Colors.white,
            icon: null,
            iconColor: Colors.white,
          )
        ],
      ),
    );
  }
}

class LocationCell extends StatelessWidget {
  String location;
  String details;
  IconData icon;
  bool isChecked;

  LocationCell({this.location, this.details, this.icon, this.isChecked});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      child: Column(
        children: [
          Row(
            children: [
              Container(
                  height: 50,
                  width: 50,
                  child: Icon(
                    icon,
                    size: 30,
                    color: Colors.black38,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.black12,
                    border: Border.all(color: Colors.white, width: 1),
                    shape: BoxShape.circle,
                  )),
              SizedBox(
                width: 10,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    location,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    details,
                  ),
                ],
              ),
              isChecked
                  ? Icon(
                      Icons.check,
                      color: Colors.black38,
                    )
                  : new Container(
                      height: 0.0,
                    )
            ],
          ),
          SizedBox(
            height: 5,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Divider(
              height: 0.1,
              color: Colors.black26,
            ),
          )
        ],
      ),
    );
  }
}
