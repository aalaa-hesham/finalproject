import 'package:finalproject/models/model.dart';
import 'package:finalproject/views/editscreen.dart';
import 'package:flutter/material.dart';
import 'scond.dart';

class Firstscreen extends StatefulWidget {
  const Firstscreen({Key? key}) : super(key: key);

  @override
  State<Firstscreen> createState() => _FirstscreenState();
}

class _FirstscreenState extends State<Firstscreen> {
  Widget appBarTitle = Text(
    "Contacts App",
    style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
  );
  Color color = Colors.indigo;
  Icon actionIcon = Icon(
    Icons.search,
    color: Colors.white,
  );
  final Search = TextEditingController();

  List<contact> contacts = []; // List to store contacts

  void saveContact(contact newContact) {
    setState(() {
      contacts.add(newContact); // Add the new contact to the list
    });
  }

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
                    controller: Search,
                    style: TextStyle(
                      color: Colors.indigo,
                    ),
                  );
                }
              });
            },
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        elevation: 10.0,
        backgroundColor: Colors.lightBlue,
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Secondscreen(saveContact: saveContact),
            ),
          );
        },
        shape: RoundedRectangleBorder(
          side: BorderSide(width: 3, color: Colors.lightBlue),
          borderRadius: BorderRadius.circular(100),
        ),
      ),
      body: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            bottom: 0,
            child: contacts.isEmpty
                ? Text(
              "please enter a new value",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w800,
                color: Colors.black87,
              ),
            )
                :  ListView.builder(
                itemCount: contacts.length,
                itemBuilder: (context, index) => getRow(index, contacts),
              ),
            ),

        ],
      ),
    );
  }
  Widget getRow(int index, List<contact> contacts) {
    return Card(
      elevation: 0,
      color: Colors.white,
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor:
          index % 2 == 0 ? Colors.deepPurpleAccent : Colors.indigo,
          foregroundColor: Colors.white,
          child: Text(
            contacts[index].name[0],
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              contacts[index].name,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(contacts[index].tel),
          ],
        ),
        trailing: SizedBox(
          width: 200,
          child: Row(
            children: [
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Edit(),
                    ),
                  ).then((result) {
                    if (result != null) {
                      setState(() {
                        contacts[index] = result; // Update the contact in the list
                      });
                    }
                  });
                },
                child: Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(color: Colors.indigo),
                  child: Center(
                    child: Text(
                      "Update",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: SizedBox(
                  width: 100,
                  child:  InkWell(
                    onTap: () {
                      setState(() {
                        contacts.removeAt(index);
                      });
                    },
                    child: Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(color: Colors.indigo),
                      child: Center(
                        child: Text(
                          "Delete",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

