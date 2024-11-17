import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tic_tac_toe/constants/colors.dart';

import '../constants/container_decoration.dart';
import '../constants/plaintexts.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool oTurn = true;
  List<String> displayXO = ['', '', '', '', '', '', '', '', ''];
  List<int> matchedIndexes = [];
  int attempts = 0;

  int oScore = 0;
  int xScore = 0;
  int filledBoxes = 0;
  String resultDeclaration = '';
  bool winnerFound = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 25),
            Expanded(
              flex: 1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text("O", style: mainGoogleTextStyle),
                  Container(
                    height: 60,
                    width: 100,
                    decoration: containerDecoration,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 12.0, horizontal: 25),
                      child: Text(
                        "$oScore : $xScore",
                        style: subTextGoogleTextStyle,
                      ),
                    ),
                  ),
                  Text("X", style: mainGoogleTextStyle)
                ],
              ),
            ),
            Expanded(
              flex: 6,
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: SizedBox(
                      width: 370,
                      height: 400,
                      child: GridView.builder(
                          itemCount: 9,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                          ),
                          itemBuilder: (BuildContext context, int index) {
                            return GestureDetector(
                              onTap: () {
                                _tapped(index);
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    width: 2,
                                    color: AppColors.appColor,
                                  ),
                                  color: matchedIndexes.contains(index)
                                      ? AppColors.peachOrangeColor
                                      : AppColors.orangeColor,
                                ),
                                child: Center(
                                  child: Text(
                                    displayXO[index],
                                    style: GoogleFonts.coiny(
                                        textStyle: TextStyle(
                                      fontSize: 74,
                                      color: matchedIndexes.contains(index)
                                          ? AppColors.titleColor
                                          : AppColors.appColor,
                                    )),
                                  ),
                                ),
                              ),
                            );
                          }),
                    ),
                  ),
                ],
              ),
            ),
            Column(
              children: [
                Text(resultDeclaration, style: mainGoogleTextStyle),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    _clearBoard();
                  },
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(32), // <-- Radius
                    ),
                  ),
                  child: Text("Reset Game", style: mainGoogleTextStyle),
                ),
              ],
            ),
            const SizedBox(height: 160),
          ],
        ),
      ),
    );
  }

  void _tapped(int index) {
    setState(() {
      if (oTurn && displayXO[index] == '') {
        displayXO[index] = 'O';
        filledBoxes++;
      } else if (!oTurn && displayXO[index] == '') {
        displayXO[index] = 'X';
        filledBoxes++;
      }

      oTurn = !oTurn;
      _checkWinner();
    });
  }

  void _checkWinner() {
    // check 1st row
    if (displayXO[0] == displayXO[1] &&
        displayXO[0] == displayXO[2] &&
        displayXO[0] != '') {
      setState(() {
        resultDeclaration = 'Player ${displayXO[0]} Wins!';
        matchedIndexes.addAll([0, 1, 2]);
        _updateScore(displayXO[0]);
      });
    }

    // check 2nd row
    if (displayXO[3] == displayXO[4] &&
        displayXO[3] == displayXO[5] &&
        displayXO[3] != '') {
      setState(() {
        resultDeclaration = 'Player ${displayXO[3]} Wins!';
        matchedIndexes.addAll([3, 4, 5]);
        _updateScore(displayXO[3]);
      });
    }

    // check 3rd row
    if (displayXO[6] == displayXO[7] &&
        displayXO[6] == displayXO[8] &&
        displayXO[6] != '') {
      setState(() {
        resultDeclaration = 'Player ${displayXO[6]} Wins!';
        matchedIndexes.addAll([6, 7, 8]);
        _updateScore(displayXO[6]);
      });
    }

    // check 1st column
    if (displayXO[0] == displayXO[3] &&
        displayXO[0] == displayXO[6] &&
        displayXO[0] != '') {
      setState(() {
        resultDeclaration = 'Player ${displayXO[0]} Wins!';
        matchedIndexes.addAll([0, 3, 6]);
        _updateScore(displayXO[0]);
      });
    }

    // check 2nd column
    if (displayXO[1] == displayXO[4] &&
        displayXO[1] == displayXO[7] &&
        displayXO[1] != '') {
      setState(() {
        resultDeclaration = 'Player ${displayXO[1]} Wins!';
        matchedIndexes.addAll([1, 4, 7]);
        _updateScore(displayXO[1]);
      });
    }

    // check 3rd column
    if (displayXO[2] == displayXO[5] &&
        displayXO[2] == displayXO[8] &&
        displayXO[2] != '') {
      setState(() {
        resultDeclaration = 'Player ${displayXO[2]} Wins!';
        matchedIndexes.addAll([2, 5, 8]);
        _updateScore(displayXO[2]);
      });
    }

    // check diagonal
    if (displayXO[0] == displayXO[4] &&
        displayXO[0] == displayXO[8] &&
        displayXO[0] != '') {
      setState(() {
        resultDeclaration = 'Player ${displayXO[0]} Wins!';
        matchedIndexes.addAll([0, 4, 8]);
        _updateScore(displayXO[0]);
      });
    }

    // check diagonal
    if (displayXO[6] == displayXO[4] &&
        displayXO[6] == displayXO[2] &&
        displayXO[6] != '') {
      setState(() {
        resultDeclaration = 'Player ${displayXO[6]} Wins!';
        matchedIndexes.addAll([6, 4, 2]);
        _updateScore(displayXO[6]);
      });
    }
    if (!winnerFound && filledBoxes == 9) {
      setState(() {
        resultDeclaration = 'Nobody Wins!';
      });
    }
  }

  void _updateScore(String winner) {
    if (winner == 'O') {
      oScore++;
    } else if (winner == 'X') {
      xScore++;
    }
    winnerFound = true;
  }

  void _clearBoard() {
    setState(() {
      for (int i = 0; i < 9; i++) {
        displayXO[i] = '';
      }
      resultDeclaration = '';
      matchedIndexes = [];
    });
    filledBoxes = 0;
  }
}
