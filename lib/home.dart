import 'package:flutter/material.dart';
import 'package:pocswalekhan/imgprovider.dart';
import 'package:provider/provider.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:wave/config.dart';
import 'package:wave/wave.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with RestorationMixin, TickerProviderStateMixin, WidgetsBindingObserver {
  final RestorableBool _dialogValue = RestorableBool(false);
  @override
  // TODO: implement restorationId
  String? get restorationId => 'dialog';

  @override
  void restoreState(RestorationBucket? oldBucket, bool initialRestore) {
    // TODO: implement restoreState
    registerForRestoration(_dialogValue, 'dialog_value');
  }

  final TextEditingController myController = TextEditingController();
  late AnimationController myAnimationController =
      AnimationController(vsync: this);
  bool isShowing = false;

  void dialog(BuildContext context) {
    if (!isShowing) {
      isShowing = true;
      player.stop();
      debugPrint(isShowing.toString());
      showDialog(
        context: context,
        builder: (BuildContext context) {
          Future.delayed(
            const Duration(
              seconds: 2,
            ),
            () {
              Navigator.of(context).pop();
              isShowing = false;
              debugPrint(isShowing.toString());
            },
          );
          return SimpleDialog(
            children: [
              Image.asset('assets/right.png'),
            ],
          );
        },
      );
    }
  }

  AudioPlayer player = AudioPlayer();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Swalekhan POC')),
      ),
      body: Consumer<ImgProvider>(
        builder: (context, value, child) {
          return Stack(
            fit: StackFit.expand,
            children: [
              //letter to be drowned
              SizedBox(
                width: size.width,
                height: size.height * 0.9,
              ),
              //Wave
              WaveWidget(
                config: CustomConfig(
                  colors: [
                    Colors.blue.withOpacity(1),
                  ],
                  durations: [4000],
                  heightPercentages: [0.7],
                  blur: const MaskFilter.blur(BlurStyle.solid, 5),
                ),
                waveAmplitude: 10,
                waveFrequency: 1,
                backgroundColor: Colors.white,
                size: const Size(
                  double.infinity,
                  double.infinity,
                ),
              ),

              //Text Box
              const Positioned(
                top: 100,
                right: 20,
                child: SizedBox(
                  height: 50,
                  width: 200,
                  child: TextField(
                    decoration: InputDecoration(
                      labelText: 'Game Answer',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
