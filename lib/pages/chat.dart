import 'dart:async';
import 'dart:io' as io;
import 'package:archi_mat/Services/inboxService.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:flutter/material.dart';
import 'package:flutter_chat_bubble/bubble_type.dart';
import 'package:flutter_chat_bubble/chat_bubble.dart';
import 'package:flutter_chat_bubble/clippers/chat_bubble_clipper_9.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:dash_chat/dash_chat.dart';
import 'package:photo_view/photo_view.dart';

import '../theme.dart';

class ChatPage extends StatefulWidget {
  final dynamic shop;
  final dynamic user;
  final bool shopside;

  ChatPage({Key key, this.shop, this.user, this.shopside}) : super(key: key);

  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  static String userid;
  static String collection;
  static String me;
  TextEditingController fname = new TextEditingController();
  final GlobalKey<DashChatState> _chatViewKey = GlobalKey<DashChatState>();

  // ignore: deprecated_member_use
  List<ChatMessage> messages = List<ChatMessage>();
  // ignore: deprecated_member_use
  var m = List<ChatMessage>();
  bool chatexit = true;
  var i = 0;

  ChatUser user = ChatUser(
    name: "",
    uid: "",
  );
  @override
  void initState() {
    super.initState();
    setuser();
  }

  setuser() async {
    await Firebase.initializeApp();

    setState(() {
      userid = !widget.shopside
          ? 'shop' + widget.shop['id'].toString()
          : widget.user['id'].toString();
      me = !widget.shopside ? widget.shop['name'] : widget.user['name'];
      print('----------------------');
      print(userid);
      user.name = me;
      user.uid = userid;
      collection = 'shop' +
          widget.shop['id'].toString() +
          '-' +
          widget.user['id'].toString();
      print(collection);
    });
    checkchat();
  }

  // final ChatUser user = ChatUser(
  //   name: me,
  //   uid: userid,
  //   // avatar: "https://192.168.1.10:3011/image_picker715137009555996074.jpg",
  // );

  void systemMessage() {
    Timer(Duration(milliseconds: 300), () {
      if (i < 6) {
        setState(() {
          messages = [...messages, m[i]];
        });
        i++;
      }
      Timer(Duration(milliseconds: 300), () {
        _chatViewKey.currentState.scrollController
          ..animateTo(
            _chatViewKey.currentState.scrollController.position.maxScrollExtent,
            curve: Curves.easeOut,
            duration: const Duration(milliseconds: 300),
          );
      });
    });
  }

  checkchat() async {
    // final snapshot =
    //     await FirebaseFirestore.instance.collection(collection).doc().get();
    // if (snapshot.exists) {
    //   print('work kar rahy hy');
    //   setState(() {
    //     chatexit = true;
    //   });
    // } else {
    //   setState(() {
    //     chatexit = false;
    //   });
    //   print(' nhi work kar rahy hy');
    // }
  }

  void onSend(ChatMessage message) {
    FocusScope.of(context).requestFocus(new FocusNode());
    var data = {
      'shop': widget.shop['id'],
      'user': widget.user['id'],
      'message': message.text,
    };
    InboxService().checkinbox(data).then((value) {
      print(value);
    });
    print(user.uid);
    print(message.toJson());

    var documentReference = FirebaseFirestore.instance
        .collection(collection)
        .doc(DateTime.now().millisecondsSinceEpoch.toString());

    FirebaseFirestore.instance.runTransaction((transaction) async {
      await transaction.set(
        documentReference,
        message.toJson(),
      );
    });
    chatnotification();
    checkchat();
  }

