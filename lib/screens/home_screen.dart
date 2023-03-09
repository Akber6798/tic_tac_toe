import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tic_tac_toe/utilities/app_values.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool trun = true; //the first player is O
  List<String> displayGameValues = ['', '', '', '', '', '', '', '', ''];
  int scoreO = 0;
  int scoreX = 0;
  int filledBoxes = 0;
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: ()async{
        return showAppCloseDialogue();
      },
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            children: [
              SizedBox(height: 50.h),
              Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Player O',
                        style: GoogleFonts.kaushanScript(
                          textStyle: TextStyle(
                              color: trun
                                  ? AppValues.redColor
                                  : AppValues.whiteColor,
                              fontSize: 25.sp),
                        )),
                    SizedBox(height: 5.h),
                    Text(scoreO.toString(),
                        style: GoogleFonts.kaushanScript(
                          textStyle: TextStyle(
                              color: AppValues.whiteColor, fontSize: 27.sp),
                        )),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Player X',
                        style: GoogleFonts.kaushanScript(
                          textStyle: TextStyle(
                              color: trun
                                  ? AppValues.whiteColor
                                  : AppValues.redColor,
                              fontSize: 25.sp),
                        )),
                    SizedBox(height: 5.h),
                    Text(scoreX.toString(),
                        style: GoogleFonts.kaushanScript(
                          textStyle: TextStyle(
                              color: AppValues.whiteColor, fontSize: 27.sp),
                        )),
                  ],
                ),
              ]),
              SizedBox(height: 38.h),
              GridView.builder(
                shrinkWrap: true,
                itemCount: 9,
                gridDelegate:
                    const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      changeValue(index);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: AppValues.borderColor),
                      ),
                      child: Center(
                          child: Text(
                        displayGameValues[index],
                        style:
                            TextStyle(color: AppValues.whiteColor, fontSize: 40),
                      )),
                    ),
                  );
                },
              ),
              SizedBox(height: 70.h),
              SizedBox(
                  height: 65.h,
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white, shape: const StadiumBorder()),
                    onPressed: () {
                      restart();
                    },
                    child: Text('RESTART',
                        style: GoogleFonts.kaushanScript(
                          textStyle:
                              TextStyle(color: Colors.grey[900], fontSize: 30.sp),
                        )),
                  )),
            ],
          ),
        ),
      ),
    );
  }

  void changeValue(int index) {
    setState(() {
      if (trun == true && displayGameValues[index] == '') {
        displayGameValues[index] = 'O';
        filledBoxes = filledBoxes + 1;
      } else if (trun == false && displayGameValues[index] == '') {
        displayGameValues[index] = 'X';
        filledBoxes = filledBoxes + 1;
      }
      trun = !trun;
      checkWinner();
    });
  }

  void checkWinner() {
    //Rows

    //first row one
    if (displayGameValues[0] == displayGameValues[1] &&
        displayGameValues[0] == displayGameValues[2] &&
        displayGameValues[0] != '') {
      showDialogue(displayGameValues[0]);
    }
    //first row two
    else if (displayGameValues[1] == displayGameValues[0] &&
        displayGameValues[1] == displayGameValues[2] &&
        displayGameValues[1] != '') {
      showDialogue(displayGameValues[1]);
    } //first row three
    else if (displayGameValues[2] == displayGameValues[0] &&
        displayGameValues[2] == displayGameValues[1] &&
        displayGameValues[2] != '') {
      showDialogue(displayGameValues[2]);
    }

    //second row one
    else if (displayGameValues[3] == displayGameValues[4] &&
        displayGameValues[3] == displayGameValues[5] &&
        displayGameValues[3] != '') {
      showDialogue(displayGameValues[3]);
    }
    //second row two
    else if (displayGameValues[4] == displayGameValues[3] &&
        displayGameValues[4] == displayGameValues[5] &&
        displayGameValues[4] != '') {
      showDialogue(displayGameValues[4]);
    }
    //second row three
    else if (displayGameValues[5] == displayGameValues[3] &&
        displayGameValues[5] == displayGameValues[4] &&
        displayGameValues[5] != '') {
      showDialogue(displayGameValues[5]);
    }
    
    //third row one
    else if (displayGameValues[6] == displayGameValues[7] &&
        displayGameValues[6] == displayGameValues[8] &&
        displayGameValues[6] != '') {
      showDialogue(displayGameValues[6]);
    }
    //third row two
    else if (displayGameValues[7] == displayGameValues[6] &&
        displayGameValues[7] == displayGameValues[8] &&
        displayGameValues[7] != '') {
      showDialogue(displayGameValues[7]);
    }
    //third row three
    else if (displayGameValues[8] == displayGameValues[6] &&
        displayGameValues[8] == displayGameValues[7] &&
        displayGameValues[8] != '') {
      showDialogue(displayGameValues[8]);
    }

    //Column

    //first column one
    else if (displayGameValues[0] == displayGameValues[3] &&
        displayGameValues[0] == displayGameValues[6] &&
        displayGameValues[0] != '') {
      showDialogue(displayGameValues[0]);
    }
    //first  column one
    else if (displayGameValues[3] == displayGameValues[0] &&
        displayGameValues[3] == displayGameValues[6] &&
        displayGameValues[3] != '') {
      showDialogue(displayGameValues[3]);
    }
    //first  column three
    else if (displayGameValues[6] == displayGameValues[0] &&
        displayGameValues[6] == displayGameValues[3] &&
        displayGameValues[6] != '') {
      showDialogue(displayGameValues[6]);
    }

    //second column one
    else if (displayGameValues[1] == displayGameValues[4] &&
        displayGameValues[1] == displayGameValues[7] &&
        displayGameValues[1] != '') {
      showDialogue(displayGameValues[1]);
    }
    //second column two
    else if (displayGameValues[4] == displayGameValues[1] &&
        displayGameValues[4] == displayGameValues[7] &&
        displayGameValues[4] != '') {
      showDialogue(displayGameValues[4]);
    }
    //second column three
    else if (displayGameValues[7] == displayGameValues[1] &&
        displayGameValues[7] == displayGameValues[4] &&
        displayGameValues[7] != '') {
      showDialogue(displayGameValues[7]);
    }

    //Third column one
    else if (displayGameValues[2] == displayGameValues[5] &&
        displayGameValues[2] == displayGameValues[8] &&
        displayGameValues[2] != '') {
      showDialogue(displayGameValues[2]);
    }
    //Third column two
    else if (displayGameValues[5] == displayGameValues[2] &&
        displayGameValues[5] == displayGameValues[8] &&
        displayGameValues[5] != '') {
      showDialogue(displayGameValues[5]);
    }
    //Third column two
    else if (displayGameValues[8] == displayGameValues[2] &&
        displayGameValues[8] == displayGameValues[5] &&
        displayGameValues[8] != '') {
      showDialogue(displayGameValues[5]);
    }

    //Cross

    //cross one
    else if (displayGameValues[0] == displayGameValues[4] &&
        displayGameValues[0] == displayGameValues[8] &&
        displayGameValues[0] != '') {
      showDialogue(displayGameValues[0]);
    }
    //cross two
    else if (displayGameValues[4] == displayGameValues[0] &&
        displayGameValues[4] == displayGameValues[8] &&
        displayGameValues[4] != '') {
      showDialogue(displayGameValues[4]);
    }
    //cross three
    else if (displayGameValues[8] == displayGameValues[0] &&
        displayGameValues[8] == displayGameValues[4] &&
        displayGameValues[8] != '') {
      showDialogue(displayGameValues[8]);
    }
    //cross four
    else if (displayGameValues[2] == displayGameValues[6] &&
        displayGameValues[2] == displayGameValues[4] &&
        displayGameValues[2] != '') {
      showDialogue(displayGameValues[2]);
    }
    //cross five
    else if (displayGameValues[4] == displayGameValues[2] &&
        displayGameValues[4] == displayGameValues[6] &&
        displayGameValues[4] != '') {
      showDialogue(displayGameValues[4]);
    }
    //cross six
    else if (displayGameValues[6] == displayGameValues[2] &&
        displayGameValues[6] == displayGameValues[4] &&
        displayGameValues[6] != '') {
      showDialogue(displayGameValues[6]);
    } else if (filledBoxes == 9) {
      showDrawDialogue();
    }
  }

  void showDialogue(String winner) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('WINNER IS : Player $winner',
              style: GoogleFonts.kaushanScript(
                textStyle:
                    TextStyle(color: AppValues.mainColor, fontSize: 20.sp),
              )),
          actions: [
            TextButton(
                onPressed: () {
                  clearBoard();
                  Navigator.pop(context);
                },
                child: Text('Continue',
                    style: GoogleFonts.kaushanScript(
                      textStyle:
                          TextStyle(fontSize: 17.sp, color: AppValues.redColor),
                    )))
          ],
        );
      },
    );
    if (winner == 'O') {
      setState(() {
        scoreO = scoreO + 1;
      });
    } else if (winner == 'X') {
      setState(() {
        scoreX = scoreX + 1;
      });
    }
  }

  void showDrawDialogue() {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('DRAW',
              style: GoogleFonts.kaushanScript(
                textStyle:
                    TextStyle(color: AppValues.mainColor, fontSize: 20.sp),
              )),
          actions: [
            TextButton(
                onPressed: () {
                  clearBoard();
                  Navigator.pop(context);
                },
                child: Text('Re Match!',
                    style: GoogleFonts.kaushanScript(
                      textStyle:
                          TextStyle(fontSize: 17.sp, color: AppValues.redColor),
                    )))
          ],
        );
      },
    );
  }

  void clearBoard() {
    for (int i = 0; i < 9; i++) {
      setState(() {
        displayGameValues[i] = '';
      });
      filledBoxes = 0;
    }
  }

  void restart() {
    setState(() {
      scoreX = 0;
      scoreO = 0;
    });
    clearBoard();
  }

  Future<bool> showAppCloseDialogue() {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Do you want to exit the App',
              style: GoogleFonts.kaushanScript(
                textStyle:
                    TextStyle(color: AppValues.mainColor, fontSize: 18.sp),
              )),
          actions: [
            TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('NO',
                    style: GoogleFonts.kaushanScript(
                      textStyle:
                          TextStyle(fontSize: 17.sp, color: AppValues.redColor),
                    ))),
            TextButton(
                onPressed: () async{
                await  SystemNavigator.pop();
                },
                child: Text('YES',
                    style: GoogleFonts.kaushanScript(
                      textStyle:
                          TextStyle(fontSize: 17.sp, color: AppValues.redColor),
                    )))
          ],
        );
      },
    );
    return Future.value(false);
  }
}
