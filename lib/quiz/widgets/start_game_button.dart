import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:programming_quiz/components/ripple_button.dart';
import 'package:programming_quiz/core/router/app_router.dart';

class StartGameButton extends StatelessWidget {
  const StartGameButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DottedBorder(
      color: Colors.white,
      strokeWidth: 2,
      borderType: BorderType.RRect,
      strokeCap: StrokeCap.square,
      dashPattern: const [6],
      child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0,vertical: 6.0),
          child: Stack(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: 45.0,
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(8.0))
                ),
                child: const Center(child: Text("Start")),
              ),
              Positioned.fill(child: RippleButton(onTap: () {
                Navigator.pushNamed(context, AppRouter.questionAnswerMenu);
              }))
            ],
          ),
      ),
    );
  }
}