  chatnotification() {
    // if (userid != widget.userId) {
    //   CatagoryService().getmobtoken(widget.userId).then((data) {
    //     if (data['message'] == 'success') {
    //       print('in if');
    //       dynamic notify = {
    //         'title': 'New Message',
    //         'body': me + ' - ' + widget.productname,
    //         'mob_token': data['mob_token']
    //       };
    //       dynamic notify1 = {
    //         'name': me + ' - ' + widget.productname,
    //         'title': 'New Message',
    //         'senderId': userid,
    //         'receiverId': widget.userId
    //       };
    //       CatagoryService().addnotif(notify1).then((value) {});
    //       CatagoryService().addnotify(notify).then((value) {});
    //     }
    //   });
    // } else if (userid != widget.posterId) {
    //   print('in else');
    //   CatagoryService().getmobtoken(widget.posterId).then((data) {
    //     if (data['message'] == 'success') {
    //       dynamic notify = {
    //         'title': 'New Message',
    //         'body': me + ' - ' + widget.productname,
    //         'mob_token': data['mob_token']
    //       };
    //       dynamic notify1 = {
    //         'name': me + ' - ' + widget.productname,
    //         'title': 'New Message',
    //         'senderId': userid,
    //         'receiverId': widget.posterId
    //       };
    //       CatagoryService().addnotif(notify1).then((value) {});
    //       CatagoryService().addnotify(notify).then((value) {});
    //     }
    //   });
    // }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(!widget.shopside
            ? widget.shop['name']
            : widget.user['firstname'] + ' ' + widget.user['lastname']),
        backgroundColor: AppTheme().purple,
      ),
      body: StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection(collection)
              .orderBy('createdAt', descending: true)
              .snapshots(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return Center(
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                      // Theme.of(context).primaryColor,
                      Color(0xff232A4E)),
                ),
              );
            } else if (snapshot.hasError) {
              return Center(child: Text(snapshot.hasError.hashCode.toString()));
            } else {
              if (!chatexit) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      color: AppTheme().lightgrey,
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Flexible(
                            child: Container(
                              padding: EdgeInsets.fromLTRB(20, 5, 20, 5),
                              // decoration: BoxDecoration(
                              //     borderRadius: BorderRadius.circular(30),
                              //     border: Border.all(color: AppTheme().black)),
                              child: TextField(
                                keyboardType: TextInputType.text,
                                controller: fname,
                                decoration: InputDecoration(
                                  hintText: 'First Name',
                                  hintStyle: TextStyle(color: AppTheme().black),
                                  border: InputBorder.none,
                                ),
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 20),
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: AppTheme().purple),
                            child: IconButton(
                              onPressed: () {
                                uploadimage();
                              },
                              icon: Icon(
                                Icons.image,
                                color: AppTheme().white,
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 10),
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: AppTheme().purple),
                            child: IconButton(
                              onPressed: () {
                                if (fname.text.isNotEmpty) {
                                  ChatMessage message1 = ChatMessage(
                                    text: fname.text,
                                    user: user,
                                  );
                                  onSend(message1);
                                }
                              },
                              icon: Icon(
                                Icons.send,
                                color: AppTheme().white,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                );
              } else {
                List<DocumentSnapshot> items = snapshot.data.docs;
                var messages =
                    items.map((i) => ChatMessage.fromJson(i.data())).toList();
                return DashChat(
                  key: _chatViewKey,
                  inverted: false,
                  onSend: onSend,
                  sendOnEnter: true,
                  textInputAction: TextInputAction.send,
                  user: user,
                  avatarBuilder: (messages) {
                    return Container(child: null);
                  },
                  inputDecoration: InputDecoration.collapsed(
                      hintText: "Add message here..."),
                  dateFormat: DateFormat('yyyy-MMM-dd'),
                  timeFormat: DateFormat('HH:mm'),
                  messages: messages,
                  messageBuilder: (message) {
                    // if (messages[5].text == message.text) {
                    //   print("hereeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee");
                    //   print({message.text, 'yee hay'});
                    //   Text("saad");
                    // }
                    if (message.text.isNotEmpty) {
                      return Padding(
                        padding: const EdgeInsets.only(top: 5.0),
                        child: Column(
                          children: <Widget>[
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              mainAxisAlignment: message.user.uid == userid
                                  ? MainAxisAlignment.end
                                  : MainAxisAlignment.start,
                              children: <Widget>[
                                // GestureDetector(
                                //   onTap: () {
                                //     showDialog<void>(
                                //         context: context,
                                //         builder: (BuildContext context) {
                                //           return AlertDialog(
                                //             title: Text(" ${message.user.name}"),
                                //             content: Padding(
                                //               padding: const EdgeInsets.only(
                                //                   left: 8.0),
                                //               child: Text(
                                //                   "Number: ${message.user.uid}"),
                                //             ),
                                //             actions: <Widget>[
                                //               // ignore: deprecated_member_use
                                //               FlatButton(
                                //                 child: Text('close',
                                //                     style: TextStyle(
                                //                       color: Color(0xFFE63751),
                                //                     )),
                                //                 onPressed: () {
                                //                   Navigator.of(context).pop();
                                //                 },
                                //               ),
                                //             ],
                                //           );
                                //         });
                                //   },
                                //   child: Container(
                                //     child: null,
                                //     // message.user.uid != user.uid
                                //     //     ? Padding(
                                //     //         padding: const EdgeInsets.only(
                                //     //             right: 5.0, bottom: 0),
                                //     //         child: CircleAvatar(
                                //     //           backgroundColor: Color(0xffE7E7ED),
                                //     //           // backgroundImage: NetworkImage(userAvatarUrl),
                                //     //           child: Text(message.user.name[0],
                                //     //               style: TextStyle(
                                //     //                   fontSize: 25,
                                //     //                   color: Colors.black)),
                                //     //         ),
                                //     //       )
                                //     //     : null,
                                //   ),
                                // ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 0.0),
                                  child: ChatBubble(
                                    clipper: message.user.uid == userid
                                        ? ChatBubbleClipper9(
                                            type: BubbleType.sendBubble)
                                        : ChatBubbleClipper9(
                                            type: BubbleType.receiverBubble),
                                    alignment: message.user.uid == userid
                                        ? Alignment.topRight
                                        : null,
                                    margin: EdgeInsets.only(top: 2, bottom: 2),
                                    backGroundColor: message.user.uid != userid
                                        ? Color(0xffE7E7ED)
                                        : Color(0xFF9DE1FE),
                                    child: Column(
                                      crossAxisAlignment:
                                          message.user.uid == userid
                                              ? CrossAxisAlignment.end
                                              : CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Container(
                                          constraints: BoxConstraints(
                                            maxWidth: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.7,
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 8.0),
                                            child: Text(
                                              message.text,
                                              style: TextStyle(
                                                  color: Colors.black),
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              top: 8.0, right: 8, left: 8),
                                          child: Text(
                                            DateFormat.jm()
                                                .format(message.createdAt),
                                            style: TextStyle(
                                                color:
                                                    message.user.uid == userid
                                                        ? Colors.black
                                                        : null,
                                                fontSize: 10),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),

                            //
                          ],
                        ),
                      );
                    } else if (message.image != null && message.video == null) {
                      return Padding(
                        padding: const EdgeInsets.only(top: 5.0),
                        child: Column(
                          children: <Widget>[
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              mainAxisAlignment: message.user.uid == userid
                                  ? MainAxisAlignment.end
                                  : MainAxisAlignment.start,
                              children: <Widget>[
                                GestureDetector(
                                  onTap: () {
                                    // showDialog<void>(
                                    //     context: context,
                                    //     builder: (BuildContext context) {
                                    //       return AlertDialog(
                                    //         title: Text(" ${message.user.name}"),
                                    //         content: Padding(
                                    //           padding: const EdgeInsets.only(
                                    //               left: 8.0),
                                    //           child: Text(
                                    //               "Number: ${message.user.uid}"),
                                    //         ),
                                    //         actions: <Widget>[
                                    //           FlatButton(
                                    //             child: Text('close',
                                    //                 style: TextStyle(
                                    //                   color: Color(0xFFE63751),
                                    //                 )),
                                    //             onPressed: () {
                                    //               Navigator.of(context).pop();
                                    //             },
                                    //           ),
                                    //         ],
                                    //       );
                                    //     });
                                  },
                                  child: Container(
                                    child: null,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 3.0),
                                  child: ChatBubble(
                                    shadowColor: Colors.black,
                                    clipper: message.user.uid == userid
                                        ? ChatBubbleClipper9(
                                            type: BubbleType.sendBubble)
                                        : ChatBubbleClipper9(
                                            type: BubbleType.receiverBubble),
                                    alignment: message.user.uid == user.uid
                                        ? Alignment.topRight
                                        : null,
                                    margin: EdgeInsets.only(top: 3, bottom: 0),
                                    backGroundColor: message.user.uid != userid
                                        ? Color(0xffE7E7ED)
                                        : Color(0xFF9DE1FE),
                                    child: GestureDetector(
                                      onTap: () {
                                        // Navigator.push(
                                        //     context, MaterialPageRoute(builder: (context) => FullPhoto(url: message.image)
                                        //     , fullscreenDialog: true
                                        //     ));
                                        Navigator.of(context).push(
                                          MaterialPageRoute(
                                            builder: (BuildContext context) {
                                              return Scaffold(
                                                appBar: AppBar(
                                                  backgroundColor:
                                                      Color(0xff232A4E),
                                                  iconTheme: IconThemeData(
                                                    color: Colors
                                                        .white, //change your color here
                                                  ),
                                                ),
                                                body: Center(
                                                    child: Container(
                                                        color: Colors.grey[300],
                                                        child: PhotoView(
                                                          imageProvider:
                                                              NetworkImage(
                                                                  message
                                                                      .image),
                                                        )
                                                        // child: Image.network(url+'/'+answer_text)
                                                        )),
                                              );
                                            },
                                          ),
                                        );
                                      },
                                      child: Column(
                                        crossAxisAlignment:
                                            message.user.uid != userid
                                                ? CrossAxisAlignment.end
                                                : CrossAxisAlignment.start,
                                        children: <Widget>[
                                          ClipRRect(
                                              borderRadius: BorderRadius.only(
                                                  topRight: Radius.circular(0),
                                                  topLeft: Radius.circular(0)),
                                              child: CachedNetworkImage(
                                                imageUrl: message.image,
                                                placeholder: (context, url) =>
                                                    CircularProgressIndicator(),
                                                errorWidget:
                                                    (context, url, error) =>
                                                        Icon(Icons.error),
                                                height: 150,
                                                width: 250,
                                                fit: BoxFit.cover,
                                              )),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                top: 8.0, right: 8, left: 8),
                                            child: Text(
                                              DateFormat.jm()
                                                  .format(message.createdAt),
                                              style: TextStyle(
                                                  color:
                                                      message.user.uid == userid
                                                          ? Colors.black
                                                          : null,
                                                  fontSize: 10),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      );
                    } else {
                      return null;
                    }
                  },
                  showUserAvatar: false,
                  showAvatarForEveryMessage: false,
                  scrollToBottom: false,
                  onPressAvatar: (ChatUser user) {
                    print("OnPressAvatar: ${user.name}");
                  },
                  onLongPressAvatar: (ChatUser user) {
                    print("OnLongPressAvatar: ${user.name}");
                  },
                  inputMaxLines: 5,
                  messageContainerPadding:
                      EdgeInsets.only(left: 5.0, right: 5.0),
                  alwaysShowSend: true,
                  inputTextStyle: TextStyle(fontSize: 16.0),
                  inputContainerStyle: BoxDecoration(
                    border: Border.all(width: 0.0),
                    color: Colors.white,
                  ),
                  onQuickReply: (Reply reply) {
                    setState(() {
                      messages.add(ChatMessage(
                          text: reply.value,
                          createdAt: DateTime.now(),
                          user: user));

                      // messages = [...messages];
                    });

                    Timer(Duration(milliseconds: 300), () {
                      _chatViewKey.currentState.scrollController
                        ..animateTo(
                          _chatViewKey.currentState.scrollController.position
                              .maxScrollExtent,
                          curve: Curves.easeOut,
                          duration: const Duration(milliseconds: 300),
                        );

                      if (i == 0) {
                        systemMessage();
                        Timer(Duration(milliseconds: 600), () {
                          systemMessage();
                        });
                      } else {
                        systemMessage();
                      }
                    });
                  },
                  onLoadEarlier: () {
                    print("laoding...");
                  },
                  shouldShowLoadEarlier: true,
                  showTraillingBeforeSend: true,
                  trailing: <Widget>[
                    // IconButton(
                    //   icon: Icon(Icons.video_library),
                    //   onPressed: () async {
                    //     File result = await ImagePicker.pickVideo(
                    //       source: ImageSource.gallery,
                    //       // imageQuality: 80,
                    //       // maxHeight: 400,
                    //       // maxWidth: 400,
                    //     );
                    //     print('result');
                    //     print(result);
                    //     if (result != null) {
                    //       final StorageReference storageRef =
                    //           FirebaseStorage.instance.ref().child("video");

                    //       StorageUploadTask uploadTask = storageRef.putFile(
                    //         result,
                    //         StorageMetadata(
                    //           contentType: 'video/mp4',
                    //         ),
                    //       );
                    //       StorageTaskSnapshot download =
                    //           await uploadTask.onComplete;

                    //       String url = await download.ref.getDownloadURL();

                    //       ChatMessage message =
                    //           ChatMessage(text: "video", user: user, video: url);

                    //       var documentReference = Firestore.instance
                    //           .collection('1-2')
                    //           .document(DateTime.now()
                    //               .millisecondsSinceEpoch
                    //               .toString());

                    //       Firestore.instance.runTransaction((transaction) async {
                    //         await transaction.set(
                    //           documentReference,
                    //           message.toJson(),
                    //         );
                    //       });
                    //     }
                    //   },
                    // ),
                    IconButton(
                      icon: Icon(Icons.photo),
                      onPressed: () {
                        uploadimage();
                      },
                    )
                  ],
                );
              }
            }
          }),
    );
  }

  uploadimage() async {
    final PickedFile result =
        await ImagePicker().getImage(source: ImageSource.gallery);
    print('result');
    print(result);
    if (result != null) {
      firebase_storage.Reference storageRef = firebase_storage
          .FirebaseStorage.instance
          .ref()
          .child(DateTime.now().toString());
      final uploadTask = firebase_storage.SettableMetadata(
          contentType: 'video/mp4',
          customMetadata: {'picked-file-path': result.path});
      firebase_storage.TaskSnapshot download =
          await storageRef.putFile(io.File(result.path), uploadTask);

      String url = await download.ref.getDownloadURL();

      ChatMessage message = ChatMessage(text: "", user: user, image: url);
      print('url');
      print(url);
      var documentReference = FirebaseFirestore.instance
          .collection(collection)
          .doc(DateTime.now().millisecondsSinceEpoch.toString());

      FirebaseFirestore.instance.runTransaction((transaction) async {
        await transaction.set(
          documentReference,
          message.toJson(),
        );
      });
    }
  }
}
