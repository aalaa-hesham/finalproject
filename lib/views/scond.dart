import 'package:finalproject/models/model.dart';
import 'package:flutter/material.dart';
import 'firstscreen.dart';

class Secondscreen extends StatefulWidget {
  final void Function(contact) saveContact; // Update the callback function type

  Secondscreen({required this.saveContact});

  @override
  _SecondscreenState createState() => _SecondscreenState();
}

class _SecondscreenState extends State<Secondscreen> {
  Widget appBarTitle = Text(
    "Contacts App",
    style: TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.bold,
    ),
  );

  Color color = Colors.indigo;
  Icon actionIcon = Icon(
    Icons.search,
    color: Colors.white,
  );

  final TextEditingController name = TextEditingController();
  final TextEditingController phone = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: appBarTitle,
        backgroundColor: color,
        actions: <Widget>[
          IconButton(
            icon: actionIcon,
            onPressed: () {
              setState(() {
                if (actionIcon.icon == Icons.search) {
                  actionIcon = Icon(
                    Icons.close,
                    color: Colors.indigo,
                  );
                  color = Colors.white;
                  appBarTitle = TextField(
                    style: TextStyle(
                      color: Colors.indigo,
                    ),
                    onChanged: (value) {
                    },
                  );
                }
              });
            },
          )
        ],
      ),
      body: Container(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Stack(
                    children: [
                      Container(
                        width: 120.0,
                        height: 120.0,
                        child: CircleAvatar(
                          backgroundColor: Colors.lightBlue.shade900,
                          child: Icon(
                            Icons.camera_alt,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        height: 0,
                        child: Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              width: 4,
                              color: Colors.white,
                            ),
                            color: Colors.blue,
                          ),
                          child: Icon(
                            Icons.edit,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            TextFormField(
              controller: name,
              autofocus: true,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                labelText: 'Name',
                icon: Icon(Icons.person),
              ),
            ),
            TextFormField(
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                labelText: 'Family',
                icon: Icon(Icons.person),
              ),
            ),
            TextFormField(
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                labelText: 'Work',
                icon: Icon(Icons.work),
              ),
            ),
            TextFormField(
              controller: phone,
              keyboardType: TextInputType.number,
              maxLength: 16,
              decoration: InputDecoration(
                labelText: "Phone",
                icon: Icon(Icons.phone),
              ),
            ),
            TextFormField(
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                labelText: 'E-mail',
                icon: Icon(Icons.email),
              ),
            ),
            TextFormField(
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                labelText: 'Web',
                icon: Icon(Icons.web),
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(10.0),
              child: SizedBox(
                width: 100.0,
                height: 50.0,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      side: const BorderSide(
                        width: 3.0,
                        color: Colors.black,
                      ),
                      backgroundColor: Colors.blue,
                      shadowColor: Colors.grey,
                      elevation: 3,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.zero),
                      minimumSize: Size(50, 40), //////// HERE
                    ),
                    onPressed: () {
                      String names = name.text.trim();
                      String ph = phone.text.trim();
                      if (names.isNotEmpty && ph.isNotEmpty) {
                        contact newContact = contact(name: names, tel: ph);
                        widget.saveContact(newContact); // Invoke the callback function with the contact object
                        Navigator.pop(context); // Go back to the previous screen
                      }
                    },
                    child: Text(
                      'Save',
                      style:
                      TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                    )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}