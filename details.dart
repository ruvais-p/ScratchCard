
import 'package:flutter/material.dart';
import 'package:haleo/Scratch_card/scratch_card.dart';

class ScratchCardDetails extends StatelessWidget {
  const ScratchCardDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: const BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage(
                  'lib/Scratch_card/assets/details.png',
                ),
              ),
            ),
          ),
          Positioned(
            left: 5.5,
            top: 11.5,
            child: IconButton(
              icon: const Icon(
                Icons.close_rounded,
                color: Colors.black,
                size: 30,
              ),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            ScratchCardScreen())); // Close ScratchCardDetails screen
              },
            ),
          ),
        ],
      ),
    );
  }
}