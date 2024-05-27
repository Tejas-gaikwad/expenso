import 'package:flutter/material.dart';
import 'package:simple_animations/simple_animations.dart';

import '../common_widgets/calendar_widget.dart';
import '../common_widgets/textfield_widget.dart';
import '../utils/colors.dart';

class AddExpenseFlowScreen extends StatefulWidget {
  const AddExpenseFlowScreen({super.key});

  @override
  State<AddExpenseFlowScreen> createState() => _AddExpenseFlowScreenState();
}

class _AddExpenseFlowScreenState extends State<AddExpenseFlowScreen>
    with AnimationMixin {
  final tween1 = MovieTween()
    ..tween('width', Tween(begin: -50.0, end: 0),
            duration: const Duration(milliseconds: 1500), curve: Curves.easeIn)
        .thenTween('width', Tween(begin: -50, end: 0),
            duration: const Duration(milliseconds: 750), curve: Curves.easeOut);

  late Animation<double> size; // Declare animation variable
  int? selectedExpenseType = -1;
  double amount = -1;
  // 0=expense 1=income 2 =loan/debit
  late TextEditingController amountController;
  int part = 0;

  @override
  void initState() {
    super.initState();
    size = Tween(begin: -350.0, end: 0.0).animate(controller);
    controller.play();
    amountController = TextEditingController();
  }

  @override
  void dispose() {
    amountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: white),
        backgroundColor: primaryColor,
        title: const Text(
          "Add Expense",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: white,
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              (part == 0)
                  ? enterExpenseType(selectedType: selectedExpenseType)
                  : (part == 1)
                      ? enterAmount(controller: amountController)
                      : (part == 1)
                          ? selectDateWidget()
                          : const SizedBox(),
            ],
          ),
        ),
      ),
    );
  }

  Widget selectDateWidget() {
    return SizedBox(
      height: MediaQuery.of(context).size.height / 3,
      child: const CalendarWidget(),
    );
  }

  Widget enterExpenseType({int? selectedType}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Select Type",
          style: TextStyle(
            color: black,
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 20),
        Row(
          children: [
            Expanded(
              child: Container(
                child: containerWidget(
                  borderColor: selectedExpenseType == 0 ? white : primaryColor,
                  expenseType: 0,
                  color: selectedExpenseType == 0 ? primaryColor : white,
                  textColor: selectedExpenseType == 0 ? white : black,
                ),
              ),
            ),
            Expanded(
              child: Container(
                child: containerWidget(
                  borderColor: selectedExpenseType == 1 ? white : primaryColor,
                  expenseType: 1,
                  color: selectedExpenseType == 1 ? primaryColor : white,
                  textColor: selectedExpenseType == 1 ? white : black,
                ),
              ),
            ),
            Expanded(
              child: Container(
                child: containerWidget(
                  borderColor: selectedExpenseType == 2 ? white : primaryColor,
                  expenseType: 2,
                  color: selectedExpenseType == 2 ? primaryColor : white,
                  textColor: selectedExpenseType == 2 ? white : black,
                ),
              ),
            ),
          ],
        )
      ],
    );
  }

  Widget containerWidget({
    Color? color,
    required int expenseType,
    Color? textColor,
    Color? borderColor,
  }) {
    return InkWell(
      onTap: () async {
        setState(() {
          selectedExpenseType = expenseType;
        });
        await Future.delayed(const Duration(seconds: 2));
        setState(() {
          part = 1;
        });

        // TODO here you can add a progress bar in bottom or top up so that user expereice will be interactive and good lookking
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 6),
        alignment: Alignment.center,
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          border: Border.all(
            width: 1,
            color: borderColor ?? Colors.transparent,
          ),
          color: color,
          borderRadius: BorderRadius.circular(6),
        ),
        child: Text(
          expenseType == 0
              ? "Expense"
              : expenseType == 1
                  ? "Income"
                  : expenseType == 2
                      ? "Debt/Loan"
                      : "",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: textColor,
          ),
        ),
      ),
    );
  }

  Widget enterAmount({
    TextEditingController? controller,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Enter Amount",
          style: TextStyle(
            color: black,
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 20),
        ConstantTextFieldWidget(
          controller: controller,
          keyboardType: TextInputType.number,
        ),
        const SizedBox(height: 20),
        InkWell(
          onTap: () async {
            // Navigator.push(context, MaterialPageRoute(builder: (context) {
            //   return
            // },));

            if (amountController.text.isNotEmpty) {
              setState(() {
                amount = double.parse(amountController.text);
              });
              await Future.delayed(const Duration(seconds: 2));
              setState(() {
                part = 2;
              });
            } else {
              ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Please enter amount.")));
            }
          },
          child: Container(
            alignment: Alignment.center,
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 18),
            decoration: BoxDecoration(
              color: primaryColor,
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Text(
              "Next",
              style: TextStyle(
                color: white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
