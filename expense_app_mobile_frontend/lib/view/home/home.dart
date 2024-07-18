import 'dart:convert';

import 'package:expense_app/core/di/app_dependency_injection.dart';
import 'package:expense_app/model/my_expense_model.dart';
import 'package:expense_app/view/profile/profile_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';
import '../add_expense_flow/add_expense_flow_screen.dart';
import '../add_expense_flow/bloc/expense_bloc.dart';
import '../add_expense_flow/widgets/total_expense_income.dart';
import '../../core/utils/colors.dart';
import 'widgets/homescreen_appbar.dart';

class Home extends StatefulWidget {
  final User? user;
  const Home({super.key, this.user});
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  late AnimationController controller;
  int selectedStaticsType = 1; // 00 = day , 1 = month , 2 = year
  ExpenseBloc expenseBloc = AppDependencyInjection.getIt.get();

  @override
  void initState() {
    super.initState();
    controller = AnimationController(vsync: this);
    expenseBloc.add(const GetAllExpenseEvent());
  }

  @override
  Widget build(BuildContext context) {
    print("widget.user    ------    ${widget.user}");
    return Scaffold(
        appBar: AppBar(
          backgroundColor: primaryColor,
          title: const HomeScreenAppBar(),
        ),
        floatingActionButton: InkWell(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const AddExpenseFlowScreen(),
                ));
          },
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
            decoration: BoxDecoration(
              color: primaryColor,
              borderRadius: BorderRadius.circular(50),
            ),
            child: const Wrap(
              alignment: WrapAlignment.center,
              children: [
                SizedBox(width: 10),
                Icon(
                  Icons.add,
                  color: white,
                ),
                SizedBox(width: 10),
                Text(
                  "Add",
                  style: TextStyle(color: white, fontSize: 18),
                ),
                SizedBox(width: 10),
              ],
            ),
          ),
        ),
        body: BlocConsumer(
          bloc: expenseBloc,
          builder: (context, state) {
            if (state is GetAllExpenseLoadingState) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }

            if (state is GetAllExpenseSuccessState) {
              double totalExpense = 0.0;
              double totalIncome = 0.0;

              if ((state.list).isNotEmpty) {
                for (int i = 0; i <= state.list.length - 1; i++) {
                  final expense = state.list[i];
                  final amount = expense.amount ?? 0.0;
                  if (expense.type == 0) {
                    totalExpense = (amount + totalExpense);
                  } else if (expense.type == 1) {
                    totalIncome = (amount + totalIncome);
                  }
                }
              }

              return Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 15),
                  TotalExpenseIncome(
                    totalIncome: totalIncome,
                    totalExpense: totalExpense,
                  ),
                  const SizedBox(height: 15),
                  // TODO create logical feature then comment out this
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        statisticsTypeWidget(
                            onTap: () {
                              setState(() {
                                selectedStaticsType = 0;
                              });
                            },
                            selected: selectedStaticsType == 0 ? true : false,
                            label: 'Day'),
                        statisticsTypeWidget(
                            onTap: () {
                              setState(() {
                                selectedStaticsType = 1;
                              });
                            },
                            selected: selectedStaticsType == 1 ? true : false,
                            label: 'Month'),
                        statisticsTypeWidget(
                            onTap: () {
                              setState(() {
                                selectedStaticsType = 2;
                              });
                            },
                            selected: selectedStaticsType == 2 ? true : false,
                            label: 'Year'),
                      ],
                    ),
                  ),

                  AnimationConfiguration.synchronized(
                    child: ScaleAnimation(
                      scale: 1,
                      curve: Curves.easeIn,
                      child: FadeInAnimation(
                        curve: Curves.easeIn,
                        child: SizedBox(
                          height: 250,
                          child: Center(
                            child: SfRadialGauge(
                              axes: <RadialAxis>[
                                RadialAxis(
                                  showAxisLine: true,
                                  ticksPosition: ElementsPosition.outside,
                                  labelsPosition: ElementsPosition.outside,
                                  startAngle: 0,
                                  endAngle: 330,
                                  useRangeColorForAxis: true,
                                  showFirstLabel: true,
                                  showLastLabel: true,
                                  isInversed: false,
                                  maximum: totalIncome + totalExpense,
                                  axisLabelStyle: const GaugeTextStyle(
                                      fontWeight: FontWeight.w500),
                                  maximumLabels: 1,
                                  majorTickStyle: const MajorTickStyle(
                                      length: 0.15,
                                      lengthUnit: GaugeSizeUnit.factor,
                                      thickness: 1),
                                  minorTicksPerInterval: 4,
                                  minorTickStyle: const MinorTickStyle(
                                      length: 0.04,
                                      lengthUnit: GaugeSizeUnit.factor,
                                      thickness: 1),
                                  canScaleToFit: true,
                                  ranges: <GaugeRange>[
                                    GaugeRange(
                                      startValue: 0,
                                      endValue: totalExpense,
                                      color: Colors.red,
                                      sizeUnit: GaugeSizeUnit.factor,
                                      rangeOffset: 0.04,
                                      startWidth: 0.2,
                                      endWidth: 0.2,
                                    ),
                                    GaugeRange(
                                      startValue: totalExpense,
                                      endValue: totalIncome + totalExpense,
                                      rangeOffset: 0.08,
                                      sizeUnit: GaugeSizeUnit.factor,
                                      color: Colors.green,
                                      startWidth:
                                          0.2, // model.isWebFullView ? 0.2 : 0.05,
                                      endWidth:
                                          0.2, //model.isWebFullView ? 0.2 : 0.25,
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),

                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "My Expenses",
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                        Text(
                          "See all",
                          style: TextStyle(
                            fontSize: 14,
                            color: primaryColor,
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(height: 12),

                  ((state.list).isEmpty)
                      ? const SizedBox(
                          height: 400,
                          width: double.infinity,
                          child: Text("No Transactions Available"),
                        )
                      : AnimationLimiter(
                          child: Expanded(
                            child: ListView.builder(
                              itemCount: (state.list.length < 3)
                                  ? state.list.length
                                  : 3,
                              itemBuilder: (context, index) {
                                final expense = state.list[index];

                                return AnimationConfiguration.staggeredList(
                                  position: index,
                                  duration: const Duration(milliseconds: 375),
                                  child: SlideAnimation(
                                    verticalOffset: 50.0,
                                    child: FadeInAnimation(
                                      child: Container(
                                        margin: const EdgeInsets.symmetric(
                                            horizontal: 15, vertical: 8),
                                        decoration: BoxDecoration(
                                          color: containerColor,
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 12, vertical: 10),
                                        child: Row(
                                          children: [
                                            Container(
                                              padding: const EdgeInsets.all(10),
                                              child: const Icon(
                                                Icons.category_outlined,
                                                color: Colors.black,
                                                size: 30,
                                              ),
                                            ),
                                            const SizedBox(width: 10),
                                            Expanded(
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    expense.category ??
                                                        "Unknown",
                                                    style: const TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 14,
                                                    ),
                                                    maxLines: 1,
                                                  ),
                                                  expense.dateTime == null
                                                      ? const Text("")
                                                      : Text(
                                                          DateFormat("MMM yyyy")
                                                              .format(expense
                                                                      .dateTime ??
                                                                  DateTime
                                                                      .now()),
                                                          style: const TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .normal,
                                                              fontSize: 12,
                                                              color: Colors
                                                                  .black54),
                                                          maxLines: 1,
                                                        ),
                                                ],
                                              ),
                                            ),
                                            const SizedBox(width: 10),
                                            Text(
                                              "₹${expense.amount.toString()}",
                                              style: TextStyle(
                                                  color: expense.type == 0
                                                      ? Colors.red
                                                      : expense.type == 1
                                                          ? Colors.green
                                                          : Colors.black,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 14),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        )
                ],
              );
            }
            return const SizedBox();
          },
          listener: (context, state) {
            if (state is GetAllExpenseErrorState) {
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  content: Text("Error, Something went wrong.")));
            }
          },
        ));
  }

  Widget statisticsTypeWidget(
      {required Function()? onTap,
      required bool selected,
      required String label}) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
          color: selected ? neon : Colors.transparent,
        ),
        child: Text(
          label,
          style: TextStyle(
            color: selected ? primaryColor : black,
            fontWeight: selected ? FontWeight.bold : FontWeight.normal,
          ),
        ),
      ),
    );
  }

  Widget expenseAndIncomeWidget({
    required String label,
    required double amount,
    required int type,
    required int rotation,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          padding: const EdgeInsets.all(9),
          decoration: BoxDecoration(
            color: type == 0 ? Colors.red : Colors.green,
            shape: BoxShape.circle,
          ),
          child: RotatedBox(
              quarterTurns: rotation, child: const Icon(Icons.arrow_back)),
        ),
        const SizedBox(width: 18),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              label,
              style: const TextStyle(fontSize: 12),
            ),
            const SizedBox(height: 2),
            Text(
              "₹${amount.toString()}",
              style: const TextStyle(
                  fontWeight: FontWeight.bold, fontSize: 26, color: black),
            ),
          ],
        ),
      ],
    );
  }
}
