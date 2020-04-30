import 'package:flutter/material.dart';
import 'package:flutterapp/trainings/quotes/quote.dart';

class QuoteTemplate extends StatelessWidget {
  const QuoteTemplate({
    Key key,
    @required this.quote,
    @required this.deleteQuote,
  }) : super(key: key);

  final Quote quote;
  final Function deleteQuote;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(16),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Text(
              quote.text,
              style: TextStyle(fontSize: 18, color: Colors.grey[600]),
            ),
            SizedBox(
              height: 8,
            ),
            Text(quote.autor,
                style: TextStyle(fontSize: 14, color: Colors.grey[800])),
            SizedBox(height: 8,),
            FlatButton.icon(
              onPressed: (){
                print("object");
                deleteQuote();
              },
               icon: Icon(Icons.delete), 
              label: Text("Delete Quote"))
          ],
        ),
      ),
    );
  }
}
