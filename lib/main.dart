

import 'package:flutter/material.dart';
import 'package:flutterapp/wigdet/chart.dart';
import 'package:flutterapp/wigdet/new_Transaction.dart';
import 'package:flutterapp/wigdet/transaction_list.dart';
import '../models/tansaction.dart';
 void main(List<String> args) {
  runApp(MyApp());
  
}
class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
        return MaterialApp(
           title: 'Wallet ',
           theme: ThemeData(
            primarySwatch: Colors.purple,
            accentColor: Colors.amberAccent,
            fontFamily: 'Quicksand',
            appBarTheme: AppBarTheme(
              textTheme:ThemeData.light().textTheme.copyWith(
                titleLarge: TextStyle(
                  fontFamily: 'OpenSans',
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  
                )
              ))),
           
               
            home: MyHomePage(),
    ); 
  }
 
}
class MyHomePage extends StatefulWidget{
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {


  /*
   String titleInput='';
   String amountInput='';
*/
   final List <Transaction>_userTranscation=[
/*         Transaction(
      id:'t1', 
      title:'shoes',
       amount:12.2,
       date:DateTime.now()
      ),
       Transaction(
      id:'t2', 
      title:'book',
       amount:12.2,
       date:DateTime.now()
      ), */
  ];
  bool _showChart=false;
List<Transaction> get _recentTransactions {
    return _userTranscation.where((tx) {
        return tx.date.isAfter(DateTime.now().subtract(Duration(days: 7),),);
    }).toList();
 }
 

/*     return _recentTranscation.where((tx) {
      return tx.date.isAfter(
        DateTime.now().subtract(
          Duration(days: 7)));
    } ).toList();
 
 */
  
  void _addNewTransaction(String txTitle,double txAmount,DateTime chosenDate){
    final newTx=Transaction(id: DateTime.now().toString(), title: txTitle, amount: txAmount, date: chosenDate
    );
    setState(() {
      _userTranscation.add(newTx);
    });

  }


  final titleController=TextEditingController();
  final amountController=TextEditingController();

void _startAddNewTransaction(BuildContext ctx){
showModalBottomSheet(context: ctx, builder: ((_) {
  return GestureDetector(onTap: () {
    
  },
    child: NewTransaction(_addNewTransaction),
    behavior: HitTestBehavior.opaque );
})
);

}
void _deleteTransaction(String id){
  setState(() {
    _userTranscation.removeWhere((tx)=> tx.id==id);
  });
}
Widget _buildlandscapeContent(){
  return  Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("show Chart"),
                Switch.adaptive(value: _showChart, onChanged: ((value) {
                  setState(() {
                  _showChart=value;
                    
                  });
                }))

              ],
            );
}
Widget _buildPortriatContent( MediaQueryData mediaQuery,AppBar appBar){
  return Container(
            height:(mediaQuery.size.height-appBar.preferredSize.height-MediaQuery.of(context).padding.top)*0.3,
            child: Chart(_recentTransactions));
}
  @override
  Widget build(BuildContext context) {
    final mediaQuery=MediaQuery.of(context);
    final isLandscape=mediaQuery==Orientation.landscape;
    final appBar=AppBar(
        title: Text('Wallet',style: TextStyle(fontFamily: 'OpenSans'),),
        actions: [
          IconButton(onPressed: (() => _startAddNewTransaction(context)), icon: Icon(
            Icons.add
          ))
        ],
      
      );
      final txListwidget=Container(
            height:(mediaQuery.size.height-appBar.preferredSize.height-MediaQuery.of(context).padding.top)*0.8,

        child: TransactioList(_userTranscation,_deleteTransaction));
    return  Scaffold(
      appBar:appBar,
      body: SingleChildScrollView(
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children:<Widget> [
            if(isLandscape)
           _buildlandscapeContent(),

           if(!isLandscape) _buildPortriatContent(mediaQuery, appBar),
          if(!isLandscape)txListwidget,
           if(isLandscape) _showChart?Container(
            height:( mediaQuery.size.height-appBar.preferredSize.height-MediaQuery.of(context).padding.top)*0.2,
            child: Chart(_recentTransactions))
         
      : txListwidget
          
        ],
        ),
      ),
      
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat ,
      floatingActionButton:  FloatingActionButton (onPressed:(() => _startAddNewTransaction(context)),
      child:Icon(Icons.add)),
    );
  }
}


/**
 * (() => _startAddNewTransaction(context))
         children:transaction.map((tx) {
          return Card(
            child: Text(tx.title),
          );
          
        }).toList()



    final enteredAmount=double.parse(amountController.text);

 */