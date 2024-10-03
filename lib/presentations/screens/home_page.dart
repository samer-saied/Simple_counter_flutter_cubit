import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myapp/presentations/bloc/add_cubit.dart';
import 'package:myapp/presentations/bloc/add_state.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Bloc Flutter"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'times:',
            ),
            BlocBuilder<AddCubit, AddState>(
              builder: (context, state) {
                if (state is AddLoadedState) {
                  return Text(
                    state.times.toString(),
                    style: Theme.of(context).textTheme.headlineMedium,
                  );
                } else if (state is AddInitialState) {
                  return const Text("press Add Button");
                } else {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },
            ),
            TextField(
              controller:
                  context.read<AddCubit>().numberController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Enter a number',
              ),
            )
          ],
        ),
      ),
      floatingActionButton: Wrap(
        children: [
          FloatingActionButton(
            onPressed: context.read<AddCubit>().addTime,
            tooltip: 'Increment',
            child: const Icon(Icons.add),
          ),
          FloatingActionButton(
            onPressed: context.read<AddCubit>().subtractTime,
            tooltip: 'Decrement',
            child: const Icon(Icons.minimize),
          ),
          FloatingActionButton(
            onPressed: () {
              context.read<AddCubit>().addNumberToTime(5);
            },
            tooltip: 'Increment Numbers',
            child: const Icon(Icons.numbers),
          ),
        ],
      ),
    );
  }
}
