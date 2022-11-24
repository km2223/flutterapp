
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';


class NewTransaction extends StatefulWidget {
  final Function addTx;
NewTransaction(this.addTx);

  @override
  State<NewTransaction> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleController=TextEditingController();

  final amountController=TextEditingController();
DateTime _selectedDate = DateTime.now();


  void submiteData(){
    if(amountController.text.isEmpty){
      return;
    }
    final enteredTitle=titleController.text;
    final enteredAmount=double.parse(amountController.text);
    if(enteredTitle.isEmpty||enteredAmount<=0||_selectedDate==null){
      return;
    }

                  widget.addTx(
                    enteredTitle,
                    enteredAmount,
                    _selectedDate
                  );
                  Navigator.of(context).pop();

  }
void _presentDatePicker(){
  showDatePicker(
    context: context,
     initialDate: DateTime.now(),
      firstDate: DateTime(2022),
       lastDate: DateTime.now()
       ).then(
        (DatePickerDateOrder) {
          if(DatePickerDateOrder==null){
            return;
          }
          setState(() {
          _selectedDate=DatePickerDateOrder;
            
          });
        });
  
}
  @override
  Widget build(BuildContext context) {
    return  SingleChildScrollView (
      child: Card(
            elevation: 5,
            child: Container(
              padding: EdgeInsets.only(top:10,left: 10,right: 10,bottom: MediaQuery.of(context).viewInsets.bottom+10),
              child: Column(
                children: <Widget>[
                  TextField(
                    decoration: InputDecoration(
                      labelText: 'Title'
                    ),
                   // onChanged: ((value) {
                     // titleInput=value;
                   // }),
                    controller: titleController,
                    onSubmitted:((_) => submiteData()),
                  ),
                   TextField(
                    decoration: InputDecoration(
                      labelText: 'Amount'
                    ),
                                     // onChanged: ((value) {
                      //amountInput=value;
                  //  }),
                    controller: amountController,
                    keyboardType: TextInputType.number,
                                   onSubmitted:((_) => submiteData()),
    
    
                  ),
                  Container(
                    height: 20,
                    child: Row(
                      children: [
                        Expanded (child: Text(_selectedDate==null ?'No Date chosen !': DateFormat.yMd().format(_selectedDate))),
                        TextButton(onPressed: _presentDatePicker, child: Text("Chose date"),
                        style: ButtonStyle(
      foregroundColor: MaterialStateProperty.all<Color>(Colors.purple),
                        )
                        )
                      ],
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () => submiteData (),
                  child: Text("add transcation"),
    /*   style: ButtonStyle(
      foregroundColor: MaterialStateProperty.all<Color>(Colors.purple),
                  ) */)
                  
                ],
              ),
            ),
          ),
    );

  }
}