import 'package:flutterapp/wigdet/transacton_item.dart';
import 'package:intl/intl.dart';

import 'package:flutter/material.dart';
import 'package:flutterapp/models/tansaction.dart';


class TransactioList extends StatelessWidget {
 final List <Transaction>transactions;
 final  Function  deleteTx;
TransactioList(this.transactions,this.deleteTx);
 
  @override
  Widget build(BuildContext context) {
    return  transactions.isEmpty? Column(
        children: [
          Text(" No Transactions add yet",style: Theme.of(context).textTheme.titleLarge,),
          SizedBox(
            height: 50,
          ),
          Container(height: 200, child: Image.asset('assets/images/waiting.png',fit: BoxFit.cover,))
        ],
      )
      :ListView.builder(

        itemBuilder: (context, index) {
          return TransactionItem(transactions: transactions[index], deleteTx: deleteTx);
          
        },
        itemCount: transactions.length,
      );

              
            
      
          
      
    
  }
}


/*
 Card(
                child: Row(
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.all(10),
                      margin:EdgeInsets.symmetric(
                        horizontal: 15,
                        vertical: 10
                        ),
                        decoration:BoxDecoration(
                          border: Border.all(
                            color: Theme.of(context).primaryColor,
                            width: 4,
                          ),
                        
                        ),
                      child: Text(
                        '\$${transactions[index].amount.toStringAsFixed(2)}',
                        style:Theme.of(context).textTheme.titleLarge,
                        
                        ),
                        
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          
                         transactions[index].title,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                          
                          ),
                        Text(
                         DateFormat('yyyy-MM-dd').format( transactions[index]. date),
                          style: const TextStyle(
                            color: Colors.red,
      
                          ),
                          )
                      ],
                    )
                  ],
      
                ),
              ) ;
 */