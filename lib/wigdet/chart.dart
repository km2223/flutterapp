import 'package:flutter/material.dart';
import 'package:flutterapp/models/tansaction.dart';
import 'package:flutterapp/wigdet/chart_bar.dart';
import 'package:intl/intl.dart';

class Chart extends StatelessWidget {
  final List<Transaction>recentTransaction;
  Chart(this.recentTransaction);
List<Map<String, dynamic>> get groupedTransactionValues {
  return List.generate(7, (index) {
  final weekDay=DateTime.now().subtract(Duration(days: index));
  double totalSum=0.0;
  for(var i=0;i < recentTransaction.length;i++){
    if(recentTransaction[i].date.day==weekDay.day&&
    recentTransaction[i].date.month==weekDay.month&&
    recentTransaction[i].date.year==weekDay.year
    
    ){
      totalSum+=recentTransaction[i].amount;

    }
  }


    return {'day':DateFormat.E().format(weekDay).substring(0,1),'amount':totalSum};
  }).reversed.toList();
 }
 double get totalSpinding{ 
  return groupedTransactionValues.fold(1, (previousValue, element) {
    return previousValue+element['amount'];
  });
  
 }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      margin: EdgeInsets.all(20),
      child:Padding(
        padding:EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: 
            groupedTransactionValues.map((data) {
            return Flexible(
              fit: FlexFit.tight,
              child: ChartBar(
                data['day'], 
                data['amount'],
                totalSpinding == 0.0 ? 0.0 : (data['amount'] as double)/(totalSpinding)
                ),
            );
          },
          ).toList()
          ,
/*         children:groupedTransactionValues.map((data) {
            return ChartBar(data['day'], data['amount'], (data['amount'] as double)/maxSpinding);
          },).toList() */
            
          
        ),
      )
    );
  }
}