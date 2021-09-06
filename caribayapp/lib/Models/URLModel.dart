import 'package:flutter/foundation.dart';

class UrlClass{

  String storagePath;
  String globalLink;
  DateTime creationDate;

  UrlClass({@required this.globalLink, @required this.storagePath, this.creationDate,}) {
    if(this.creationDate == null){
      this.creationDate = DateTime.now();
    }
  }

  UrlClass.fromMap({@required Map<String, dynamic> data}) {
    if(data == null || data.isEmpty) {
      storagePath = "";
      globalLink = "";
      this.creationDate = DateTime.now();
    } else{
      storagePath = data["storage path"];
      globalLink = data["global link"];
      creationDate = DateTime.parse(data["creation Date"],);
    }
  }

  bool isEmpty() {
    if(storagePath.isEmpty || globalLink.isEmpty) {
      return true;
    } else {
      return false;
    }
  }

  Map<String, dynamic> toMap() {
    return {
      "storage path": storagePath,
      "global link": globalLink,
      "creation date": creationDate.toString(),
    };
  }
}