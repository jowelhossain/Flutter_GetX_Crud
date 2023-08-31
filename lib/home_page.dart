import 'package:flutter/material.dart';
import 'package:flutter_getx_crud/controller/login_controller.dart';
import 'package:get/get.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  LoginController controller= Get.put(LoginController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Login"),centerTitle: true,),
      body:Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(

          children: [
            TextFormField(
              keyboardType: TextInputType.text,
              controller: controller.emailController.value,
              decoration: InputDecoration(hintText: "Email"),
            ),
            TextFormField(
              keyboardType: TextInputType.text,
              controller: controller.passwordController.value,
              decoration: InputDecoration(hintText: "Password"),
            ),
    SizedBox(height: 20,),

    Obx(() => controller.loading.value?CircularProgressIndicator() : ElevatedButton(onPressed: (){

              controller.loginApi();


            }, child: Text("Login")))
          ],
        ),
      )
    );
  }
}
