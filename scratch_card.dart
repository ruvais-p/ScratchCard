import 'package:flutter/material.dart';
import 'package:haleo/Scratch_card/card.dart';
import 'package:provider/provider.dart';
import 'package:scratcher/widgets.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => ScratchCardProvider(),
      child: MaterialApp(home: ScratchCardScreen()),
    ),
  );
}

class ScratchCardProvider extends ChangeNotifier {
  List<Map<String, int>> _cardsList = [
    {'type': 1, 'prize': 1},
    {'type': 1, 'prize': 2},
    {'type': 2, 'prize': 1},
    {'type': 3, 'prize': 1},
    {'type': 3, 'prize': 2},
    {'type': 1, 'prize': 1},
  ];

  List<Map<String, int>> get cardsList => _cardsList;

  void removeCard(int index) {
    _cardsList.removeAt(index);
    notifyListeners(); // Notify listeners to update the UI
  }
}

class ScratchCardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(),
      ),
      body: Center(
        child: Consumer<ScratchCardProvider>(
          builder: (context, provider, child) {
            return Wrap(
              spacing: 8.0,
              runSpacing: 8.0,
              children: List.generate(provider.cardsList.length, (index) {
                final cardData = provider.cardsList[index];
                return Cards(
                  type: cardData['type']!,
                  prize: cardData['prize']!,
                  removeCard: () => provider.removeCard(index),
                );
              }),
            );
          },
        ),
      ),
    );
  }
}



