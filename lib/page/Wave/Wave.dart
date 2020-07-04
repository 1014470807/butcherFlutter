import 'package:butcher/common/public/public.dart';
import 'package:wave/wave.dart';
import 'package:wave/config.dart';

class WaveBtoom extends StatelessWidget with StyleBase {

  @override
  Widget build(BuildContext context) {
    return Container(
      height: dw(150),
      width: double.infinity,
      child: WaveWidget(
        config: CustomConfig(
          gradients: [
            [Colors.red, Color(0xEEF44336)],
            [Colors.red[800], Color(0x77E57373)],
            [Colors.orange, Color(0x66FF9800)],
            [Colors.yellow, Color(0x55FFEB3B)]
          ],
          durations: [35000, 19440, 10800, 6000],
          heightPercentages: [0.20, 0.23, 0.25, 0.30],
          gradientBegin: Alignment.bottomLeft,
          gradientEnd: Alignment.topRight,
        ),
        backgroundColor: Colors.transparent,
        size: Size(double.infinity, double.infinity),
        waveAmplitude: 0,
      ),
    );
  }

}