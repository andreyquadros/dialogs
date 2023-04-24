
import 'package:flutter/material.dart';

class CustomDialog extends Dialog{
  CustomDialog(String titulo, context): super(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(15),
    ),
    child: Container(
      height: 300,
      width: 300,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(32.0),
            child: Text('$titulo'),
          ),
          TextButton(onPressed: (){
            Navigator.of(context).pop();
          }, child: Text('Fechar Dialog')),
          IconButton(onPressed: (){
            Navigator.of(context).pop();
          }, icon: Icon(Icons.close)),
          
        ],
      ),
    )

  );

}