import 'package:flutter/material.dart';
import 'package:haleo/Scratch_card/details.dart';
import 'package:scratcher/widgets.dart';

class Cards extends StatelessWidget {
  const Cards({
    super.key,
    required this.type,
    required this.prize,
    required this.removeCard,
  });

  final int type;
  final int prize;
  final VoidCallback removeCard;

  String _backGroundImage(int type) {
    return type == 1
        ? 'lib/Scratch_card/assets/blue.png'
        : type == 2
            ? 'lib/Scratch_card/assets/red.png'
            : 'lib/Scratch_card/assets/yellow.png';
  }

  String _prizeImage(int prize) {
    return prize == 1
        ? 'lib/Scratch_card/assets/prize1.png'
        : 'lib/Scratch_card/assets/prize2.png';
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _dialogBuilder(
          context,
          scratchLayerImage: _backGroundImage(type),
          prizeImage: _prizeImage(prize),
          removeCard: removeCard,
        );
      },
      child: Container(
        width: MediaQuery.of(context).size.width * 0.45,
        height: MediaQuery.of(context).size.width * 0.45,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.blue,
          image: DecorationImage(
            fit: BoxFit.fill,
            image: AssetImage(_backGroundImage(type)),
          ),
        ),
      ),
    );
  }

  Future<void> _dialogBuilder(
    BuildContext context, {
    required String scratchLayerImage,
    required String prizeImage,
    required VoidCallback removeCard,
  }) {
    bool show = false;

    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return Dialog(
              backgroundColor: Colors.transparent,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.8,
                  height: MediaQuery.of(context).size.height * 0.4,
                  decoration: const BoxDecoration(
                    color: Colors.black,
                  ),
                  child: show
                      ? GestureDetector(
                          onTap: () {
                            removeCard();
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    const ScratchCardDetails(),
                              ),
                            );
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              image: DecorationImage(
                                fit: BoxFit.fill,
                                image: AssetImage(prizeImage),
                              ),
                            ),
                            alignment: Alignment.center,
                          ),
                        )
                      : Scratcher(
                          brushSize: 60,
                          threshold: 50,
                          image: Image.asset(
                            scratchLayerImage,
                            fit: BoxFit.fill,
                          ),
                          onChange: (value) {
                            if (value > 75 && !show) {
                              setState(() {
                                show = true;
                              });
                            }
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              image: DecorationImage(
                                fit: BoxFit.fill,
                                image: AssetImage(prizeImage),
                              ),
                            ),
                            alignment: Alignment.center,
                          ),
                        ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}