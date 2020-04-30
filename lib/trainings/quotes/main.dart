import 'package:flutter/material.dart';
import 'package:flutterapp/trainings/quotes/quote.dart';
import 'package:flutterapp/trainings/quotes/quote_card.dart';

void main() => runApp(MaterialApp(home: QouteList()));

class QouteList extends StatefulWidget {
  @override
  _QouteListState createState() => _QouteListState();
}

class _QouteListState extends State<QouteList> {
  List<Quote> quotes = [
    Quote(
        text: "Be yourself; everyone else is already taken.",
        autor: "Mae West"),
    Quote(
      text: "So many books, so little time.",
      autor: "Frank Zappa",
    ),
    Quote(
        text: "You only live once, but if you do it right, once is enough.",
        autor: "Oscar Wilde"),
    Quote(
        text: "You only live once, but if you do it right, once is enough.",
        autor: "Oscar Wilde"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[200],
        appBar: AppBar(
          title: Text("Awesome Quotes"),
          centerTitle: true,
          titleSpacing: 2,
          backgroundColor: Colors.redAccent,
        ),
        body: Column(
          children: quotes.map((quote) {
            return QuoteTemplate(
              quote: quote,
              deleteQuote: () {
                setState(() {
                  quotes.remove(quote);
                });
              },
            );
          }).toList(),
        ));
  }
}

