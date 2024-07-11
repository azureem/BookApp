import 'package:shared_preferences/shared_preferences.dart';

class MyPref {

  static late final SharedPreferences _pref;


  static init() async {
    _pref = await SharedPreferences.getInstance();
  }

  //  Future<void> addContact(List<ContactData> data, int size) async {
  //   for (int i = 0; i < size; i++) {
  //     await _pref.setString('Name+$i', data[i].name);
  //     await _pref.setString('Num+$i', data[i].number);
  //   }
  //   await _pref.setInt('size', size);
  // }
  //
  //
  //  Future< List<ContactData>>getContacts()async  {
  //   final List<ContactData> contacts = [];
  //   final size = _pref.getInt('size') ?? 0;
  //
  //   for (int i = 0; i < size; i++){
  //     final name  = _pref.getString('Name+$i')??'';
  //     final number  = _pref.getString('Num+$i')??'';
  //     contacts.add(ContactData(name: name, number: number));
  //   }
  //   return contacts;
  // }
  //
  //
  //
  //   static Future<bool> setContact(ContactData data) async{
  //   var ls=getAllContacts();
  //   var b1=await _pref.setString("name${ls.length}", data.name);
  //   var b2=await _pref.setString("phone${ls.length}", data.number);
  //   var b3=await _pref.setInt("size", ls.length+1);
  //   funLs.forEach((element) {element();});
  //   return (b1==true)==(b3==b2);
  // }
  //
  //
  //
  // static Future<void> updateContact(ContactData data, int index) async {
  //   List<ContactData> ls = getAllContacts();
  //   if (index >= 0 && index < ls.length) {
  //
  //     ls[index] = data;
  //     await _pref.clear();
  //     for (int i = 0; i < ls.length; i++) {
  //       await setContact(ls[i]);
  //     }
  //   } else {
  //     throw Exception("Invalid index $index");
  //   }
  // }
  //
  //
  // static Future<void> deleteContact(int index) async {
  //   List<ContactData> ls = getAllContacts();
  //
  //   if (index >= 0 && index < ls.length) {
  //     ls.removeAt(index);
  //     await _pref.clear();
  //
  //     for (int i = 0; i < ls.length; i++) {
  //       await setContact(ls[i]);
  //     }
  //
  //     await _pref.setInt("size", ls.length);
  //   } else {
  //     throw Exception("Invalid index $index");
  //   }
  // }
  //
  //
  // static List<ContactData> getAllContacts() {
  //   var size=_pref.getInt("size")??0;
  //   List<ContactData> ls=[];
  //   for(int i=0;i<size;++i) {
  //     ls.add(ContactData(name: _pref.getString("name$i") ?? "",
  //         number: _pref.getString("phone$i") ?? "",));
  //   }
  //   return ls;
  // }
  //
  //
  // Future<int?> getSize() async {
  //   return _pref.getInt('size');
  // }
  //

  Future<void> saveUserName(String  userName) async{
    await _pref.setString('uname', userName);
  }

 static  Future<void> saveUserPass( String password) async{
    await _pref.setString('pass', password);
  }


 static  String? getUserName(){
    return _pref.getString('uname');
  }



  static String? getPassword(){
    return _pref.getString('pass');
  }


  static List<Function()> funLs=[];
  static changeListener(Function() fun){
    funLs.add(fun);
  }
}