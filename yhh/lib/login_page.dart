import 'package:flutter/material.dart';
import 'package:yhh/ListOfItem/users.dart';
import 'package:yhh/signup/signup_page.dart';
import 'package:yhh/to_do_list.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var usercontroller = TextEditingController();
  var passwordController = TextEditingController();
  late String username;
  late String password;
  bool isValid = false;

  Future loginerror(BuildContext context) async {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
              title: const Text('Sign Up failed'),
              content: const Text(
                'Username and Password don\'t match \nPlease Try Again',
                style: TextStyle(fontSize: 14),
              ),
              actions: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text('Ok'),
                ),
              ]);
        });
  }

//Login Button

  void login() async {
    setState(() {
      username = usercontroller.text;
      password = passwordController.text;
      for (var userInfo in user) {
        String storedUsername = userInfo['email'];
        String storedPassword = userInfo['password'];
        if (username == storedUsername && password == storedPassword) {
          isValid = true;
          break;
        } else {
          isValid = false;
        }
      }
      isValid
          ? Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) {
                  return const ToDoList();
                },
              ),
            )
          : loginerror(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'YHH IT Solution',
          style: Theme.of(context).textTheme.titleLarge,
        ),
        centerTitle: true,
        toolbarHeight: 75,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 70,
            ),
            const Icon(
              Icons.account_circle,
              size: 115,
            ),
            const SizedBox(
              height: 55,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 70),
              child: TextField(
                controller: usercontroller,
                textInputAction: TextInputAction.next,
                decoration: const InputDecoration(
                    hintText: 'Enter your username',
                    contentPadding: EdgeInsets.symmetric(horizontal: 5)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 70, vertical: 23),
              child: TextField(
                controller: passwordController,
                decoration: const InputDecoration(
                    hintText: 'Enter your password',
                    contentPadding: EdgeInsets.symmetric(horizontal: 5)),
              ),
            ),
            ElevatedButton.icon(
              onPressed: login,
              icon: const Icon(Icons.login),
              label:
                  Text('Login', style: Theme.of(context).textTheme.bodyLarge),
              style: ElevatedButton.styleFrom(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 35, vertical: 10),
                  backgroundColor: Theme.of(context).colorScheme.secondary),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Don\'t have a account?'),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) {
                        return const SignUpPage();
                      }),
                    );
                  },
                  child: const Text('Sign In'),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
