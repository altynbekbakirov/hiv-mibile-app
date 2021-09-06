import 'package:HIVApp/utils/constants.dart';
import 'package:flutter/material.dart';

class BottomSlider extends StatefulWidget {
  const BottomSlider(
      {Key key, this.maxPage, this.currentPage, this.currentPageCallback})
      : super(key: key);

  final int maxPage;
  final double currentPage;
  final Function(double) currentPageCallback;

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
          height: 75 /*showBottomSlider ? 86 : 43*/,
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
                Expanded(
                  child: Container(
                    height: 75,
                    alignment: Alignment.bottomCenter,
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      children: [
                        Expanded(
                          child: Center(
                            child: Text(
                              "${widget.currentPage.toInt()}/${widget.maxPage}",
                              style: TextStyle(
                                color: kDarkGrayishBlue,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            padding: EdgeInsets.only(bottom: 20),
                            color: kColorWhite,
                            child: Slider(
                              value: widget.currentPage,
                              min: 0,
                              max: widget.maxPage.toDouble(),
                              onChanged: (value) {
                                widget.currentPageCallback(value.roundToDouble());
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                    decoration: BoxDecoration(
                      color: kColorWhite,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey,
                          blurRadius: 7,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
