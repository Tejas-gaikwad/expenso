import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:simple_animations/simple_animations.dart';

import '../common_widgets/calendar_widget.dart';
import '../common_widgets/prev_widget.dart';
import '../common_widgets/textfield_widget.dart';
import '../model/my_expense_model.dart';
import '../services/add_flow_services.dart';
import '../utils/colors.dart';
import 'widgets/add_expense_button_widget.dart';

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

  late Animation<double> size;
   int? selectedExpenseType;
  double amount = -1; // 0=expense 1=income 2 =loan/debit
  late TextEditingController amountController;
  late TextEditingController _noteController;
  late DateTime selectedDateFromCalendar;
  TimeOfDay? selectedTime;
  int part = 0;
  String? selectedCategory;
  MyExpenseModel? expenseModel;
  late AddFlowServices addExpenseService;
  DateTime? userSelectedDateAndTime;

  @override
  void initState() {
    super.initState();
    addExpenseService = AddFlowServices();
    selectedDateFromCalendar = DateTime.now();
    size = Tween(begin: -350.0, end: 0.0).animate(controller);
    controller.play();
    amountController = TextEditingController();
    _noteController = TextEditingController();
  }

  @override
  void dispose() {
    amountController.dispose();
    _noteController.dispose();
    super.dispose();
  }

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (picked != null && picked != selectedTime) {
      setState(() {
        selectedTime = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    
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
                      : (part == 2)
                          ? selectDateAndTimeWidget()
                          : (part == 3)
                              ? addNote()
                              : (part == 4)
                                  ? addCategory()
                                  : (part == 5)
                                      ? selectExpenseWay()
                                      : (part == 6)
                                          ? expenseSummaryWidget()
                                          : const SizedBox(),
            ],
          ),
        ),
      ),
    );
  }

  Widget rowOfLabelAndText({
    required String label,
    required String userInput,
    double? userInputFontSize,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            "$label ",
            style: const TextStyle(
              fontSize: 12,
              color: black,
            ),
          ),
          const SizedBox(width: 15),
          Text(
            userInput,
            maxLines: 1,
            style: TextStyle(
                fontSize: userInputFontSize ?? 20,
                color: primaryColor,
                fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }

  String? selectedAccount;

  Widget expenseSummaryWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        PrevWidget(
          onTap: () {
            setState(() {
              part = 5;
            });
          },
        ),
        const Text(
          "Summary",
          style: TextStyle(
            color: black,
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 30),
        //
        rowOfLabelAndText(
            label: "Amount",
            userInput: amountController.text,
            userInputFontSize: 50),
        rowOfLabelAndText(
          label: "Date",
          userInputFontSize: 20,
          userInput: DateFormat("dd MMM yyyy, hh:MM a")
              .format(
                DateTime(
                  selectedDateFromCalendar.year,
                  selectedDateFromCalendar.month,
                  selectedDateFromCalendar.day,
                  selectedTime?.hour ?? 0,
                  selectedTime?.minute ?? 0,
                ),
              )
              .toString(),
        ),
        rowOfLabelAndText(
            userInputFontSize: 20,
            label: "Category",
            userInput: selectedCategory.toString()),
        rowOfLabelAndText(
            userInputFontSize: 20,
            label: "Account",
            userInput: selectAccountType ?? "Not Available"),
        rowOfLabelAndText(
            userInputFontSize: 20,
            label: "Note",
            userInput: _noteController.text),

        const SizedBox(height: 30),

        AddExpenseButtonWidget(
          expenseSummary: expenseModel,
        ),

        // InkWell(
        //   onTap: () {
        //     // TODO navigate to add expense success page
        //     setState(() {
        //       part = 6;
        //     });
        //   },
        //   child: Container(
        //     alignment: Alignment.center,
        //     padding: const EdgeInsets.symmetric(vertical: 15),
        //     decoration: BoxDecoration(
        //       borderRadius: BorderRadius.circular(8),
        //       color: primaryColor,
        //       border: Border.all(color: primaryColor),
        //     ),
        //     child: const Text(
        //       "ADD EXPENSE",
        //       style: TextStyle(
        //         color: white,
        //         fontWeight: FontWeight.bold,
        //       ),
        //     ),
        //   ),
        // ),
      ],
    );
  }

  String? selectAccountType;
  List<String> accountList  =["UPI", "Cards", "Cash", "NetBanking", ];

  Widget selectExpenseWay() {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          PrevWidget(
            onTap: () {
              setState(() {
                part = 4;
              });
            },
          ),
          const Text(
            "Select Account",
            style: TextStyle(
              color: black,
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 30),
          const SizedBox(height: 30),
          SizedBox(
            child: GridView.builder(
              shrinkWrap: true,
              itemCount: accountList.length,
              physics: const AlwaysScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                childAspectRatio: 4,
                mainAxisSpacing: 10,
              ),
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    setState(() {
                      selectAccountType = accountList[index];
                    });
                  },
                  child: Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                        color: selectAccountType != accountList[index] ? Colors.grey : white,
                      ),
                      color: selectAccountType == accountList[index] ? primaryColor : white,
                    ),
                    child: Text(
                      accountList[index],
                      style: TextStyle(
                        color: selectAccountType == accountList[index] ? white : black,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 30),
          Row(
            children: [
              Expanded(
                child: InkWell(
                  onTap: () {
                    setState(() {
                      part = 6;
                    });
                  },
                  child: Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: white,
                      border: Border.all(color: primaryColor),
                    ),
                    child: const Text(
                      "Skip",
                      style: TextStyle(color: primaryColor),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: InkWell(
                  onTap: () {
                    expenseModel =  addExpenseService.addExpense(
                      expenseType: selectedExpenseType ?? -1,
                      amount: amountController.text,
                      accountType: selectAccountType,
                      category: selectedCategory,
                      dateTime: userSelectedDateAndTime,
                      note: _noteController.text,

                    );
                    setState(() {
                      part = 6;
                    });
                  },
                  child: Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: primaryColor,
                      border: Border.all(color: primaryColor),
                    ),
                    child: const Text(
                      "Add",
                      style: TextStyle(color: white),
                    ),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

    final  List<String> expenseCategories = [
  'Groceries',
  'Restaurants',
  'Fuel',
  'Public Transport',
  'Rent/Mortgage',
  'Utilities',
  'Internet',
  'Medical Bills',
  'Pharmacy',
  'Gym/Fitness',
  'Movies',
  'Concerts',
  'Subscriptions',
  'Clothing',
  'Haircuts/Salons',
  'Books',
  'Tuition Fees',
  'Flights',
  'Hotels',
  'Investments',
  'Savings',
  'Gifts',
  'Charitable Donations',
  'Childcare',
  'Pet Care',
  'Other/Uncategorized',
  'Fees & Charges',
];


  Widget addCategory() {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          PrevWidget(
            onTap: () {
              setState(() {
                part = 3;
              });
            },
          ),
          const Text(
            "Select Category",
            style: TextStyle(
              color: black,
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 30),
          const SizedBox(height: 30),
          SizedBox(
            height: MediaQuery.of(context).size.height / 3,
            child: GridView.builder(
              shrinkWrap: true,
              itemCount: expenseCategories.length,
              physics: const AlwaysScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                childAspectRatio: 4,
                mainAxisSpacing: 10,
              ),
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    setState(() {
                      selectedCategory = expenseCategories[index];
                    });
                  },
                  child: Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                        color: selectedCategory == expenseCategories[index] ? Colors.grey : white,
                      ),
                      color:selectedCategory == expenseCategories[index]  ? primaryColor : white,
                    ),
                    child: Text(
                      expenseCategories[index],
                      style: TextStyle(
                        color:selectedCategory == expenseCategories[index]  ? white : black,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 30),
          selectedCategory == null
              ? const SizedBox()
              : InkWell(
                  onTap: () async {
                    setState(() {
                      part = 5;
                    });
                  },
                  child: Container(
                    alignment: Alignment.center,
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    decoration: BoxDecoration(
                      color: primaryColor,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Text(
                      "Next",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
        ],
      ),
    );
  }

  Widget addNote() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        PrevWidget(
          onTap: () {
            setState(() {
              part = 2;
            });
          },
        ),
        const Text(
          "Add Note",
          style: TextStyle(
            color: black,
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 30),
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: primaryColor),
            borderRadius: BorderRadius.circular(8),
          ),
          child: TextField(
            controller: _noteController,
            maxLines: 4,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Enter your note here',
            ),
          ),
        ),
        const SizedBox(height: 30),
        Row(
          children: [

            Expanded(
              child: InkWell(
                onTap: () {
                  setState(() {
                    part = 4;
                  });
                },
                child: Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: white,
                    border: Border.all(color: primaryColor),
                  ),
                  child: const Text(
                    "Skip",
                    style: TextStyle(color: primaryColor),
                  ),
                ),
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: InkWell(
                onTap: () {
                  setState(() {
                    part = 4;
                  });
                },
                child: Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: primaryColor,
                    border: Border.all(color: primaryColor),
                  ),
                  child: const Text(
                    "Add",
                    style: TextStyle(color: white),
                  ),
                ),
              ),
            ),

          ],
        )
      ],
    );
  }

  Widget selectDateAndTimeWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        PrevWidget(
          onTap: () {
            setState(() {
              part = 1;
            });
          },
        ),
        const Text(
          "Select Date and Time",
          style: TextStyle(
            color: black,
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 30),
        selectDateWidget(),
        const SizedBox(height: 30),
        selectTimeWidget(),
        const SizedBox(height: 30),
        (selectedTime != null) ? nextButtonWidget() : const SizedBox(),
      ],
    );
  }

  Widget nextButtonWidget() {
    return InkWell(
      onTap: () async {
        userSelectedDateAndTime = DateTime(
          selectedDateFromCalendar.year,
          selectedDateFromCalendar.month,
          selectedDateFromCalendar.day,
          selectedTime?.hour ?? 0,
          selectedTime?.minute ?? 0,
        );

        setState(() {
          part = 3;
        });
      },
      child: Container(
        alignment: Alignment.center,
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
          color: primaryColor,
          borderRadius: BorderRadius.circular(8),
        ),
        child: const Text(
          "Next",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  Widget selectDateWidget() {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: primaryColor),
      ),
      height: MediaQuery.of(context).size.height / 3,
      child: CalendarWidget(
        onDateSelected: (selectedDate) {
          print("selectedDate  ----   $selectedDate");
          selectedDateFromCalendar = selectedDate.value;
          setState(() {});
        },
      ),
    );
  }

  Widget selectTimeWidget() {
    return InkWell(
      onTap: () {
        _selectTime(context);
      },
      child: Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.symmetric(vertical: 12),
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: white,
            border: Border.all(color: primaryColor),
          ),
          child: Text(
            selectedTime == null
                ? "Select time"
                : selectedTime!.format(context),
            style: const TextStyle(
                color: primaryColor, fontWeight: FontWeight.bold, fontSize: 16),
          )),
    );
  }

  Widget enterExpenseType({int? selectedType}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
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
          borderRadius: BorderRadius.circular(8),
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
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        PrevWidget(
          onTap: () {
            setState(() {
              part = 0;
            });
          },
        ),
        const Text(
          "Enter Amount",
          style: TextStyle(
            color: black,
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 20),
        ConstantTextFieldWidget(
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 50,
          ),
          borderColor: Colors.transparent,
          borderRadius: 0,
          controller: controller,
          keyboardType: TextInputType.number,
        ),
        const SizedBox(height: 40),
        InkWell(
          onTap: () async {
            if (amountController.text.isNotEmpty) {
              setState(() {
                amount = double.parse(amountController.text);
              });
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
