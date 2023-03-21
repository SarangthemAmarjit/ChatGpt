import 'package:chat_gpt_sdk/chat_gpt_sdk.dart';
import 'package:chatgptapp/constants.dart';
import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:text_to_speech/text_to_speech.dart';
import 'package:speech_to_text/speech_to_text.dart' as speechToText;

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: TranslateScreen(),
    );
  }
}

class TranslateScreen extends StatefulWidget {
  const TranslateScreen({Key? key}) : super(key: key);
  @override
  State<TranslateScreen> createState() => _TranslateScreenState();
}

class _TranslateScreenState extends State<TranslateScreen> {
  /// text controller
  final _txtWord = TextEditingController();
  speechToText.SpeechToText? speech;
  String textString = "Press The Button";
  bool isListen = false;
  late OpenAI openAI;

  ///ID of the model to use. Currently, only and are supported
  ///[kChatGptTurboModel]
  ///[kChatGptTurbo0301Model]

  void _chatGpt3ExampleStream() async {
    setState(() {
      issended = true;
      text = '';
    });

    final request = ChatCompleteText(messages: [
      Map.of({"role": "user", "content": _txtWord.text})
    ], maxToken: 400, model: kChatGptTurboModel);

    openAI.onChatCompletionStream(request: request).listen((it) {
      print(" new response ${it?.choices.last.message.content}");
      setState(() {
        issended = false;
        text = '${_txtWord.text}:${it!.choices.last.message.content}';
      });
      tts.speak(text);
    }).onError((err) {
      print(err);
    });
  }

  TextToSpeech tts = TextToSpeech();
  @override
  void initState() {
    speech = speechToText.SpeechToText();
    openAI = OpenAI.instance.build(
      token: token,
      isLogger: true,
      baseOption: HttpSetup(receiveTimeout: const Duration(minutes: 1)),
    );

    super.initState();
  }

  @override
  void dispose() {
    ///close stream complete text
    openAI.close();
    _txtWord.dispose();
    super.dispose();
  }

  String text = '';
  void listen() async {
    if (!isListen) {
      bool avail = await speech!.initialize();
      if (avail) {
        setState(() {
          isListen = true;
        });
        speech!.listen(onResult: (value) {
          setState(() {
            _txtWord.text = value.recognizedWords;
          });
        });
      }
    } else {
      setState(() {
        isListen = false;
      });
      speech!.stop();
      _chatGpt3ExampleStream();
    }
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 248, 247, 242),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 16.0, horizontal: 25),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /**
                   * title translate
                   */

                  /**
                   * input card
                   * insert your text for translate to th.com
                   */

                  /**
                   * card input translate
                   */
                  Text(
                    'CHAT GPT 3.0',
                    style: GoogleFonts.staatliches(
                        fontSize: 29,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.5,
                        color: Colors.black38),
                  ),
                  _resultCard(size),
                  /**
                   * button translate
                   */

                  Padding(
                    padding:
                        const EdgeInsets.only(top: 50, left: 20, right: 20),
                    child: Card(
                      elevation: 10,
                      child: Container(
                        height: 40,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(color: Colors.grey)),
                        child: Row(
                          children: [
                            Flexible(
                              child: Padding(
                                padding: const EdgeInsets.only(
                                  left: 10,
                                  top: 3,
                                ),
                                child: TextFormField(
                                  controller: _txtWord,
                                  cursorHeight: 20,
                                  decoration: const InputDecoration.collapsed(
                                      hintText: ''),
                                ),
                              ),
                            ),
                            InkWell(
                              onTap: () => listen(),
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 8.0),
                                child: isListen
                                    ? const Icon(
                                        Icons.stop,
                                        color: Colors.red,
                                        size: 25.0,
                                      )
                                    : const Icon(
                                        Icons.mic,
                                        color: Colors.grey,
                                        size: 25.0,
                                      ),
                              ),
                            ),
                            InkWell(
                              onTap: () => _chatGpt3ExampleStream(),
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 8.0),
                                child: Transform.rotate(
                                  angle: -30 * math.pi / 180,
                                  child: const Icon(
                                    Icons.send,
                                    color: Colors.grey,
                                    size: 25.0,
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  bool issended = false;
  Widget _resultCard(Size size) {
    return Card(
      elevation: 10,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        alignment: Alignment.bottomCenter,
        width: size.width * .86,
        height: size.height * .7,
        decoration: heroCard,
        child: SingleChildScrollView(
          child: Column(
            children: [
              text.isEmpty
                  ? issended
                      ? Image.asset('assets/botfinal.gif')
                      : const Text('')
                  : AnimatedTextKit(
                      isRepeatingAnimation: false,
                      repeatForever: false,
                      animatedTexts: [
                        TypewriterAnimatedText(
                          text,
                          textStyle: GoogleFonts.kreon(
                              color: Colors.black,
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold),
                          speed: const Duration(milliseconds: 50),
                        ),
                      ],
                    ),
              SizedBox(
                width: size.width,
                child: const Divider(
                  color: Colors.grey,
                  thickness: 1,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    InkWell(
                      onTap: () {
                        setState(() {
                          text = '';
                        });
                      },
                      child: const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8.0),
                        child: Icon(
                          Icons.delete_forever,
                          color: Colors.grey,
                          size: 22.0,
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
