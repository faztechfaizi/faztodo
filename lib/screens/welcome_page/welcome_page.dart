import 'package:faztodo/screens/home_page/home_page.dart';
import 'package:flutter/material.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(child: Image.asset('assets/images/welcome.png')),
            const SizedBox(height: 20,),
            Text(
              'Manage your Tasks',
              style: Theme.of(context).textTheme.headlineLarge,
            ),
            const Text(
              'Organize, plan, and collaborate on tasks with FazTodo.\nYour busy life deserves this.you can manage \n checklist and your goal.',
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 50,),

            SizedBox(
              height: 60,
              width: double.infinity,
              child: ElevatedButton(onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>const HomePage()));
              }, child: const Text('Get Started',style: TextStyle(fontSize: 20),))),
          ],
        ),
      ),
    );
  }
}
