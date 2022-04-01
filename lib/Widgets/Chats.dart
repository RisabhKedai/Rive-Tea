import 'package:rive_tea/Pages/ChatScreen.dart';
import 'package:flutter/material.dart';

class Chats extends StatelessWidget {
  const Chats({Key? key}) : super(key: key);

  // trialContact() async {
  //   final contact = await FlutterContactPicker.pickFullContact();
  //   var _contact = contact.name.toString();
  //   print(_contact);
  // }

  @override
  Widget build(BuildContext context) {
    // trialContact();
    DateTime now = new DateTime.now();
    return Expanded(
      child: ListView.separated(
        separatorBuilder: (context, index) => Divider(
          color: Colors.grey,
        ),
        //scrollDirection: Axis.vertical,
        itemCount: Chat.length,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () => Navigator.push(
                context, MaterialPageRoute(builder: (context) => ChatScreen())),
            child: Container(
              margin: const EdgeInsets.only(
                  top: 10.0, bottom: 10.0, left: 16.0, right: 16.0),
              //padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      const CircleAvatar(
                        radius: 30.0,
                        backgroundColor: Color.fromRGBO(105, 109, 198, 1),
                      ),
                      SizedBox(width: 10.0),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          const Text(
                            "Name",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 0.0),
                          ),
                          SizedBox(
                            height: 5.0,
                          ),
                          Container(
                            decoration: BoxDecoration(),
                            width: MediaQuery.of(context).size.width * 0.45,
                            child: const Text(
                              'Hey there! I am using FriendlyChat',
                              style: TextStyle(
                                  color: Colors.blueGrey,
                                  fontWeight: FontWeight.w600),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      Text(
                        '${now.hour} : ${now.minute}',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 5.0,
                      ),
                      Container(
                        width: 40.0,
                        height: 20.0,
                        decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.circular(30.0)),
                        alignment: Alignment.center,
                        child: const Text(
                          'NEW',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 12.0,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class Chat {
  // final FlutterContactPicker _flutterContactPicker = new FlutterContactPicker();
  static var length = 10;
  String? name;
}

// class Chat extends StatefulWidget {
//   static var length = 10;

//   @override
//  // _ChatState createState() => new _ChatState();
// }

// class _ChatState extends State<Chat> {
//  // final FlutterContactPicker _contactPicker = new FlutterContactPicker();
//  // PhoneContact? _phoneContact;
//   String? _contact;

//   @override
//   Widget build(BuildContext context) {
//    // print(FlutterContactPicker.pickFullContact().toString());
//     _buildChildren(context);
//     // TODO: implement build
//     throw UnimplementedError();
//   }

//   List<Widget> _buildChildren(BuildContext context) {
//     return <Widget>[
//       if (_phoneContact != null)
//         Column(
//           children: <Widget>[
//             const Text("Phone contact:"),
//             Text("Name: ${_phoneContact!.fullName}"),
//             Text(
//                 "Phone: ${_phoneContact!.phoneNumber!.number} (${_phoneContact!.phoneNumber!.label})")
//           ],
//         ),
//       ElevatedButton(
//         child: const Text("pick full contact"),
//         onPressed: () async {
//         //  final FullContact contact =
//             //  (await FlutterContactPicker.pickFullContact());
//           setState(() {
//            // _contact = contact.toString();
//           });
//         },
//       ),
//     ];
//   }
// }
