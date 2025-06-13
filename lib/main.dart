import 'package:cub_02/page_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => CounterBloc2()),
        BlocProvider(create: (context) => CounterBloc()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        ),
        home: MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final counterBloc2 = context.read<CounterBloc2>();
    final counterBloc3 = context.read<CounterBloc>();
    return Scaffold(
      appBar: AppBar(title: Text('Random Names')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            BlocBuilder<CounterBloc2, String>(
              builder: (context, state) {
                return Text('nombre: $state');
              },
            ),

            InkWell(
              child: BlocBuilder<CounterBloc, int>(
                builder: (context, state) {
                  return Text('+ $state',style: TextStyle(fontSize: 40, 
                  color: state < 10 ? Colors.blue : Colors.red
                  ),);
                },
              ),
              onTap: () {
                counterBloc3.add(IncrementEvent());
              },
            ),
          ],
        ),
      ),

      bottomNavigationBar: FilledButton(
        onPressed: () {
          counterBloc2.add(GenerateName());
        },
        child: Text('Nombre Aleatorio'),
      ),
    );
  }
}


/*
class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});




  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {

 _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {

  return Scaffold(
      appBar: AppBar(

 backgroundColor: Theme.of(context).colorScheme.inversePrimary,

 title: Text(widget.title),
      ),
      body: Center(


        child: Column(


          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('You have pushed the button this many times:'),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
*/