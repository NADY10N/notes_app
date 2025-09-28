import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:notes/constants.dart';
import 'package:notes/cubits/notes_cubit/notes_cubit.dart';
import 'package:notes/cubits/theme_app_cubit/theme_app_cubit.dart';

import 'package:notes/models/note_model.dart';
import 'package:notes/simple_bloc_observer.dart';
import 'package:notes/views/notes_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  await Hive.initFlutter();
  Bloc.observer = SimpleBlocObserver();
  Hive.registerAdapter(NoteModelAdapter());
  await Hive.openBox<NoteModel>(kNotesBox);
  runApp(const NotesApp());
}

class NotesApp extends StatelessWidget {
  const NotesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => NotesCubit(),
        ),
        BlocProvider(
          create: (context) => ThemeAppCubit(),
        ),
      ],
      child: BlocBuilder<ThemeAppCubit, ThemeAppState>(
        builder: (context, state) {
          final isDark = context.read<ThemeAppCubit>().themeType;
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              brightness: isDark ? Brightness.dark : Brightness.light,
              fontFamily: "Poppins",
            ),
            home: const NotesView(),
          );
        },
      ),
    );
  }
}
