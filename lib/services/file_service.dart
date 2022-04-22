import 'dart:convert';
import 'dart:io';

import 'package:april_22_homework/models/contact_model.dart';

class FileService{
  Directory directory = Directory(Directory.current.path+'\\assets\\files');

  /// check directory created or not
  Future<void>init()async{
    bool isDirectoryCreated=await directory.exists();
    if(!isDirectoryCreated){
      await directory.create();
    }
  }

  /// create file if file not created yet
  Future<String>createFile(String phoneNumber)async{
    File file=File(directory.path+'\\$phoneNumber.txt');
    bool isFileCreated=await file.exists();
    if(isFileCreated){
      /// this below code  will be edited when I set language service
      throw Exception("This file already created please try create new file");
    }
    await file.create();
    return file.path;
  }

  /// write in file
  Future<String>writeFile(Contact contact,String path)async{
    File file =File(path);
    // cryptographic code
    await file.writeAsString(jsonEncode(contact.toJson()));
    await file.setLastModified(DateTime.parse(contact.time));
    return file.path;
  }

  /// read the file
  Future<Contact> readFile(String name)async{
    File file=File(directory.path+'\\$name.note');
    bool isFileCreated=await file.exists();
    if(!isFileCreated){
      throw Exception("File not found");
    }

    String result=await file.readAsString();
    Contact contact = Contact.fromJson(jsonDecode(result));
    return contact;
  }

}
