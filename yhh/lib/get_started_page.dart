import 'package:flutter/material.dart';
import 'package:yhh/login_page.dart';

class GetStarted extends StatelessWidget {
  const GetStarted({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 80,
              ),
              Center(
                child: Image.asset('assets/pic/manwithlaptop.jpg'),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 35),
                child: Text(
                  'Be Consistence With \nYour Daily Habit Using ',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ),
              Text(
                'To Do',
                style: Theme.of(context).textTheme.titleSmall,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 60),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (context) {
                      return const LoginPage();
                    }));
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Theme.of(context).colorScheme.primary,
                      minimumSize: const Size(250, 65)),
                  child: Text(
                    'Get Started',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
