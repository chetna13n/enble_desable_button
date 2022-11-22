import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool textBtnswitchState = true;
  bool elevatedBtnSwitchState = true;
  bool outlinedBtnState = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  child: Text('Text Button'),
                  onPressed: textBtnswitchState ? () {} : null,
                  style: ButtonStyle(
                    foregroundColor: MaterialStateProperty.resolveWith(
                          (states) {
                        if (states.contains(MaterialState.disabled)) {
                          return Colors.grey;
                        } else {
                          return Colors.red;
                        }
                      },
                    ),
                  ),
                ),
                Column(
                  children: [
                    const Text('Change State'),
                    Switch(
                      value: textBtnswitchState,
                      onChanged: (newState) {
                        setState(() {
                          textBtnswitchState = !textBtnswitchState;
                        });
                      },
                    ),
                  ],
                )
              ],
            ),
            const Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  child: const Text('2 Button'),
                  onPressed: elevatedBtnSwitchState ? () {} : null,
                  style: ButtonStyle(
                    foregroundColor: MaterialStateProperty.resolveWith(
                          (states) {
                        if (states.contains(MaterialState.disabled)) {
                          return Colors.grey;
                        } else {
                          return Colors.white;
                        }
                      },
                    ),
                  ),
                ),
                Column(
                  children: [
                    const Text('Change State'),
                    Switch(
                      value: elevatedBtnSwitchState,
                      onChanged: (newState) {
                        setState(() {
                          elevatedBtnSwitchState = !elevatedBtnSwitchState;
                        });
                      },
                    ),
                  ],
                )
              ],
            ),
            const Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                OutlinedButton(
                  child: const Text('Outlined Button'),
                  onPressed: outlinedBtnState ? () {} : null,
                  style: ButtonStyle(
                      foregroundColor: MaterialStateProperty.resolveWith(
                            (states) {
                          if (states.contains(MaterialState.disabled)) {
                            return Colors.grey;
                          } else {
                            return Colors.green;
                          }
                        },
                      ), side: MaterialStateProperty.resolveWith((states) {
                    if (states.contains(MaterialState.disabled)) {
                      return const BorderSide(color: Colors.grey);
                    } else {
                      return const BorderSide(color: Colors.green);
                    }
                  })),
                ),
                Column(
                  children: [
                    const Text('Change State'),
                    Switch(
                      value: outlinedBtnState,
                      onChanged: (newState) {
                        setState(() {
                          outlinedBtnState = !outlinedBtnState;
                        });
                      },
                    ),
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}