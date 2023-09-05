import 'package:flutter/material.dart';
import 'package:palestine_console/palestine_console.dart';
import 'package:text_calculator/text_calculator.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Text Calculator',
      theme: ThemeData(
        // fontFamily: 'Pretendard',
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(title: 'Text Calculator Demo'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final textcalculator = TextCalculator();
  List<Widget> pagedTextWidget = [];
  void setPagedTextWidget({required List<Widget> pagedTextWidget}) {
    setState(() {
      pagedTextWidget = pagedTextWidget;
    });
  }

  final double leftMargin = 12;
  final double leftPadding = 12;
  final double rightMargin = 12;
  final double rightPadding = 12;
  final double topMargin = 20;
  final double topPadding = 12;
  final double bottomMargin = 20;
  final double bottomPadding = 12;
  final double fontSize = 18;
  late int currentParagraphIndex = 0;
  late int currentPageIndex = 0;
  final globalKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    initTextCalculator();
    // WidgetsBinding.instance.addPostFrameCallback((_) async {
    //   try {
    //     await textcalculator.calculateFirstOffset();
    //   } catch (e, s) {
    //     Print.red(e.toString());
    //     Print.red(s.toString());
    //   }
    // });
  }

  Future<void> initTextCalculator() async {
    await textcalculator.setOriginText(
        originText:
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. At elementum eu facilisis sed odio morbi quis commodo. \nCras tincidunt lobortis feugiat vivamus at augue eget. Lacus luctus accumsan tortor posuere ac. Sit amet consectetur adipiscing elit duis. Rutrum quisque non tellus orci ac auctor augue. Nascetur ridiculus mus mauris vitae ultricies leo integer malesuada. Augue lacus viverra vitae congue eu consequat ac felis donec. Velit ut tortor pretium viverra suspendisse potenti. Ac turpis egestas maecenas pharetra convallis posuere morbi. Quis viverra nibh cras pulvinar mattis nunc sed. Ullamcorper malesuada proin libero nunc consequat interdum varius sit amet. Posuere ac ut consequat semper. Lectus magna fringilla urna porttitor rhoncus dolor. Vulputate eu scelerisque felis imperdiet proin fermentum leo vel. Odio ut enim blandit volutpat maecenas volutpat blandit.\n###Pellentesque nec nam aliquam sem. Quam pellentesque nec nam aliquam sem et tortor. Eget lorem dolor sed viverra ipsum nunc aliquet bibendum enim. Porta lorem mollis aliquam ut porttitor. Scelerisque eu ultrices vitae auctor eu augue ut lectus. Semper eget duis at tellus at urna condimentum mattis pellentesque. Vitae turpis massa sed elementum tempus egestas sed. Rhoncus est pellentesque elit ullamcorper dignissim cras tincidunt. Sapien et ligula ullamcorper malesuada proin. Ac placerat vestibulum lectus mauris ultrices eros in cursus.\n###Et ligula ullamcorper malesuada proin libero nunc consequat. Libero volutpat sed cras ornare arcu dui. Non consectetur a erat nam at. Dignissim suspendisse in est ante in nibh mauris cursus. Sit amet massa vitae tortor condimentum lacinia quis vel. Amet aliquam id diam maecenas ultricies mi. Dui nunc mattis enim ut tellus elementum sagittis vitae. Facilisi morbi tempus iaculis urna id volutpat lacus. Dignissim cras tincidunt lobortis feugiat vivamus at augue eget arcu. Lorem sed risus ultricies tristique nulla aliquet enim tortor at. At in tellus integer feugiat scelerisque varius morbi. Dui ut ornare lectus sit amet est. Massa tincidunt nunc pulvinar sapien et ligula ullamcorper malesuada proin. Enim praesent elementum facilisis leo vel fringilla est. Elit ut aliquam purus sit amet luctus venenatis lectus magna. Eros donec ac odio tempor. Aenean et tortor at risus.\n###Cras pulvinar mattis nunc sed blandit libero volutpat. Tortor aliquam nulla facilisi cras fermentum. Nisi vitae suscipit tellus mauris a diam maecenas. Sit amet nulla facilisi morbi tempus. Fermentum dui faucibus in ornare quam viverra orci sagittis eu. Volutpat blandit aliquam etiam erat. Enim sed faucibus turpis in eu mi. Ornare quam viverra orci sagittis. In metus vulputate eu scelerisque felis. Risus pretium quam vulputate dignissim suspendisse in est ante. Id consectetur purus ut faucibus. Facilisis mauris sit amet massa vitae. Dictum varius duis at consectetur lorem donec massa. Accumsan in nisl nisi scelerisque eu ultrices vitae auctor. Volutpat blandit aliquam etiam erat velit scelerisque in. Id interdum velit laoreet id donec ultrices tincidunt arcu non.\n###Diam sollicitudin tempor id eu nisl nunc mi ipsum faucibus. Ultrices vitae auctor eu augue ut. Faucibus scelerisque eleifend donec pretium vulputate sapien nec sagittis. Faucibus interdum posuere lorem ipsum dolor sit. Ultrices mi tempus imperdiet nulla malesuada pellentesque elit. Pellentesque elit ullamcorper dignissim cras tincidunt. Purus gravida quis blandit turpis. Mauris in aliquam sem fringilla ut. Massa ultricies mi quis hendrerit dolor. Quam viverra orci sagittis eu volutpat odio facilisis. Faucibus turpis in eu mi bibendum neque. Facilisis gravida neque convallis a cras. Mauris sit amet massa vitae tortor condimentum. Enim nec dui nunc mattis enim ut tellus elementum. Sed felis eget velit aliquet sagittis id consectetur purus ut. Eget egestas purus viverra accumsan in nisl nisi scelerisque. Ac odio tempor orci dapibus ultrices in iaculis. Non quam lacus suspendisse faucibus interdum posuere lorem ipsum dolor. Amet aliquam id diam maecenas ultricies mi eget mauris pharetra. Dictum non consectetur a erat nam at lectus.');
    await textcalculator.setFontSize(fontSize: 18);
    // await textcalculator.setisDebugMessageOn(newBool: false);
  }

  Future<void> updateTextCalculator(BuildContext context) async {
    await textcalculator.setHeight(
        height: MediaQuery.of(context).size.height * 0.6 -
            (topPadding + bottomPadding));
    await textcalculator.setWidth(
        width: MediaQuery.of(context).size.width -
            (leftMargin + leftPadding + rightMargin + rightPadding));
    await textcalculator.generateTotalTextList();
    await textcalculator.generateTotalGlobalKeyList();
    await textcalculator.generateTotalTextWidgetList();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          appBar: AppBar(
            backgroundColor: Theme.of(context).colorScheme.inversePrimary,
            title: Text(widget.title),
          ),
          body: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  LayoutBuilder(builder: (context, constraints) {
                    return FutureBuilder(
                        future: updateTextCalculator(context),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.done) {
                            try {
                              pagedTextWidget =
                                  textcalculator.totalTextWidgetList[
                                      currentParagraphIndex][currentPageIndex];
                            } catch (e) {
                              if (e is RangeError) {
                                setState(() {
                                  currentPageIndex = 0;
                                });
                              }
                            }

                            return Column(
                              children: [
                                Text(
                                  'currentParagraphIndex : $currentParagraphIndex',
                                  style: const TextStyle(fontSize: 10),
                                ),
                                Text('currentPageIndex : $currentPageIndex',
                                    style: const TextStyle(fontSize: 10)),
                                Text(
                                    'Paragraph : $currentParagraphIndex/${textcalculator.totalTextWidgetList.length - 1}',
                                    style: const TextStyle(fontSize: 10)),
                                Text(
                                    'Page : $currentPageIndex/${textcalculator.totalTextWidgetList[currentParagraphIndex].length - 1}',
                                    style: const TextStyle(fontSize: 10)),
                                Container(
                                    key: globalKey,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color: Colors.amber,
                                    ),
                                    height: MediaQuery.of(context).size.height *
                                        0.6,
                                    margin: EdgeInsets.fromLTRB(leftMargin,
                                        topMargin, rightMargin, bottomMargin),
                                    padding: EdgeInsets.fromLTRB(
                                        leftPadding,
                                        topPadding,
                                        rightPadding,
                                        bottomPadding),
                                    child: Align(
                                      alignment: Alignment.centerLeft,
                                      child: Column(
                                        children: List.from(pagedTextWidget),
                                      ),
                                    )),
                              ],
                            );
                          } else if (snapshot.connectionState ==
                              ConnectionState.values) {
                            return Column(
                              children: [
                                // Text(
                                //     'totalParagraphCount : ${textcalculator.totalTextWidgetList.length}'),
                                Text(
                                    'currentParagraphIndex : $currentParagraphIndex',
                                    style: const TextStyle(fontSize: 10)),
                                Text('currentPageIndex : $currentPageIndex',
                                    style: const TextStyle(fontSize: 10)),
                                Text(
                                    'Paragraph : $currentParagraphIndex/${textcalculator.totalTextWidgetList.length - 1}',
                                    style: const TextStyle(fontSize: 10)),
                                Text(
                                    'Page : $currentPageIndex/${textcalculator.totalTextWidgetList[currentParagraphIndex].length - 1}',
                                    style: const TextStyle(fontSize: 10)),
                                Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color: Colors.amber,
                                    ),
                                    height: MediaQuery.of(context).size.height *
                                        0.6,
                                    margin: EdgeInsets.fromLTRB(leftMargin,
                                        topMargin, rightMargin, bottomMargin),
                                    padding: EdgeInsets.fromLTRB(
                                        leftPadding,
                                        topPadding,
                                        rightPadding,
                                        bottomPadding),
                                    child: Align(
                                      alignment: Alignment.centerLeft,
                                      child: Column(
                                        children: List.from(pagedTextWidget),
                                      ),
                                    )),
                              ],
                            );
                          } else {
                            return const SizedBox.shrink();
                          }
                        });
                  }),
                  Row(
                    children: [
                      ElevatedButton(
                        onPressed: () async {
                          if (currentPageIndex ==
                                  textcalculator
                                          .totalTextWidgetList[
                                              currentParagraphIndex]
                                          .length -
                                      1 &&
                              currentParagraphIndex ==
                                  textcalculator.totalTextWidgetList.length -
                                      1) {
                            Print.red("Last Page");
                          } else if (currentPageIndex <
                              textcalculator
                                      .totalTextWidgetList[
                                          currentParagraphIndex]
                                      .length -
                                  1) {
                            setState(() {
                              currentPageIndex += 1;
                            });
                          } else {
                            setState(() {
                              currentPageIndex = 0;
                              currentParagraphIndex += 1;
                            });
                          }
                        },
                        child: const Text(
                          'Next',
                          style: TextStyle(color: Colors.deepOrange),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          setState(() {
                            currentPageIndex = 0;
                            currentParagraphIndex = 0;
                          });
                        },
                        child: const Text(
                          'Reset',
                          style: TextStyle(color: Colors.deepOrange),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () async {
                          try {
                            final renderBox = globalKey.currentContext
                                ?.findRenderObject() as RenderBox?;
                            final position =
                                renderBox?.localToGlobal(Offset.zero);
                            Print.magenta(position.toString());
                            await textcalculator.setOrigin(
                                offset: Offset(
                                    position!.dx + leftMargin + leftPadding,
                                    // position.dy -
                                    //     kToolbarHeight +
                                    //     topMargin +
                                    //     topPadding +
                                    //     fontSize)
                                    position.dy +
                                        topMargin +
                                        topPadding +
                                        fontSize));
                            // Print.white(textcalculator.origin.toString());
                            await textcalculator.generateTotalTextList();
                            // Print.magenta(textcalculator
                            //     .totalWordAoiList[currentParagraphIndex]
                            //         [currentPageIndex]
                            //     .toString());
                          } catch (e, s) {
                            Print.red(e.toString());
                            Print.red(s.toString());
                          }
                        },
                        child: const Text(
                          'calculateFirstOffset',
                          style: TextStyle(color: Colors.deepOrange),
                        ),
                      )
                    ],
                  ),
                ],
              ),
              // const VerticalLineAtX(
              //     // x: leftMargin + leftPadding,
              //     x: 24),
              // const HorizontalLineAtY(
              //     // y: 156.8 - kToolbarHeight + topMargin + topPadding + fontSize
              //     y: 196.4 - kToolbarHeight),
            ],
          ),
        ),
        // HorizontalLineAtY(
        //     // y: 156.8 - kToolbarHeight + topMargin + topPadding + fontSize
        //     y: 193.5 + topMargin + topPadding + fontSize),
        if (textcalculator.totalWordAoiList.isNotEmpty)
          CustomPaint(
              painter: DotPainter(textcalculator
                  .totalWordAoiList[currentParagraphIndex][currentPageIndex]
                  .map((wordAoi) => Offset(wordAoi.x!, wordAoi.y!))
                  .toList()))
      ],
    );
  }
}

class VerticalLineAtX extends StatelessWidget {
  final double x;

  const VerticalLineAtX({super.key, required this.x});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Stack(
      children: [
        Positioned(
          left: x,
          child: Container(
            width: 1,
            height: screenHeight,
            color: Colors.red,
          ),
        ),
      ],
    );
  }
}

class HorizontalLineAtY extends StatelessWidget {
  final double y;

  const HorizontalLineAtY({super.key, required this.y});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Stack(
      children: [
        Positioned(
          top: y,
          child: Container(
            width: screenWidth,
            height: 1,
            color: Colors.blue,
          ),
        ),
      ],
    );
  }
}

class DotPainter extends CustomPainter {
  final List<Offset> points;

  DotPainter(this.points);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.blue
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 5.0;

    for (var point in points) {
      canvas.drawCircle(point, 5.0, paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
