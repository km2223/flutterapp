import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class ChartBar extends StatelessWidget {
  final String label;
  final double spendingAmount;
  final double spendeningPct0total;
  
  const ChartBar(this.label,this.spendeningPct0total,this.spendingAmount);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: ((ctx, Constraints) {
      return  Column(
      children: [
        Container(
              height: Constraints.maxHeight*0.15,
        
          child: FittedBox(child: Text('\$${spendingAmount.toStringAsFixed(0)}'))),
        SizedBox(height: Constraints.maxHeight*0.05 ,),
        Container(
          height:  Constraints.maxHeight*0.6,
          width: 10,
          child: Stack(children: [
            Container(
              decoration: BoxDecoration(
                border:Border.all(
                  color: Colors.grey,
                  width: 1,
                ),
                  color:Color.fromRGBO(220, 220, 220, 1),
                  borderRadius: BorderRadius.circular(10)
              ),
            ),
            FractionallySizedBox(
              heightFactor: spendeningPct0total,
              child: Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  borderRadius: BorderRadius.circular(10)
                ),
              ),
            )
          ]),
        ),
        SizedBox(height:  Constraints.maxHeight*0.05,),
        Container(
          height: Constraints.maxHeight*0.15 ,
          child: FittedBox(child: Text(label))),

      ],
    );
      
    }));
  }
}