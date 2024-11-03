import 'package:chatview/chatview.dart';

class Data {
  static const profileImage =
      "https://cdn.discordapp.com/attachments/1175882190488350783/1302416160460902430/LOGO_FINAL.png?ex=67280912&is=6726b792&hm=9ec2b41915d3078396211fefacd5d61f9c737adda14fecfc2007c40c023f0ab0&";
  static final messageList = [
    Message(
      id: '1',
      message: "Hi!",
      createdAt: DateTime.now(),
      sentBy: '1',
      status: MessageStatus.read,
    ),
    Message(
      id: '2',
      message: "Hi! Asma",
      createdAt: DateTime.now(),
      sentBy: '2',
      status: MessageStatus.read,
    ),
    
  ];
}
