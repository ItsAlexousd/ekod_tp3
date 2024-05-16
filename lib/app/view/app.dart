import 'package:ekod_tp3/features/todos/todos.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (_) => TodosRepository(),
      child: MaterialApp(
        theme: ThemeData(
          useMaterial3: true,
          scaffoldBackgroundColor: const Color(0xFFF0F0F0),
          appBarTheme: const AppBarTheme(
            backgroundColor: Color(0xFFF0F0F0),
          ),
        ),
        home: const TodosView(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
