library text_calculator;

export 'text_calculator.dart';
import 'package:flutter/material.dart';
import 'package:palestine_console/palestine_console.dart';
import 'package:text_calculator/model/word_aoi_model.dart';

class TextCalculator {
  String originText;
  String paragraphSeperator;
  String indentSpacer;
  double height;
  double width;
  double fontSize;
  double lineHeight;
  bool isDebugMessageOn;
  List<List<List<String>>> totalTextList;
  List<List<List<GlobalKey>>> totalGlobalKeyList;
  List<List<List<Widget>>> totalTextWidgetList;
  List<List<List<WordAoi>>> totalWordAoiList;
  Color fontColor;
  Color indetSpacerColor;
  Offset origin;
  TextCalculator(
      {this.originText = '',
      this.paragraphSeperator = '###',
      this.indentSpacer = '``',
      this.height = 100,
      this.width = 100,
      this.fontSize = 18,
      this.lineHeight = 2,
      this.fontColor = Colors.black,
      this.indetSpacerColor = Colors.red,
      this.isDebugMessageOn = true,
      this.totalTextList = const [],
      this.totalGlobalKeyList = const [],
      this.totalTextWidgetList = const [],
      this.totalWordAoiList = const [],
      this.origin = const Offset(0, 0)});

  Future<void> setOrigin({required Offset offset}) async {
    origin = offset;
  }

  Future<void> calculateFirstOffset() async {
    if (totalGlobalKeyList.isEmpty) {
      Print.red("generateKeyList() 를먼저 실행해주세요");
      throw Error();
    }
    final key = totalGlobalKeyList[0][0][0];
    final renderBox = key.currentContext?.findRenderObject() as RenderBox?;
    final position = renderBox?.localToGlobal(Offset.zero);
    Print.magenta(position.toString());
    try {
      setOrigin(offset: position!);
    } catch (e, s) {
      Print.red(e.toString());
      Print.red(s.toString());
    }
  }

  Future<void> setisDebugMessageOn({required bool newBool}) async {
    isDebugMessageOn = newBool;
  }

  Future<void> generateTotalTextWidgetList() async {
    if (totalTextList.isEmpty) {
      Print.red("calculatePagedText() 를먼저 실행해주세요");
      throw Error();
    }
    if (totalGlobalKeyList.isEmpty) {
      Print.red("generateKeyList() 를먼저 실행해주세요");
      throw Error();
    }

    List<List<List<Widget>>> tempTotalTextWidgetList = [];

    for (int i = 0; i < totalTextList.length; i++) {
      List<List<Widget>> textChunkWidgets = [];
      for (int j = 0; j < totalTextList[i].length; j++) {
        List<Widget> wrapWidgets = []; // 페이지 당 Wrap Widget들의 리스트를 저장
        List<Widget> currentWrapChildren = []; // 현재 Wrap 위젯의 자식들을 저장

        for (int k = 0; k < totalTextList[i][j].length; k++) {
          String word = totalTextList[i][j][k];
          Widget newWidget;

          if (word.contains('``')) {
            newWidget = RichText(
              textScaleFactor: 1,
              key: totalGlobalKeyList[i][j][k],
              text: TextSpan(
                text: word,
                style: TextStyle(
                  // fontFamily: 'Pretendard',
                  height: 2,
                  fontSize: fontSize,
                  color: indetSpacerColor,
                  // fontWeight: FontWeight.w300,
                ),
              ),
            );
          } else {
            newWidget = RichText(
              textScaleFactor: 1,
              key: totalGlobalKeyList[i][j][k],
              text: TextSpan(
                text: word,
                style: TextStyle(
                    // fontFamily: 'Pretendard',
                    height: 2,
                    fontSize: fontSize,
                    color: fontColor
                    // fontWeight: FontWeight.w300,
                    ),
              ),
            );
          }

          if (word.contains('``') && currentWrapChildren.isNotEmpty) {
            wrapWidgets.add(Align(
                alignment: Alignment.topLeft,
                child: Wrap(children: List.from(currentWrapChildren))));

            currentWrapChildren.clear();
          }

          currentWrapChildren.add(newWidget);
        }

        // 마지막 Wrap이 추가되지 않은 경우 추가
        if (currentWrapChildren.isNotEmpty) {
          wrapWidgets.add(Align(
              alignment: Alignment.topLeft,
              child: Wrap(children: List.from(currentWrapChildren))));
        }

        textChunkWidgets.add(wrapWidgets);
      }
      tempTotalTextWidgetList.add(textChunkWidgets);
    }

    totalTextWidgetList = tempTotalTextWidgetList;
  }

