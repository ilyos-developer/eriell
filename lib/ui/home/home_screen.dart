import 'package:eriell/bloc/home/home_bloc.dart';
import 'package:eriell/sirvice/api_client.dart';
import 'package:eriell/ui/constants.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'components/indecator.dart';
import 'components/table.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int touchedIndex = -1;
  int flexValue = 1;

  @override
  Widget build(BuildContext context) {
    Orientation orientation = MediaQuery.of(context).orientation;
    return Scaffold(
      body: SafeArea(
        child: orientation == Orientation.portrait
            ? Column(
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        Text(
                          "График за год",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        Expanded(
                          child: Row(
                            children: [
                              Expanded(
                                child: PieChart(
                                  PieChartData(
                                    pieTouchData: PieTouchData(
                                        touchCallback: (pieTouchResponse) {
                                      setState(() {
                                        final desiredTouch =
                                            pieTouchResponse.touchInput
                                                    is! PointerExitEvent &&
                                                pieTouchResponse.touchInput
                                                    is! PointerUpEvent;
                                        if (desiredTouch &&
                                            pieTouchResponse.touchedSection !=
                                                null) {
                                          touchedIndex = pieTouchResponse
                                              .touchedSection!
                                              .touchedSectionIndex;
                                        } else {
                                          touchedIndex = -1;
                                        }
                                      });
                                    }),
                                    sectionsSpace: 0,
                                    centerSpaceRadius: 30,
                                    sections: showingSections(),
                                  ),
                                ),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Indicator(
                                    color: Color(0xff0293ee),
                                    text: '2021',
                                    isSquare: true,
                                  ),
                                  SizedBox(
                                    height: 4,
                                  ),
                                  Indicator(
                                    color: Color(0xfff8b250),
                                    text: '2020',
                                    isSquare: true,
                                  ),
                                  SizedBox(
                                    height: 4,
                                  ),
                                  Indicator(
                                    color: Color(0xff845bef),
                                    text: '2015',
                                    isSquare: true,
                                  ),
                                  SizedBox(
                                    height: 4,
                                  ),
                                  Indicator(
                                    color: Color(0xff13d38e),
                                    text: '2010',
                                    isSquare: true,
                                  ),
                                  SizedBox(
                                    height: 18,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Divider(thickness: 2),
                  Expanded(
                    flex: flexValue,
                    child: GestureDetector(
                      onDoubleTap: () {
                        setState(
                          () => flexValue == 1 ? flexValue = 3 : flexValue = 1,
                        );
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: BlocBuilder<HomeBloc, HomeState>(
                          builder: (context, state) {
                            if (state is HomeInitial) {
                              return Center(
                                child: CircularProgressIndicator(),
                              );
                            }
                            if (state is LoadedUsers) {
                              return MyDataTable(state.userList);
                            }
                            return Text("Что-то пошло не так");
                          },
                        ),
                      ),
                    ),
                  ),
                ],
              )
            : BlocBuilder<HomeBloc, HomeState>(
                builder: (context, state) {
                  if (state is HomeInitial) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  if (state is LoadedUsers) {
                    return MyDataTable(state.userList);
                  }
                  return Text("Что-то пошло не так");
                },
              ),
      ),
    );
  }

  List<PieChartSectionData> showingSections() {
    return List.generate(4, (i) {
      final isTouched = i == touchedIndex;
      final fontSize = isTouched ? 25.0 : 16.0;
      final radius = isTouched ? 60.0 : 50.0;
      switch (i) {
        case 0:
          return PieChartSectionData(
            color: const Color(0xff0293ee),
            value: 70,
            title: '70%',
            radius: radius,
            titleStyle: TextStyle(
                fontSize: fontSize,
                fontWeight: FontWeight.bold,
                color: const Color(0xffffffff)),
          );
        case 1:
          return PieChartSectionData(
            color: const Color(0xfff8b250),
            value: 20,
            title: '15%',
            radius: radius,
            titleStyle: TextStyle(
                fontSize: fontSize,
                fontWeight: FontWeight.bold,
                color: const Color(0xffffffff)),
          );
        case 2:
          return PieChartSectionData(
            color: const Color(0xff845bef),
            value: 10,
            title: '10%',
            radius: radius,
            titleStyle: TextStyle(
                fontSize: fontSize,
                fontWeight: FontWeight.bold,
                color: const Color(0xffffffff)),
          );
        case 3:
          return PieChartSectionData(
            color: const Color(0xff13d38e),
            value: 5,
            title: '5%',
            radius: radius,
            titleStyle: TextStyle(
                fontSize: fontSize,
                fontWeight: FontWeight.bold,
                color: const Color(0xffffffff)),
          );
        default:
          throw Error();
      }
    });
  }
}
