import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_simple_mvvm_architecture/providers/quote_provider.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

void _refresh(BuildContext context) {
  context.refresh(quoteProvider);
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _Quote(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _refresh(context),
        child: Icon(Icons.refresh),
      ),
    );
  }
}

class _Quote extends ConsumerWidget {
  @override
  Widget build(BuildContext context, watch) {
    final quoteApiProvider = watch(quoteProvider);
    return quoteApiProvider.when(
        data: (data) {
          return ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.all(30),
            itemCount: data.quotes!.length,
            itemBuilder: (context, index) {
              return Container(
                padding: EdgeInsets.all(30),
                width: MediaQuery.of(context).size.width - 60,
                alignment: Alignment.center,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(data.quotes![index].text!,
                        style: Theme.of(context).textTheme.headline5),
                    SizedBox(
                      height: 20,
                    ),
                    Text(data.quotes![index].author!,
                        style: Theme.of(context).textTheme.subtitle2)
                  ],
                ),
              );
            },
          );
        },
        error: (_, __) => ErrorScreen(),
        loading: () => CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation(Colors.black),
            ));
  }
}

class ErrorScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text("Error occured"),
    );
  }
}
