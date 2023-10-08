import 'package:flutter/material.dart';
import 'package:yhh/ListOfItem/users.dart';
import 'package:yhh/login_page.dart';
import 'package:yhh/signup/sign_up_textfield.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  bool showPassword = true;
  var firstName = TextEditingController();
  var lastName = TextEditingController();
  var emails = TextEditingController();
  var passwords = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Sign Up With Us',
          style: Theme.of(context).textTheme.titleLarge,
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Icon(
              Icons.water_drop,
              size: 115,
            ),
            const SizedBox(
              height: 50,
            ),
            Text('Register', style: Theme.of(context).textTheme.bodyLarge),
            TextFieldSignUp(
              name: 'First',
              controller: firstName,
            ),
            TextFieldSignUp(
              name: 'Last',
              controller: lastName,
            ),
            TextFieldSignUp(
              name: 'Email',
              controller: emails,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
              child: TextField(
                obscureText: showPassword,
                controller: passwords,
                decoration: InputDecoration(
                  label: const Text('Password'),
                  contentPadding: const EdgeInsets.symmetric(horizontal: 3),
                  hintText: 'Enter your password',
                  suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        showPassword = !showPassword;
                      });
                    },
                    icon: const Icon(Icons.remove_red_eye),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
                style:
                    ElevatedButton.styleFrom(padding: const EdgeInsets.all(15)),
                onPressed: () {
                  _dialogBuilder(context);
                },
                child: const Text(
                  'Create account',
                  style: TextStyle(fontSize: 15),
                ))
          ],
        ),
      ),
    );
  }

  Future _dialogBuilder(BuildContext context) {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Confirm Sign Up?'),
            content:
                const Text('Your account will be created if you pressed Yes.'),
            actions: [
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('Cancel'),
              ),
              ElevatedButton(
                onPressed: () {
                  addNewAccount();
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) {
                    return const LoginPage();
                  }));
                },
                child: const Text('Create'),
              ),
            ],
          );
        });
  }

  void addNewAccount() async {
    String first = firstName.text;
    String last = lastName.text;
    String email = emails.text;
    String password = passwords.text;
    // debugPrint(first + last + email + password);
    user.add({
      'firstname': first,
      'lastname': last,
      'email': email,
      'password': password,
    });
    for (var userInfo in user) {
      debugPrint(
          'User: ${userInfo['firstname']} ${userInfo['lastname']}, Email: ${userInfo['email']}, Password: ${userInfo['password']}');
    }
  }
}
