import 'package:automynd/component/commonComponent/round_button.dart';
import 'package:automynd/const/resource.dart';
import 'package:automynd/utils/color_utils.dart';
import 'package:automynd/utils/empty_box_utils.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    super.key,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          "Home",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              verticatSpace(20),
              Container(
                height: MediaQuery.of(context).size.width * 0.4,
                decoration: BoxDecoration(
                    gradient: const LinearGradient(
                        colors: [Color(0xff9DCEFF), Color(0xff92A3FD)]),
                    borderRadius: BorderRadius.circular(
                        MediaQuery.of(context).size.width * 0.075)),
                child: Stack(alignment: Alignment.center, children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 25, horizontal: 25),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "BMI (Body Mass Index)",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700),
                            ),
                            Text(
                              "You have a normal weight",
                              style: TextStyle(
                                  color: Colors.white.withOpacity(0.7),
                                  fontSize: 12),
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.width * 0.05,
                            ),
                            SizedBox(
                                width: 120,
                                height: 35,
                                child: RoundButton(
                                    title: "View More",
                                    type: RoundButtonType.bgSGradient,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                    onPressed: () {}))
                          ],
                        ),
                        AspectRatio(
                          aspectRatio: 1,
                          child: PieChart(
                            PieChartData(
                              pieTouchData: PieTouchData(
                                touchCallback:
                                    (FlTouchEvent event, pieTouchResponse) {},
                              ),
                              startDegreeOffset: 250,
                              borderData: FlBorderData(
                                show: false,
                              ),
                              sectionsSpace: 1,
                              centerSpaceRadius: 0,
                              sections: showingSections(),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ]),
              ),
              verticatSpace(20),
              Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                decoration: BoxDecoration(
                  color: const Color(0xff9DCEFF).withOpacity(0.3),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Today Target",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.w700),
                    ),
                    SizedBox(
                      width: 70,
                      height: 25,
                      child: RoundButton(
                        title: "Check",
                        type: RoundButtonType.bgGradient,
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        onPressed: () {},
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.width * 0.05,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Workout Progress",
                    style: TextStyle(
                        color: TColor.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w700),
                  ),
                  Container(
                      height: 30,
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(colors: TColor.primaryG),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton(
                          items: ["Weekly", "Monthly"]
                              .map((name) => DropdownMenuItem(
                                    value: name,
                                    child: Text(
                                      name,
                                      style: TextStyle(
                                          color: TColor.gray, fontSize: 14),
                                    ),
                                  ))
                              .toList(),
                          onChanged: (value) {},
                          icon: Icon(Icons.expand_more, color: TColor.white),
                          hint: Text(
                            "Weekly",
                            textAlign: TextAlign.center,
                            style: TextStyle(color: TColor.white, fontSize: 12),
                          ),
                        ),
                      )),
                ],
              ),
              SizedBox(
                height: media.width * 0.05,
              ),
              Container(
                  padding: const EdgeInsets.only(left: 15),
                  height: media.width * 0.5,
                  width: double.maxFinite,
                  child: LineChart(
                    LineChartData(
                      showingTooltipIndicators:
                          showingTooltipOnSpots.map((index) {
                        return ShowingTooltipIndicators([
                          LineBarSpot(
                            tooltipsOnBar,
                            lineBarsData.indexOf(tooltipsOnBar),
                            tooltipsOnBar.spots[index],
                          ),
                        ]);
                      }).toList(),
                      lineTouchData: LineTouchData(
                        enabled: true,
                        handleBuiltInTouches: false,
                        touchCallback:
                            (FlTouchEvent event, LineTouchResponse? response) {
                          if (response == null ||
                              response.lineBarSpots == null) {
                            return;
                          }
                          if (event is FlTapUpEvent) {
                            final spotIndex =
                                response.lineBarSpots!.first.spotIndex;
                            showingTooltipOnSpots.clear();
                            setState(() {
                              showingTooltipOnSpots.add(spotIndex);
                            });
                          }
                        },
                        mouseCursorResolver:
                            (FlTouchEvent event, LineTouchResponse? response) {
                          if (response == null ||
                              response.lineBarSpots == null) {
                            return SystemMouseCursors.basic;
                          }
                          return SystemMouseCursors.click;
                        },
                        getTouchedSpotIndicator:
                            (LineChartBarData barData, List<int> spotIndexes) {
                          return spotIndexes.map((index) {
                            return TouchedSpotIndicatorData(
                              FlLine(
                                color: Colors.transparent,
                              ),
                              FlDotData(
                                show: true,
                                getDotPainter:
                                    (spot, percent, barData, index) =>
                                        FlDotCirclePainter(
                                  radius: 3,
                                  color: Colors.white,
                                  strokeWidth: 3,
                                  strokeColor: TColor.secondaryColor1,
                                ),
                              ),
                            );
                          }).toList();
                        },
                        touchTooltipData: LineTouchTooltipData(
                          tooltipBgColor: TColor.secondaryColor1,
                          tooltipRoundedRadius: 20,
                          getTooltipItems: (List<LineBarSpot> lineBarsSpot) {
                            return lineBarsSpot.map((lineBarSpot) {
                              return LineTooltipItem(
                                "${lineBarSpot.x.toInt()} mins ago",
                                const TextStyle(
                                  color: Colors.white,
                                  fontSize: 10,
                                  fontWeight: FontWeight.bold,
                                ),
                              );
                            }).toList();
                          },
                        ),
                      ),
                      lineBarsData: lineBarsData1,
                      minY: -0.5,
                      maxY: 110,
                      titlesData: FlTitlesData(
                          show: true,
                          leftTitles: AxisTitles(),
                          topTitles: AxisTitles(),
                          bottomTitles: AxisTitles(
                            sideTitles: bottomTitles,
                          ),
                          rightTitles: AxisTitles(
                            sideTitles: rightTitles,
                          )),
                      gridData: FlGridData(
                        show: true,
                        drawHorizontalLine: true,
                        horizontalInterval: 25,
                        drawVerticalLine: false,
                        getDrawingHorizontalLine: (value) {
                          return FlLine(
                            color: Colors.grey.withOpacity(0.15),
                            strokeWidth: 2,
                          );
                        },
                      ),
                      borderData: FlBorderData(
                        show: true,
                        border: Border.all(
                          color: Colors.transparent,
                        ),
                      ),
                    ),
                  )),
              SizedBox(
                height: media.width * 0.05,
              ),
              Container(),

              Column(
                children: List.generate(20, (index) {
                  return ListTile(
                    leading:
                        Image.asset(R.ASSETS_IMAGE_ON_BOARDING_IMAGE_2_PNG),
                    title: const Text("Lorem Ipsum"),
                    subtitle: const Text("Lorem Ipsum Lorem Ipsum"),
                    trailing: IconButton(
                      onPressed: () {},
                      icon: const Text("Book"),
                    ),
                  );
                }),
              )
              // Expanded(
              //   child: ListView.builder(
              //       itemCount: 200,
              //       itemBuilder: (context, index) {
              //         return const ListTile(
              //           title: Text("data"),
              //         );
              //       }),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}

