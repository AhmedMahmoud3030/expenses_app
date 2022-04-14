import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> userList;
  final Function deleteTx;

  TransactionList({this.userList, this.deleteTx});

  @override
  Widget build(BuildContext context) {
    return userList.isEmpty
        ? Column(
            children: [
              Text(
                'There\'s no data yet :(',
                style: Theme.of(context).textTheme.headline6,
              ),
              SizedBox(height: 50),
              Container(
                height: 200,
                child: Image.asset(
                  'assets/images/waiting.png',
                  fit: BoxFit.cover,
                ),
              )
            ],
          )
        : ListView.builder(
            itemBuilder: (ctx, i) {
              return Card(
                elevation: 5,
                margin: EdgeInsets.symmetric(
                  vertical: 5,
                  horizontal: 8,
                ),
                child: ListTile(
                  leading: CircleAvatar(
                    radius: 30,
                    child: Padding(
                      padding: const EdgeInsets.all(6),
                      child: FittedBox(child: Text('\$${userList[i].amount}')),
                    ),
                  ),
                  title: Text(
                    '${userList[i].title}',
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  subtitle: Text(
                    DateFormat.yMMMd().format(userList[i].date),
                  ),
                  trailing: IconButton(
                    icon: Icon(Icons.delete),
                    color: Theme.of(context).errorColor,
                    onPressed: () => deleteTx(userList[i].id),
                  ),
                ),
              );
            },
            itemCount: userList.length,
          );
  }
}
