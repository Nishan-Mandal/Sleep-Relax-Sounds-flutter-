import 'dart:async';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:avatar_glow/avatar_glow.dart';

import 'package:stop_watch_timer/stop_watch_timer.dart';

import 'addMoreMusic.dart';

double volume0 = 1.0;
double volume1 = 1.0;
double volume2 = 1.0;

class player extends StatefulWidget {
  String music;
  String backgroundImage;
  player(this.music, this.backgroundImage);
  @override
  _playerState createState() => _playerState();
}

AudioPlayer plr1 = AudioPlayer();
AudioPlayer plr2 = AudioPlayer();
AudioPlayer plr3 = AudioPlayer();

AudioCache player1 = AudioCache(fixedPlayer: plr1);
AudioCache player2 = AudioCache(fixedPlayer: plr2);
AudioCache player3 = AudioCache(fixedPlayer: plr3);

class _playerState extends State<player> with TickerProviderStateMixin {
  bool isMusicPlaying = true;

  Future<void> playMusic() async {
    await player1.loop(
      widget.music,
    );
  }

  Future<void> playMusic2(String music) async {
    try {
      await player2.loop(
        music,
      );
    } catch (e) {}
  }

  Future<void> playMusic3(String music) async {
    try {
      await player3.loop(music);
    } catch (e) {}
  }

  AnimationController controller;

  bool isPlaying = false;
  bool isUsingTimer = false;
  String playerImage1;
  String playerImage2;
  String playerMusic1;
  String playerMusic2;

