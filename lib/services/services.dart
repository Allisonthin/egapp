import 'dart:convert';
import 'dart:developer';

import 'package:egapp/fakedata/modelpage.dart';
import 'package:http/http.dart' as http;

// void main(List<String> arguments) {
//   fetchdata();
// }

class Service {
  Future<dynamic> fetchdata() async {
    // print("API called");
    List<UserModel> enco = [];
    var response = await http.get(Uri.parse(
        'https://script.google.com/macros/s/AKfycbxbatlZbbxGL9ZzlM4qzfNnE-hevwSiWh25LcZVGeD4c3rYgMi3qTZ_76GcGytOl_Se/exec'));

    if (response.statusCode == 200) {
      List deconded = jsonDecode(response.body);

      
      // log(deconded.length.toString());
      deconded.map((e) {
        Map<String, dynamic> m = e;
        var obj = UserModel.fromJson(m);
        enco.add(obj);
      }).toList();

      return enco;

      // print(deco);
      // enco = deco.map((e) {
      //   log(enco[0].toString());
      //   return UserModel.fromJson(e);
      // }).toList();
      // print(enco);

      // enco.map((e) => print(e.name)).toList();

      // return enco;
    }
    //  return enco;
  }
}
