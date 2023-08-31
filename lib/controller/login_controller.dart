
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class LoginController extends GetxController{

final emailController= TextEditingController().obs;
final passwordController= TextEditingController().obs;
RxBool loading = false.obs;
void loginApi() async{
  loading.value=true;
  var url= "https://reqres.in/api/login";
  try{

    final response= await http.post(Uri.parse(url),
        body: {
          'email' : emailController.value.text,
          'password': passwordController.value.text

        },
    );
    var data= jsonDecode(response.body);

    print(response.statusCode);
    print(data);

    if(response.statusCode==200){
      loading.value=false;
      print("success");
      Get.snackbar("Login Successful", "Congratulations",backgroundColor: Colors.orange);
    }
    else{
      loading.value=false;
      Get.snackbar("Login Failed", data['error']);
    }


  }catch(e){
    loading.value=false;
    Get.snackbar("Exception", e.toString());
  }


}
}