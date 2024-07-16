import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tic_tac/constants/app_color.dart';

class GameScreen extends StatefulWidget {
  const GameScreen({super.key});

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  bool oTurn = true;
  List<IconData?> displayElement = [
    null,
    null,
    null,
    null,
    null,
    null,
    null,
    null,
    null
  ];
  int filledBoxes = 0;
  String winnerMessage = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              winnerMessage,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            Container(
              color: const Color(AppColor.boardColor),
              height: 400,
              width: 350,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: 9,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    mainAxisSpacing: 10,
                    crossAxisCount: 3,
                    crossAxisSpacing: 10,
                  ),
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        _ontap(index);
                      },
                      child: Container(
                        decoration: const BoxDecoration(
                          color: Color(AppColor.tileColor),
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                        ),
                        child: Center(
                          child: Icon(
                            displayElement[index],
                            size: 50,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _clearBoard,
              child: const Text("Clear Board"),
            ),
          ],
        ),
      ),
    );
  }

  void _ontap(int index) {
    if (displayElement[index] == null && winnerMessage == '') {
      setState(() {
        displayElement[index] =
            oTurn ? FontAwesomeIcons.circle : FontAwesomeIcons.x;
        filledBoxes++;
        oTurn = !oTurn;
        _checkWinner();
      });
    }
  }

  void _checkWinner() {
    List<List<int>> winningCombinations = [
      [0, 1, 2],
      [3, 4, 5],
      [6, 7, 8],
      [0, 3, 6],
      [1, 4, 7],
      [2, 5, 8],
      [0, 4, 8],
      [2, 4, 6],
    ];

    for (var combination in winningCombinations) {
      IconData? first = displayElement[combination[0]];

      if (first != null &&
          first == displayElement[combination[1]] &&
          first == displayElement[combination[2]]) {
        _showWinMessage(first);
        return;
      }
    }

    if (filledBoxes == 9) {
      _showDrawMessage();
    }
  }

  void _showWinMessage(IconData winner) {
    setState(() {
      winnerMessage =
          "\"${winner == FontAwesomeIcons.circle ? 'O' : 'X'}\" is the Winner!!!";
    });
  }

  void _showDrawMessage() {
    setState(() {
      winnerMessage = "It's a Draw!";
    });
  }

  void _clearBoard() {
    setState(() {
      for (int i = 0; i < 9; i++) {
        displayElement[i] = null;
      }
      filledBoxes = 0;
      oTurn = true;
      winnerMessage = '';
    });
  }
}
