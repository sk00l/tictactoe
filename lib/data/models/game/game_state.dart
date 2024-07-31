import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class GameState extends ChangeNotifier {
  bool oTurn = true;
  List<IconData?> displayElement = List.filled(9, null);
  int filledBoxes = 0;
  String winnerMessage = '';

// handles on tap for the game board
  void ontap(int index) {
    if (displayElement[index] == null && winnerMessage == '') {
      displayElement[index] =
          oTurn ? FontAwesomeIcons.circle : FontAwesomeIcons.x;
      filledBoxes++;
      oTurn = !oTurn;
      checkWinner();
      notifyListeners(); // Notify listeners to update the UI
    }
  }

  //checks winner from given list of combination

  void checkWinner() {
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
        showWinMessage(first);
        notifyListeners();
        return;
      }
    }

    if (filledBoxes == 9) {
      showDrawMessage();
      notifyListeners();
    }
  }

  void showWinMessage(IconData winner) {
    winnerMessage =
        "\"${winner == FontAwesomeIcons.circle ? 'O' : 'X'}\" is the Winner!!!";
  }

  void showDrawMessage() {
    winnerMessage = "It's a Draw!";
  }

  void clearBoard() {
    for (int i = 0; i < 9; i++) {
      displayElement[i] = null;
    }
    filledBoxes = 0;
    oTurn = true;
    winnerMessage = '';
    notifyListeners();
  }
}
