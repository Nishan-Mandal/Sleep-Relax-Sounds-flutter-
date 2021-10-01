import 'package:flutter/material.dart';

class addMore extends StatefulWidget {
  @override
  _addMoreState createState() => _addMoreState();
}

class _addMoreState extends State<addMore> {
  pushToPlayerPage(String music, String backgroundimage) {
    Navigator.pop(context, [music, backgroundimage]);
  }

  @override
  Widget build(BuildContext context) {
    var screen = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Center(
            child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Sleep Sounds",
              style: TextStyle(
                color: Colors.orange[600],
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
            Icon(
              Icons.music_note_outlined,
              color: Colors.orange[600],
            ),
          ],
        )),
      ),
      body: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            image: DecorationImage(
                image: AssetImage("stars.jpg"), fit: BoxFit.cover)),
        child: Column(
          children: [
            SizedBox(height: 30),
            Flexible(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 8, right: 8),
                      child: Row(
                        children: [
                          Flexible(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                children: [
                                  GestureDetector(
                                    onTap: () => pushToPlayerPage(
                                        "lake.mp3", "lake.jpg"),
                                    child: Container(
                                      decoration: BoxDecoration(
                                          image: DecorationImage(
                                              image: AssetImage("lake.jpg"),
                                              fit: BoxFit.cover),
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(20)),
                                      height: screen.width / 2.3,
                                      width: screen.width / 2.3,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      "Lake",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 8, right: 8),
                            child: Column(
                              children: [
                                GestureDetector(
                                  onTap: () =>
                                      pushToPlayerPage("farm.mp3", "farm.jpg"),
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        image: DecorationImage(
                                            image: AssetImage("farm.jpg"),
                                            fit: BoxFit.cover),
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    height: screen.width / 2.3,
                                    width: screen.width / 2.3,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    "Farm",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 20),
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8, right: 8),
                      child: Row(
                        children: [
                          Flexible(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                children: [
                                  GestureDetector(
                                    onTap: () => pushToPlayerPage(
                                        "forest.mp3", "forest.jpg"),
                                    child: Container(
                                      decoration: BoxDecoration(
                                          image: DecorationImage(
                                              image: AssetImage("forest.jpg"),
                                              fit: BoxFit.cover),
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(20)),
                                      height: screen.width / 2.3,
                                      width: screen.width / 2.3,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      "Forest",
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 20),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                GestureDetector(
                                  onTap: () =>
                                      pushToPlayerPage("fire.mp3", "fire.jpg"),
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        image: DecorationImage(
                                            image: AssetImage("fire.jpg"),
                                            fit: BoxFit.cover),
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    height: screen.width / 2.3,
                                    width: screen.width / 2.3,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    "Fire",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 20),
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8, right: 8),
                      child: Row(
                        children: [
                          Flexible(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                children: [
                                  GestureDetector(
                                    onTap: () => pushToPlayerPage(
                                        "Night.mp3", "night.jpg"),
                                    child: Container(
                                      decoration: BoxDecoration(
                                          image: DecorationImage(
                                              image: AssetImage("night.jpg"),
                                              fit: BoxFit.cover),
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(20)),
                                      height: screen.width / 2.3,
                                      width: screen.width / 2.3,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      "Night",
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 20),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                GestureDetector(
                                  onTap: () => pushToPlayerPage(
                                      "oceanWave.mp3", "ocean.jpg"),
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        image: DecorationImage(
                                            image: AssetImage("ocean.jpg"),
                                            fit: BoxFit.cover),
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    height: screen.width / 2.3,
                                    width: screen.width / 2.3,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    "Ocean",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 20),
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8, right: 8),
                      child: Row(
                        children: [
                          Flexible(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                children: [
                                  GestureDetector(
                                    onTap: () => pushToPlayerPage(
                                        "rain.mp3", "rain.jpg"),
                                    child: Container(
                                      decoration: BoxDecoration(
                                          image: DecorationImage(
                                              image: AssetImage("rain.jpg"),
                                              fit: BoxFit.cover),
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(20)),
                                      height: screen.width / 2.3,
                                      width: screen.width / 2.3,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      "Rain",
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 20),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 8, right: 8),
                            child: Column(
                              children: [
                                GestureDetector(
                                  onTap: () => pushToPlayerPage(
                                      "train.mp3", "train.jpg"),
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        image: DecorationImage(
                                            image: AssetImage("train.jpg"),
                                            fit: BoxFit.cover),
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    height: screen.width / 2.3,
                                    width: screen.width / 2.3,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    "Train",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 20),
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8, right: 8),
                      child: Row(
                        children: [
                          Flexible(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                children: [
                                  GestureDetector(
                                    onTap: () => pushToPlayerPage(
                                        "rain.mp3", "waterfall.jpg"),
                                    child: Container(
                                      decoration: BoxDecoration(
                                          image: DecorationImage(
                                              image:
                                                  AssetImage("waterfall.jpg"),
                                              fit: BoxFit.cover),
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(20)),
                                      height: screen.width / 2.3,
                                      width: screen.width / 2.3,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      "Waterfall",
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 20),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                GestureDetector(
                                  onTap: () => pushToPlayerPage(
                                      "wind.mp3", "airtravel.jpg"),
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        image: DecorationImage(
                                            image: AssetImage("airtravel.jpg"),
                                            fit: BoxFit.cover),
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    height: screen.width / 2.3,
                                    width: screen.width / 2.3,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    "Wind",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 20),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8, right: 8),
                      child: Row(
                        children: [
                          Flexible(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                children: [
                                  GestureDetector(
                                    onTap: () => pushToPlayerPage(
                                        "thunder.mp3", "thunder.jpg"),
                                    child: Container(
                                      decoration: BoxDecoration(
                                          image: DecorationImage(
                                              image: AssetImage("thunder.jpg"),
                                              fit: BoxFit.cover),
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(20)),
                                      height: screen.width / 2.3,
                                      width: screen.width / 2.3,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      "Thunder",
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 20),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                GestureDetector(
                                  onTap: () => pushToPlayerPage(
                                      "waterDrops.mp3", "waterDrops.jpg"),
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        image: DecorationImage(
                                            image: AssetImage("waterDrops.jpg"),
                                            fit: BoxFit.cover),
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    height: screen.width / 2.3,
                                    width: screen.width / 2.3,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    "Drip",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 20),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8, right: 8),
                      child: Row(
                        children: [
                          Flexible(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                children: [
                                  GestureDetector(
                                    onTap: () => pushToPlayerPage(
                                        "birds.mp3", "birds.jpg"),
                                    child: Container(
                                      decoration: BoxDecoration(
                                          image: DecorationImage(
                                              image: AssetImage("birds.jpg"),
                                              fit: BoxFit.cover),
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(20)),
                                      height: screen.width / 2.3,
                                      width: screen.width / 2.3,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      "Birds",
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 20),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                GestureDetector(
                                  onTap: () => pushToPlayerPage(
                                      "crowd.mp3", "crowd.jpg"),
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        image: DecorationImage(
                                            image: AssetImage("crowd.jpg"),
                                            fit: BoxFit.cover),
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    height: screen.width / 2.3,
                                    width: screen.width / 2.3,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    "Crowd",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 20),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8, right: 8),
                      child: Row(
                        children: [
                          Flexible(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                children: [
                                  GestureDetector(
                                    onTap: () => pushToPlayerPage(
                                        "flute.mp3", "flute.jpg"),
                                    child: Container(
                                      decoration: BoxDecoration(
                                          image: DecorationImage(
                                              image: AssetImage("flute.jpg"),
                                              fit: BoxFit.cover),
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(20)),
                                      height: screen.width / 2.3,
                                      width: screen.width / 2.3,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      "Flute",
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 20),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                GestureDetector(
                                  onTap: () => pushToPlayerPage(
                                      "heartbeat.mp3", "heartbeat.jpg"),
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        image: DecorationImage(
                                            image: AssetImage("heartbeat.jpg"),
                                            fit: BoxFit.cover),
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    height: screen.width / 2.3,
                                    width: screen.width / 2.3,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    "Heartbeat",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 20),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8, right: 8),
                      child: Row(
                        children: [
                          Flexible(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                children: [
                                  GestureDetector(
                                    onTap: () => pushToPlayerPage(
                                        "rain-on-window.mp3",
                                        "rain-on-window.jpg"),
                                    child: Container(
                                      decoration: BoxDecoration(
                                          image: DecorationImage(
                                              image: AssetImage(
                                                  "rain-on-window.jpg"),
                                              fit: BoxFit.cover),
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(20)),
                                      height: screen.width / 2.3,
                                      width: screen.width / 2.3,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      "Rain on Window",
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 20),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                GestureDetector(
                                  onTap: () =>
                                      pushToPlayerPage("wolf.mp3", "wolf.jpg"),
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        image: DecorationImage(
                                            image: AssetImage("wolf.jpg"),
                                            fit: BoxFit.cover),
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    height: screen.width / 2.3,
                                    width: screen.width / 2.3,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    "Wolf",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 20),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
