import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:note_app/constant/const.dart';
import 'package:note_app/service/auth_service.dart';
import 'package:note_app/view/signin_page.dart';
import 'package:note_app/widget/wiget.dart';
class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _comfirmpasswordController = TextEditingController();
  AppStyle appStyle = AppStyle();
  final formkey = GlobalKey<FormState>();
  bool _isLoading=false;
  AuthService authService = AuthService();
  
Register()async{
    if(formkey.currentState!.validate()){
      if(_passwordController.text!=_passwordController.text){
        showMessageAlert(context,'Incorrect confirm password.',Colors.red);
      }else{
        setState(() {
          _isLoading=true;
        });
        await authService.RegisterUser(context, _emailController.text, _passwordController.text).then((value){
          if(value==true){
              showMessageAlert(context,'Account created.',Colors.green);
          }
        });
        setState(() {
          _isLoading=false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: _isLoading ? const Center(
        child: CircularProgressIndicator(),
      ) : Form(
        key: formkey,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Container(
              height: MediaQuery.of(context).size.height,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage('https://images.unsplash.com/photo-1614101595484-712913c033b5?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80')
                ),
              ),
            ),
            Container(
              alignment: Alignment.topCenter,
              margin: const EdgeInsets.only(top: 130,left: 15,right: 15,bottom: 90),
              height: MediaQuery.of(context).size.height,
              width: double.infinity,
              decoration: BoxDecoration(
                color: appStyle.bodyColor,
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40),
                    bottomLeft: Radius.circular(40),
                    bottomRight: Radius.circular(40),
                  ),//Bord
              ),
              child: Column(
                children: [
                  const SizedBox(height: 50,),
                  Text('Hello Again!',
                  style: GoogleFonts.aclonica(
                  fontSize: 40
                  ),),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('Welcome back you\'ve been missed!',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.akshar(
                      fontSize: 30,
                      
                    ),),
                  ),
                  const SizedBox(height: 10,),
                  //Email
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      controller: _emailController,
                      decoration: appStyle.emailStyle,
                     validator: (val) {
                          return RegExp(
                                      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                  .hasMatch(val!)
                              ? null
                              : "Please enter a valid email";
                        },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      controller: _passwordController,
                      obscureText: true,
                      decoration: appStyle.passwordStyle,
                     validator: (val) {
                        if(val!.length<6){
                          return 'password must be 6 charector';
                        }else{
                          return null;
                      }
                        },
                      ),
                    ),
                    Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      controller: _comfirmpasswordController,
                      obscureText: true,
                      decoration: appStyle.confirmpasswordStyle,
                     validator: (val) {
                        if(_passwordController.text!=_comfirmpasswordController.text){
                          return 'confirm password is not correct';
                        }else if(val!.length<6){
                          return 'confirm password must be 6 charector';
                       }else{
                        return null;
                       }
                        },
                      ),
                    ),
                  
                  const SizedBox(height: 30,),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: TextButton(
                      onPressed: Register, 
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(appStyle.buttonColor)
                      ),
                      child:  Padding(
                        padding:  const EdgeInsets.symmetric(horizontal: 133,vertical: 5),
                        child:  Text('RIGISTER',
                        style: TextStyle(
                          color: appStyle.borderColor,
                          fontSize: 18,
                          fontWeight: FontWeight.bold
                        ),),
                      )),
                  ),
                  const SizedBox(height: 20,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                       Text('You have no account yet?',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: appStyle.textColor
                        ),),
                      TextButton(
                        onPressed: () {
                          nextScreen(context,SigninScreen());
                        }, 
                        child:  Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 15,
                            vertical: 3
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: appStyle.buttonColor,
                            border: Border.all(
                              width: 1,
                              color:appStyle.borderColor.withOpacity(0.4)
                            )
                          ),
                          child:  Text('SIGN IN',
                            style: TextStyle(
                            color: appStyle.borderColor,
                            fontWeight: FontWeight.bold,
                        ),),
                        )
                        )
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}