  Future<void> generateTotalGlobalKeyList() async {
    if (totalTextList.isEmpty) {
      Print.red("calculateTotalTextList() 를먼저 실행해주세요");

      throw Error();
    }

    List<List<List<GlobalKey>>> tempTotalGlobalKeyList = [];

    for (List<List<String>> textChunk in totalTextList) {
      List<List<GlobalKey>> chunkKeys = [];
      for (List<String> page in textChunk) {
        List<GlobalKey> pageKeys = List.generate(
          page.length,
          (index) => GlobalKey(),
        );
        chunkKeys.add(pageKeys);
      }

      tempTotalGlobalKeyList.add(chunkKeys);
    }
    totalGlobalKeyList = tempTotalGlobalKeyList;
  }

  Future<void> setFontSize({required double fontSize}) async {
    this.fontSize = fontSize;
  }

  Future<void> setTotalTextList(
      {required List<List<List<String>>> totalTextList}) async {
    this.totalTextList = totalTextList;
  }

  Future<void> setWidth({required double width}) async {
    this.width = width;
  }

  Future<void> setHeight({required double height}) async {
    this.height = height;
  }

  Future<void> setOriginText({required String originText}) async {
    this.originText = originText;
  }

  Future<void> setParagraphSeperator(
      {required String paragraphSeperator}) async {
    this.paragraphSeperator = paragraphSeperator;
  }

  Future<void> setindentSpacer({required String indentSpacer}) async {
    this.indentSpacer = indentSpacer;
  }