  void move(int playerNo) async {
    final List info = await Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => addMore(),
        ));
    updateInfo(info, playerNo);
  }

  updateInfo(List info, int playerNo) {
    setState(() {
      try {
        if (playerNo == 1) {
          if (isMusicPlaying) {
            playMusic2(info[0]);
          }
          playerImage1 = info[1];
          playerMusic1 = info[0];
        } else {
          if (isMusicPlaying) {
            playMusic3(info[0]);
          }

          playerImage2 = info[1];
          playerMusic2 = info[0];
        }
      } catch (e) {}
    });
  }

  String get countText {
    Duration count = controller.duration * controller.value;
    return controller.isDismissed
        ? '${controller.duration.inHours.toString().padLeft(2, '0')}:${(controller.duration.inMinutes % 60).toString().padLeft(2, '0')}:${(controller.duration.inSeconds % 60).toString().padLeft(2, '0')}'
        : '${count.inHours}:${(count.inMinutes % 60).toString().padLeft(2, '0')}:${(count.inSeconds % 60).toString().padLeft(2, '0')}';
  }

  double progress = 1.0;

  void notify() {
    if (countText == '0:00:00') {
      setState(() {
        plr1.stop();
        plr2.stop();
        plr3.stop();
        isMusicPlaying = false;
      });
    }
  }

  @override
  void initState() {
    super.initState();

    playMusic();
    controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 60),
    );

    controller.addListener(() {
      notify();
      if (controller.isAnimating) {
        setState(() {
          progress = controller.value;
        });
      } else {
        setState(() {
          progress = 1.0;
          isPlaying = false;
        });
      }
    });
  }

  @override
  void dispose() {
    controller.dispose();
    plr1.stop();
    plr2.stop();
    plr3.stop();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var screen = MediaQuery.of(context).size;
    return Scaffold(
        floatingActionButton: Align(
          alignment: Alignment.topLeft,
          child: Padding(
            padding: const EdgeInsets.only(top: 60, left: 30),
            child: IconButton(
              icon: Icon(Icons.arrow_back, color: Colors.white),
              onPressed: () => Navigator.pop(context),
            ),
          ),
        ),
        body: Container(
          height: screen.height,
          width: screen.width,
          decoration: BoxDecoration(
              image: DecorationImage(
            image: AssetImage(
              widget.backgroundImage,
            ),
            fit: BoxFit.cover,
          )),
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              Stack(
                alignment: Alignment.center,
                children: [
                  AvatarGlow(
                    animate: isMusicPlaying,
                    endRadius: 160,
                    child: GestureDetector(
                      onTap: () {},
                      child: !isUsingTimer
                          ? GestureDetector(
                              onTap: () => bottomsheet(),
                              child: Container(
                                alignment: Alignment.center,
                                height: 200,
                                width: 200,
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        width: 3, color: Colors.white),
                                    borderRadius: BorderRadius.circular(100)),
                                child: Text(
                                  "Timer",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 40,
                                      color: Colors.white),
                                ),
                              ),
                            )
                          : Stack(
                              alignment: Alignment.center,
                              children: [
                                SizedBox(
                                  width: 200,
                                  height: 200,
                                  child: CircularProgressIndicator(
                                    backgroundColor: Colors.grey.shade400,
                                    valueColor: AlwaysStoppedAnimation<Color>(
                                        Colors.white),
                                    value: progress,
                                    strokeWidth: 6,
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    controller.stop();
                                    bottomsheet();
                                  },
                                  child: AnimatedBuilder(
                                    animation: controller,
                                    builder: (context, child) => Text(
                                      countText,
                                      style: TextStyle(
                                          fontSize: 40,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    child: SizedBox(
                      width: 250,
                      child: Slider(
                        inactiveColor: Colors.white,
                        value: volume0,
                        min: 0.0,
                        max: 1.0,
                        label: volume0.round().toString(),
                        onChanged: (value) {
                          setState(() {
                            volume0 = value;
                            plr1.setVolume(value);
                          });
                        },
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: screen.height * 0.2,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          if (playerImage1 != null) {
                            setState(() {
                              plr2.stop();
                              playerImage1 = null;
                              playerMusic1 = null;
                            });
                          } else {
                            move(1);
                          }
                        },
                        child: Container(
                            height: 100,
                            width: 100,
                            decoration: BoxDecoration(
                                image: playerImage1 != null
                                    ? DecorationImage(
                                        image: AssetImage(playerImage1),
                                        fit: BoxFit.cover)
                                    : null,
                                border: Border.all(color: Colors.white),
                                borderRadius: BorderRadius.circular(50)),
                            child: Icon(
                              playerImage1 != null
                                  ? Icons.cancel_outlined
                                  : Icons.add,
                              size: 40,
                              color: Colors.white,
                            )),
                      ),
                      playerMusic1 != null
                          ? SizedBox(
                              width: 150,
                              child: Slider(
                                inactiveColor: Colors.white,
                                value: volume1,
                                min: 0.0,
                                max: 1.0,
                                label: volume1.round().toString(),
                                onChanged: (value) {
                                  setState(() {
                                    volume1 = value;
                                    plr2.setVolume(value);
                                  });
                                },
                              ),
                            )
                          : SizedBox(
                              height: 50,
                            ),
                    ],
                  ),
                  SizedBox(
                    width: 30,
                  ),
                  Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          if (playerImage2 != null) {
                            setState(() {
                              plr3.stop();
                              playerImage2 = null;
                              playerMusic2 = null;
                            });
                          } else {
                            move(2);
                          }
                        },
                        child: Container(
                            height: 100,
                            width: 100,
                            decoration: BoxDecoration(
                                image: playerImage2 != null
                                    ? DecorationImage(
                                        image: AssetImage(playerImage2),
                                        fit: BoxFit.cover)
                                    : null,
                                border: Border.all(color: Colors.white),
                                borderRadius: BorderRadius.circular(50)),
                            child: Icon(
                              playerImage2 != null
                                  ? Icons.cancel_outlined
                                  : Icons.add,
                              size: 40,
                              color: Colors.white,
                            )),
                      ),
                      playerMusic2 != null
                          ? SizedBox(
                              width: 150,
                              child: Slider(
                                inactiveColor: Colors.white,
                                value: volume2,
                                min: 0.0,
                                max: 1.0,
                                label: volume2.round().toString(),
                                onChanged: (value) {
                                  setState(() {
                                    volume2 = value;
                                    plr3.setVolume(value);
                                  });
                                },
                              ),
                            )
                          : SizedBox(
                              height: 50,
                            ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: screen.height * 0.07,
              ),
              GestureDetector(
                onTap: () {
                  if (isMusicPlaying) {
                    controller.stop();
                    setState(() {
                      plr1.stop();
                      if (playerMusic1 != null) {
                        plr2.stop();
                      }
                      if (playerMusic2 != null) {
                        plr3.stop();
                      }

                      isMusicPlaying = false;
                      isPlaying = false;
                    });
                  } else {
                    controller.reverse(
                        from: controller.value == 0 ? 1.0 : controller.value);
                    setState(() {
                      playMusic();
                      if (playerMusic1 != null) {
                        playMusic2(playerMusic1);
                      }
                      if (playerMusic2 != null) {
                        playMusic3(playerMusic2);
                      }

                      isMusicPlaying = true;
                      isPlaying = true;
                    });
                  }
                },
                child: Container(
                  height: 50,
                  width: 180,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.white),
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(20),
                          bottomRight: Radius.circular(20),
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20))),
                  child: Icon(
                    isMusicPlaying == true ? Icons.pause : Icons.play_arrow,
                    color: Colors.white,
                    size: 30,
                  ),
                ),
              ),
            ],
          ),
        ));
  }

  bottomsheet() {
    showModalBottomSheet(
      context: context,
      builder: (context) => Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            color: Colors.lime,
            height: 250,
            child: CupertinoTimerPicker(
              initialTimerDuration: controller.duration,
              onTimerDurationChanged: (time) {
                setState(() {
                  controller.duration = time;
                });
              },
            ),
          ),
          Container(
            color: Colors.lime,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 50),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      if (controller.isAnimating) {
                        controller.stop();
                        setState(() {
                          isPlaying = false;
                        });
                      } else {
                        controller.reverse(
                            from:
                                controller.value == 0 ? 1.0 : controller.value);
                        setState(() {
                          playMusic();
                          if (playerMusic1 != null) {
                            playMusic2(playerMusic1);
                          }
                          if (playerMusic2 != null) {
                            playMusic3(playerMusic2);
                          }

                          isMusicPlaying = true;
                          isPlaying = true;
                          isUsingTimer = true;
                        });
                      }

                      Navigator.pop(context);
                    },
                    child: Container(
                        height: 50,
                        width: 120,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.white),
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(20),
                                bottomRight: Radius.circular(20),
                                topLeft: Radius.circular(20),
                                topRight: Radius.circular(20))),
                        child: Text("Set Timer")),
                  ),
                  SizedBox(
                    width: 50,
                  ),
                  GestureDetector(
                    onTap: () {
                      controller.stop();
                      setState(() {
                        isUsingTimer = false;
                      });
                      Navigator.pop(context);
                    },
                    child: Container(
                        height: 50,
                        width: 120,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.white),
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(20),
                                bottomRight: Radius.circular(20),
                                topLeft: Radius.circular(20),
                                topRight: Radius.circular(20))),
                        child: Text("Remove timer")),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
