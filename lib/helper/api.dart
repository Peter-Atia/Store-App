/*
  Future<dynamic> post({required String url,@required dynamic body,@required String? token}) async {
    Map<String, String> headers = {};
    if (token != null) {
      headers.addAll({"Authorization": "Bearer $token"});
    }
    http.Response response = await http.post(Uri.parse(url),body: body,headers: headers);
    Map<String, dynamic> data = jsonDecode(response.body);
    return data;
  }
}
*/
import 'dart:convert';
import 'package:http/http.dart'as http;

class Api{
  Future<dynamic> get({required String url})async{
    http.Response response =await http.get(Uri.parse(url));
    if(response.statusCode == 200){
      print("url: $url \n${jsonDecode(response.body)}");

      return jsonDecode(response.body);
    }
    else{
      throw Exception("There is a problem with status code ${response.statusCode}");
    }
  }

  Future<dynamic> post({required String url ,required Map body})async{
    http.Response response =await http.post(Uri.parse(url),body: body);
    if(response.statusCode == 200){
      print("url: $url \n${jsonDecode(response.body)}");

      return jsonDecode(response.body);
    }
    else{
      throw Exception("There is a problem with status code ${response.statusCode}");
    }
  }

  Future <dynamic> put({required String url ,required Map body})async{
    http.Response response = await http.put(Uri.parse(url),body: body);
    if(response.statusCode == 200){
      print("url: $url \n${jsonDecode(response.body)}");
      return jsonDecode(response.body);
    }
    else{
      throw Exception("There is a problem with status code ${response.statusCode}");
    }

  }

}