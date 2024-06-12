import 'dart:convert';

import 'package:expense_app/model/my_expense_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';
import 'add_expense_flow/add_expense_flow_screen.dart';
import 'utils/colors.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home>  with SingleTickerProviderStateMixin{
  late AnimationController controller;
  int selectedStaticsType = 1; // 00 = day , 1 = month , 2 = year



  Future<List<MyExpenseModel>> _loadExpenses() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final expenses = prefs.getStringList('my_expenses') ?? [];
    print("Raw expenses: $expenses");
    try {
      return expenses.map((e) {
        print("Decoding: $e");
        final expense = jsonDecode(e);
        return MyExpenseModel.fromJson(expense);
      }).toList();
    } catch (e) {
      print("Error decoding expenses: $e");
      return [];
    }
  }

@override
  void initState() {
    super.initState();
    controller =  AnimationController(vsync: this);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: const Text(
          "Expenso",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: white,
          ),
        ),
        actions: [

          InkWell(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(
                builder: (context) {
                  return const AddExpenseFlowScreen();
                },
              ));
            },
            child: const Padding(
              padding: EdgeInsets.all(8.0),
              child: Icon(
                Icons.add,
                size: 25,
                color: white,
              ),
            ),
          ),
          //  InkWell(
          //   onTap: () async {
          //    // TODO clear expense here
          //    SharedPreferences prefs = await SharedPreferences.getInstance();
          //    prefs.setStringList("my_expenses", []);
          //   },
          //   child: const Padding(
          //     padding: EdgeInsets.all(8.0),
          //     child: Icon(
          //       Icons.delete,
          //       size: 25,
          //       color: white,
          //     ),
          //   ),
          // ),
        ],
      ),
      body: 
      
      FutureBuilder<List<MyExpenseModel>>(
        future: _loadExpenses(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
         
            return Center(child: Text('Error: ${snapshot.error}'));
          }
          else if (!snapshot.hasData || snapshot.data?.length == 0) {
            return const Center(child: Text('No expenses found.'));
          } else {
                double totalExpense = 0.0;
                double totalIncome = 0.0;

               if((snapshot.data ?? []).isNotEmpty){

                 for(int i=0; i <= snapshot.data!.length - 1; i++){
                  final expense = snapshot.data?[i];
                  final amount = expense?.amount ?? 0.0;
                  if(expense?.type == 0){
                    totalExpense = (amount + totalExpense);
                  } else if (expense?.type == 1){
                    totalIncome = (amount + totalIncome);
                  }
                }
               }
            return Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 15),
                Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                         AnimationConfiguration.synchronized(
                          child: FadeInAnimation(
                            child: SlideAnimation(
                              duration: const Duration(milliseconds: 400),
                              curve: Curves.easeIn,
                            horizontalOffset: -30.0,
                              child: expenseAndIncomeWidget(
                                rotation: 3,
                                type: 1,
                                amount: totalIncome,
                                label: "Total Income"
                              ),
                            ),
                          ),
                        ),
                      AnimationConfiguration.synchronized(
                          child: FadeInAnimation(
                            child: SlideAnimation(
                            horizontalOffset: 30.0,
                            duration: const Duration(milliseconds: 400),
                            curve: Curves.easeIn,
                              child:  expenseAndIncomeWidget(
                                rotation: 1,
                                type: 0,
                                amount: totalExpense,
                                label: "Total Expense"
                              ),
                            ),
                          ),)               
                    ],
                  ),
                ),

                const SizedBox(height: 15),
                // TODO create logical feature then comment out this
                // Container(
                //   child:  Row(
                //     mainAxisAlignment: MainAxisAlignment.spaceAround,
                //     children: [
                //       staticticsTypeWidget( onTap: () {
                //         setState(() {
                //           selectedStaticsType = 0;
                //         });
                //       }, selected: selectedStaticsType == 0 ? true : false, label: 'Day'),
                //       staticticsTypeWidget(  onTap: () {
                //         setState(() {
                //           selectedStaticsType = 1;
                //         });
                //       }, selected: selectedStaticsType == 1 ? true : false, label: 'Month'),
                //       staticticsTypeWidget(  onTap: () {
                //         setState(() {
                //           selectedStaticsType = 2;
                //         });
                //       },  selected: selectedStaticsType == 2 ? true : false, label: 'Year'),

                //     ],
                //   ),
                // ),
            
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
                                    maximum: totalIncome+totalExpense,
                                    axisLabelStyle: const GaugeTextStyle(fontWeight: FontWeight.w500),
                                    maximumLabels: 1,
                                    majorTickStyle: const MajorTickStyle(
                                      length: 0.15, lengthUnit: GaugeSizeUnit.factor, thickness: 1,),
                                    minorTicksPerInterval: 4,
                                    minorTickStyle: const MinorTickStyle(
                                        length: 0.04, lengthUnit: GaugeSizeUnit.factor, thickness: 1),
                                    canScaleToFit: true,
                    
                                    ranges: <GaugeRange>[
                                      GaugeRange(
                                        startValue: 0,
                                        
                                        endValue: totalExpense,
                                        color:  Colors.red,
                                        sizeUnit: GaugeSizeUnit.factor,
                                        rangeOffset: 0.04,
                                        startWidth: 0.2,
                                        endWidth: 0.2,
                                      ),
                                      GaugeRange(
                                       
                                        startValue: totalExpense,
                                        endValue: totalIncome+totalExpense,
                                        rangeOffset: 0.08,
                                        sizeUnit: GaugeSizeUnit.factor,
                                        color: Colors.green,
                                        startWidth:  0.2,// model.isWebFullView ? 0.2 : 0.05,
                                        endWidth: 0.2, //model.isWebFullView ? 0.2 : 0.25,
                                        ),
                                    ])
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
                                Text("My Expenses", style: TextStyle(fontSize: 16, ),),
                                Text("See all", style: TextStyle(fontSize: 14,color: primaryColor,  ),)
                              ],
                            ),
                ),
                const SizedBox(height: 12),


              ((snapshot.data ?? []).isEmpty) ? const SizedBox(height: 400, 
              width: double.infinity , child: Text("No Transactions Available"),)  :  AnimationLimiter(child:       Expanded(
                                  child: ListView.builder(
                                    itemCount: (snapshot.data!.length < 3) ? snapshot.data?.length  : 3,
                                    itemBuilder: (context, index) {
                                        final expense = snapshot.data?[index];
                                    
                                      return AnimationConfiguration.staggeredList(
                            position: index,
                            duration: const Duration(milliseconds: 375),
                            child: SlideAnimation(
                              verticalOffset: 50.0,

                              child: FadeInAnimation(

                                child:     Container(
                                        margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                                        decoration: BoxDecoration(
                                          color: containerColor,
                                          borderRadius: BorderRadius.circular(8),
                                        ),
                                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                                        child: Row(
                                          children: [
                                            Container(
                                              padding: const EdgeInsets.all(10),
                                              child: const Icon(Icons.category_outlined, color: Colors.black, size: 30,),
                                            ),
                                            const SizedBox(width: 10),
                                            Expanded(
                                              child: Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Text(expense?.category ?? "Unknown", style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14,), maxLines: 1,),
                                                expense?.dateTime == null ? const Text("") : Text(DateFormat("MMM yyyy").format(expense?.dateTime ?? DateTime.now()), style: const TextStyle(fontWeight: FontWeight.normal, fontSize: 12,  color: Colors.black54), maxLines: 1,),
                                              
                                                ],
                                              ),
                                            ),
                                            const SizedBox(width: 10),
                                            Text("₹${expense?.amount.toString()}", style: TextStyle(
                                              color: expense?.type == 0 ? Colors.red : expense?.type == 1 ? Colors.green : Colors.black,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 14
                                            ),),
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
        },
      ),


    );
  }

  Widget staticticsTypeWidget( {  required Function()? onTap, required bool selected, required String label}) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
          color: selected ? neon : Colors.transparent,
        ),
        child: Text(label, style: TextStyle(
          color: selected ? primaryColor : black, 
          fontWeight:   selected ? FontWeight.bold : FontWeight.normal,
        ),),
      ),
    );
  }

  Widget expenseAndIncomeWidget( {required String label, required double amount, required int type, required int rotation}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
                                                children: [
                                                  Container(
                                                    padding: const EdgeInsets.all(9),
                                                    decoration:  BoxDecoration(
                                                      color: type == 0 ? Colors.red :  Colors.green,
                                                      shape: BoxShape.circle,
                                                    ),
                                                    child:  RotatedBox(
                                                      quarterTurns: rotation,
                                                      child: const Icon(Icons.arrow_back)),
                                                  ),
                                                  const SizedBox(width: 18),
                                                  Column(
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      children: [
                                                        Text(label, style: const TextStyle(fontSize: 12),),
                                                  const SizedBox(height: 2),
                                                        
                                                        Text("₹${amount.toString()}", style: const TextStyle( fontWeight: FontWeight.bold, fontSize: 26, color: black),),
                                                      ],
                                                  ),
                                                                    
                                                                        
                                                ],
                                                                        );
                   
  }
}
