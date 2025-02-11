import 'package:darquran/features/quran/presentation/widgets/features_grid.dart';
import 'package:darquran/features/quran/presentation/widgets/welcome_card.dart';
import 'package:flutter/material.dart';
import 'package:darquran/features/quran/presentation/pages/quran_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ختمة القرآن'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              const WelcomeCard(),
              const SizedBox(height: 20),
              FeaturesGrid(
                onQuranTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const QuranPage(),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

