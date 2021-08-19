import 'package:HIVApp/utils/constants.dart';
import 'package:flutter/material.dart';

class BottomSlider extends StatefulWidget {
  const BottomSlider({Key key, this.maxPage, this.currentPage}) : super(key: key);

  final int maxPage;
  final double currentPage;

  @override
  _BottomSliderState createState() => _BottomSliderState();
}

class _BottomSliderState extends State<BottomSlider> {
  bool showBottomSlider = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => setState(() {
        showBottomSlider = !showBottomSlider;
      }),
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          height: showBottomSlider ? 86 : 43,
          child: SliderTheme(
            data: SliderTheme.of(context).copyWith(
              activeTrackColor: kDesaturatedBlue,
              thumbColor: kDesaturatedBlue,
              inactiveTrackColor: kLightGrayishBlue,
              thumbShape: RoundSliderThumbShape(enabledThumbRadius: 7),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 43,
                  alignment: Alignment.center,
                  width: MediaQuery.of(context).size.width,
                  child: Text("${widget.currentPage.toInt()}/${widget.maxPage}"),
                  decoration: BoxDecoration(
                    color: kColorWhite,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey,
                        blurRadius: 7,
                        offset: Offset(0, 0),
                      ),
                    ],
                  ),
                ),
                showBottomSlider ? Container(
                  color: kColorWhite,
                  height: 43,
                  child: Slider(
                    value: widget.currentPage,
                    min: 0,
                    max: widget.maxPage.toDouble(),
                    onChanged: (value) {},
                  ),
                ) : Container(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
