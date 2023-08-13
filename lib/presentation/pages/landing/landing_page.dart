import 'package:doculex_ai/presentation/widgets/buttons/rounded_text_button.dart';
import 'package:flutter/material.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/landing.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Doculex AI',
                style: TextStyle(fontSize: 72, fontWeight: FontWeight.w800),
              ),
              const SizedBox(height: 16),
              Text(
                'Discover Doculex.AI: Your ultimate solution for efficient legal document management',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white.withOpacity(0.8),
                ),
              ),
              const SizedBox(height: 32),
              RoundedTextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/sign-up');
                },
                label: 'Get Started',
                withGradient: true,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
