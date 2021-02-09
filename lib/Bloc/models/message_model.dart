
import 'dart:convert';

Message messageFromJson(String str) => Message.fromJson(json.decode(str));

class Message {
  Message({
    this.status,
    this.message,
  });

  final bool status;
  final String message;

  factory Message.fromJson(Map<String, dynamic> json) => Message(
    status: json["status"] == null ? null : json["status"],
    message: json["message"] == null ? null : json["message"],
  );

}


class MessageScan {
  MessageScan({
    this.status,
    this.message,
    this.later,
    this.now,
  });

  final bool status;
  final String message;
  final int later;
  final int now;

  factory MessageScan.fromJson(Map<String, dynamic> json) => MessageScan(
    status: json["status"] == null ? null : json["status"],
    message: json["message"] == null ? null : json["message"],
    now: json["now"] == null ? null : json["now"],
    later: json["later"] == null ? null : json["later"],
  );

}