  Future<void> generateTotalTextList() async {
    final seperatedTextbyChunk =
        originText.split(paragraphSeperator).map((item) => item).toList();
    List<List<List<String>>> tempTotalTextList = <List<List<String>>>[];
    List<List<List<WordAoi>>> tempTotalWordAoiList = <List<List<WordAoi>>>[];
    List<List<String>> pagedTextList = <List<String>>[];
    List<List<WordAoi>> pagedWordAoiList = <List<WordAoi>>[];

    for (int i = 0; i < seperatedTextbyChunk.length; i++) {
      String targetText = seperatedTextbyChunk[i];

      List<String> splitedText =
          targetText.split(" ").map((item) => '$item ').toList();

      splitedText[splitedText.length - 1] =
          splitedText.last.replaceAll('\n', '');
      for (int i = 0; i < splitedText.length; i++) {
        if (splitedText[i].contains('\n')) {
          splitedText[i] = splitedText[i].replaceAll('\n', indentSpacer);
        }
      }

      splitedText = splitedText
          .map((item) => item.split(
              RegExp(r'(?<=' + indentSpacer + ')|(?=' + indentSpacer + ')')))
          .expand((i) => i)
          .toList();
      splitedText.insert(0, '``');
      // Print.yellow(splitedText.toString());

      List<String> tempPagedText = <String>[];
      List<WordAoi> tempPagedWordAoi = <WordAoi>[];

      int lastLine = ((height) / (fontSize * lineHeight)).floor();
      int currentLine = 0;

      Size calcWordWidthandHeight(String word) {
        final textPainter = TextPainter(
          text: TextSpan(
              text: word,
              style: TextStyle(
                  // fontFamily: 'Pretendard',
                  fontSize: fontSize,
                  color: fontColor
                  // fontWeight: FontWeight.w300,
                  )),
          textDirection: TextDirection.ltr,
        );
        textPainter.layout();
        final double width = textPainter.width;
        final double height = textPainter.height;
        // + spaceWidth;
        return Size(width, height);
      }

      double wordSum = 0;

      for (int i = 0; i < splitedText.length; i++) {
        double wordWidth = calcWordWidthandHeight(splitedText[i]).width;
        double wordHeight = calcWordWidthandHeight(splitedText[i]).height;

        if (splitedText[i] == '``' && i != 0) {
          if (splitedText[i + 1].trim().isEmpty) {
            if (isDebugMessageOn) {
              Print.red('ParagraphEnd (문단끝)');
            }
          } else {
            if (isDebugMessageOn) {
              Print.red(
                  '${splitedText[i - 1]} -> Enter ->  ${splitedText[i + 1]}');
            }
          }
          wordSum = 0;
          currentLine += 1;
          wordSum = wordWidth;
          if (isDebugMessageOn) {
            Print.yellow("A ${splitedText[i]} $wordSum $wordWidth");
          }
          if (currentLine == lastLine) {
            pagedTextList.add(List<String>.from(tempPagedText));
            pagedWordAoiList.add(List<WordAoi>.from(tempPagedWordAoi));
            tempPagedText.clear();
            tempPagedWordAoi.clear();
            currentLine = 0;
            if (isDebugMessageOn) {
              Print.yellow("B ${splitedText[i]} $wordSum $wordWidth");
            }
          }

          tempPagedText.add(splitedText[i]);
          tempPagedWordAoi.add(WordAoi(
              x: origin.dx + wordSum - wordWidth,
              y: origin.dy + currentLine * fontSize * lineHeight,
              width: wordWidth,
              height: wordHeight,
              word: splitedText[i]));
          continue;
        }

        if ((wordSum + wordWidth > (width)) && i != 0) {
          if (isDebugMessageOn) {
            Print.white("First word per line (줄별첫단어): ${splitedText[i]}");
          }
          wordSum = wordWidth;
          if (isDebugMessageOn) {
            Print.yellow("C ${splitedText[i]} $wordSum $wordWidth");
          }
          currentLine += 1;

          if (currentLine == lastLine) {
            pagedTextList.add(List<String>.from(tempPagedText));
            pagedWordAoiList.add(List<WordAoi>.from(tempPagedWordAoi));
            tempPagedText.clear();
            tempPagedWordAoi.clear();
            currentLine = 0;
            // Print.yellow("D ${splitedText[i]} $wordSum $wordWidth");
          }
        } else {
          wordSum += wordWidth;
          if (isDebugMessageOn) {
            Print.yellow("D ${splitedText[i]} $wordSum $wordWidth");
          }
        }

        tempPagedText.add(splitedText[i]);
        tempPagedWordAoi.add(WordAoi(
            x: origin.dx + wordSum - wordWidth,
            y: origin.dy + currentLine * fontSize * lineHeight,
            width: wordWidth,
            height: wordHeight,
            word: splitedText[i]));
      }

      try {
        pagedTextList.add(List<String>.from(tempPagedText));
        tempTotalTextList.add(List<List<String>>.from(pagedTextList));
        pagedWordAoiList.add(List<WordAoi>.from(tempPagedWordAoi));
        tempTotalWordAoiList.add(List<List<WordAoi>>.from(pagedWordAoiList));
        pagedTextList.clear();
        pagedWordAoiList.clear();
      } catch (e, s) {
        Print.red(e.toString());
        Print.red(s.toString());
      }

      // setTotalTextList(totalTextList: tempTotalTextList);
      totalTextList = tempTotalTextList;
      totalWordAoiList = tempTotalWordAoiList;
    }

    Print.red("FIN");
    // Print.cyan(totalWordAoiList[0][0].toString());
    // state = state.copyWith(totalTextList: totalTextList);
  }
}
