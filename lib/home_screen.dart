import 'package:dialogs_example/custom_dialog.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  late TimeOfDay HourSelection = TimeOfDay.now();
  late DateTime DateSelection;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Página Inicial'),
      ),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(onPressed: (){
              showDialog(context: context, builder: (context){
                return CustomDialog('Caixa de Diálogo Customizado', context);
              });
            }, child: Text('Custom Dialog')),
            ElevatedButton(onPressed: (){
              showDialog(context: context, builder: (context){
                return SimpleDialog(title: Text('Simple Dialog'),
                  children: [
                    Text('Descrição de utilização desse Dialog'),
                  ElevatedButton.icon(onPressed: (){
                    Navigator.of(context).pop();
                  }, icon: Icon(Icons.close), label: Text('Fechar'))
                ],);
              });
            }, child: Text('Simple Dialog')),
            ElevatedButton(onPressed: (){
              showDialog(context: context, builder: (context){
                return AlertDialog(title: Text('Alert Dialog'),actions: [
                  Text('Descrição no AlertDialog')
                ],
                );
              });
            }, child: Text('Alert Dialog')),
            ElevatedButton(onPressed: () async{
              HourSelection = (await showTimePicker(
                  context: context,
                  initialTime: TimeOfDay.now()))!;
                print('${HourSelection.hour}:${HourSelection.minute}');
            }, child: Text('Time Picker Dialog')),
            ElevatedButton(onPressed: () async{
               DateSelection = (await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(1950),
                    lastDate: DateTime(2024)))!;
               print('${DateSelection.day}/${DateSelection.month}/${DateSelection.year}');
            }, child: Text('Date Picker Dialog')),

          ],
        ),
      ),
    );
  }
}
