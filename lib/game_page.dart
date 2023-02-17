import 'package:flutter/material.dart';

class GamePage extends StatefulWidget {
  const GamePage({super.key});

  @override
  State<GamePage> createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  bool oPlayer = true; // first player

  List<String> displayEx0h = [
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      body: GridView.builder(
        itemCount: 9,
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {
              _tapped(index);
            },
            child: Container(
              decoration:
                  BoxDecoration(border: Border.all(color: Colors.white38)),
              child: Center(
                child: Text(
                  displayEx0h[index],
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  void _tapped(int index) {
    setState(() {
      if (oPlayer) {
        displayEx0h[index] = '◯';
      } else {
        displayEx0h[index] = '✗';
      }

      oPlayer = !oPlayer;
      _winnerCheck();
    });
  }

  void _winnerCheck() {
    // row 1
    if (displayEx0h[0] == displayEx0h[1] &&
        displayEx0h[0] == displayEx0h[2] &&
        displayEx0h[0] != '') {
      _showDialog(displayEx0h[0]);
    }

    // row 2
    if (displayEx0h[3] == displayEx0h[4] &&
        displayEx0h[3] == displayEx0h[5] &&
        displayEx0h[3] != '') {
      _showDialog(displayEx0h[3]);
    }

    // row 3
    if (displayEx0h[6] == displayEx0h[7] &&
        displayEx0h[6] == displayEx0h[8] &&
        displayEx0h[6] != '') {
      _showDialog(displayEx0h[6]);
    }

    // column 1
    if (displayEx0h[0] == displayEx0h[3] &&
        displayEx0h[0] == displayEx0h[6] &&
        displayEx0h[0] != '') {
      _showDialog(displayEx0h[0]);
    }

    // column 2
    if (displayEx0h[1] == displayEx0h[4] &&
        displayEx0h[1] == displayEx0h[7] &&
        displayEx0h[1] != '') {
      _showDialog(displayEx0h[1]);
    }

    // column 3
    if (displayEx0h[2] == displayEx0h[5] &&
        displayEx0h[2] == displayEx0h[8] &&
        displayEx0h[2] != '') {
      _showDialog(displayEx0h[2]);
    }

    // diagonl 1
    if (displayEx0h[6] == displayEx0h[4] &&
        displayEx0h[6] == displayEx0h[2] &&
        displayEx0h[6] != '') {
      _showDialog(displayEx0h[6]);
    }

    // diagonl 2
    if (displayEx0h[0] == displayEx0h[4] &&
        displayEx0h[0] == displayEx0h[8] &&
        displayEx0h[0] != '') {
      _showDialog(displayEx0h[0]);
    }
  }

  void _showDialog(String winner) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
        return AlertDialog(
          title: Text('WINNER IS: ' + winner),
        );
      }
    );
  }
}
