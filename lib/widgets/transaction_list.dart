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
        ? LayoutBuilder(builder: (ctx, constraint) {
            return Column(
              children: [
                Container(
                  height: constraint.maxHeight * 0.15,
                  child: Text(
                    'There\'s no data yet :(',
                    style: Theme.of(context).textTheme.headline6,
                  ),
                ),
                SizedBox(height: constraint.maxHeight * 0.05),
                Container(
                  height: constraint.maxHeight * 0.8,
                  child: Image.asset(
                    'assets/images/waiting.png',
                    fit: BoxFit.cover,
                  ),
                )
              ],
            );
          })
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
                  trailing: MediaQuery.of(context).size.width > 460
                      ? FlatButton.icon(
                          onPressed: () => deleteTx(userList[i].id),
                          icon: Icon(Icons.delete),
                          textColor: Theme.of(context).errorColor,
                          label: Text('delete transaction'),
                        )
                      : IconButton(
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