List<PieChartSectionData> showingSections() {
  return List.generate(
    2,
    (i) {
      var color0 = const Color(0xffC58BF2);

      switch (i) {
        case 0:
          return PieChartSectionData(
              color: color0,
              value: 33,
              title: '',
              radius: 55,
              titlePositionPercentageOffset: 0.55,
              badgeWidget: const Text(
                "20,1",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.w700),
              ));
        case 1:
          return PieChartSectionData(
            color: Colors.white,
            value: 75,
            title: '',
            radius: 45,
            titlePositionPercentageOffset: 0.55,
          );

        default:
          throw Error();
      }
    },
  );
}

List<int> showingTooltipOnSpots = [21];
final tooltipsOnBar = lineBarsData[0];
final lineBarsData = [
  LineChartBarData(
    showingIndicators: showingTooltipOnSpots,
    spots: allSpots,
    isCurved: false,
    barWidth: 3,
    belowBarData: BarAreaData(
      show: true,
      gradient: LinearGradient(colors: [
        TColor.primaryColor2.withOpacity(0.4),
        TColor.primaryColor1.withOpacity(0.1),
      ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
    ),
    dotData: FlDotData(show: false),
    gradient: LinearGradient(
      colors: TColor.primaryG,
    ),
  ),
];

List<FlSpot> get allSpots => const [
      FlSpot(0, 20),
      FlSpot(1, 25),
      FlSpot(2, 40),
      FlSpot(3, 50),
      FlSpot(4, 35),
      FlSpot(5, 40),
      FlSpot(6, 30),
      FlSpot(7, 20),
      FlSpot(8, 25),
      FlSpot(9, 40),
      FlSpot(10, 50),
      FlSpot(11, 35),
      FlSpot(12, 50),
      FlSpot(13, 60),
      FlSpot(14, 40),
      FlSpot(15, 50),
      FlSpot(16, 20),
      FlSpot(17, 25),
      FlSpot(18, 40),
      FlSpot(19, 50),
      FlSpot(20, 35),
      FlSpot(21, 80),
      FlSpot(22, 30),
      FlSpot(23, 20),
      FlSpot(24, 25),
      FlSpot(25, 40),
      FlSpot(26, 50),
      FlSpot(27, 35),
      FlSpot(28, 50),
      FlSpot(29, 60),
      FlSpot(30, 40)
    ];
List<LineChartBarData> get lineBarsData1 => [
      lineChartBarData1_1,
      lineChartBarData1_2,
    ];
LineChartBarData get lineChartBarData1_1 => LineChartBarData(
      isCurved: true,
      gradient: LinearGradient(colors: [
        TColor.primaryColor2.withOpacity(0.5),
        TColor.primaryColor1.withOpacity(0.5),
      ]),
      barWidth: 4,
      isStrokeCapRound: true,
      dotData: FlDotData(show: false),
      belowBarData: BarAreaData(show: false),
      spots: const [
        FlSpot(1, 35),
        FlSpot(2, 70),
        FlSpot(3, 40),
        FlSpot(4, 80),
        FlSpot(5, 25),
        FlSpot(6, 70),
        FlSpot(7, 35),
      ],
    );

LineChartBarData get lineChartBarData1_2 => LineChartBarData(
      isCurved: true,
      gradient: LinearGradient(colors: [
        TColor.secondaryColor2.withOpacity(0.5),
        TColor.secondaryColor1.withOpacity(0.5),
      ]),
      barWidth: 2,
      isStrokeCapRound: true,
      dotData: FlDotData(show: false),
      belowBarData: BarAreaData(
        show: false,
      ),
      spots: const [
        FlSpot(1, 80),
        FlSpot(2, 50),
        FlSpot(3, 90),
        FlSpot(4, 40),
        FlSpot(5, 80),
        FlSpot(6, 35),
        FlSpot(7, 60),
      ],
    );
SideTitles get bottomTitles => SideTitles(
      showTitles: true,
      reservedSize: 32,
      interval: 1,
      getTitlesWidget: bottomTitleWidgets,
    );

Widget bottomTitleWidgets(double value, TitleMeta meta) {
  var style = TextStyle(
    color: TColor.gray,
    fontSize: 12,
  );
  Widget text;
  switch (value.toInt()) {
    case 1:
      text = Text('Sun', style: style);
      break;
    case 2:
      text = Text('Mon', style: style);
      break;
    case 3:
      text = Text('Tue', style: style);
      break;
    case 4:
      text = Text('Wed', style: style);
      break;
    case 5:
      text = Text('Thu', style: style);
      break;
    case 6:
      text = Text('Fri', style: style);
      break;
    case 7:
      text = Text('Sat', style: style);
      break;
    default:
      text = const Text('');
      break;
  }

  return SideTitleWidget(
    axisSide: meta.axisSide,
    space: 10,
    child: text,
  );
}

SideTitles get rightTitles => SideTitles(
      getTitlesWidget: rightTitleWidgets,
      showTitles: true,
      interval: 20,
      reservedSize: 40,
    );

Widget rightTitleWidgets(double value, TitleMeta meta) {
  String text;
  switch (value.toInt()) {
    case 0:
      text = '0%';
      break;
    case 20:
      text = '20%';
      break;
    case 40:
      text = '40%';
      break;
    case 60:
      text = '60%';
      break;
    case 80:
      text = '80%';
      break;
    case 100:
      text = '100%';
      break;
    default:
      return Container();
  }

  return Text(text,
      style: TextStyle(
        color: TColor.gray,
        fontSize: 12,
      ),
      textAlign: TextAlign.center);
}
