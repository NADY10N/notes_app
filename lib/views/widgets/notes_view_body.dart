import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes/Views/widgets/custom_app_bar.dart';
import 'package:notes/Views/widgets/notes_list_view.dart';

import 'package:notes/cubits/notes_cubit/notes_cubit.dart';
import 'package:notes/views/search_notes_view.dart';

class NotesViewBody extends StatefulWidget {
  const NotesViewBody({super.key});

  @override
  State<NotesViewBody> createState() => _NotesViewBodyState();
}

class _NotesViewBodyState extends State<NotesViewBody> {
  @override
  void initState() {
    BlocProvider.of<NotesCubit>(context).fetchAllNotes();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        children: [
          const SizedBox(
            height: 50,
          ),
          CustomAppBar(
            title: 'Notes',
            icon: Icons.search,
            onPressed: () {
              showSearch(
                  context: context,
                  delegate:
                      CustomSearch(notes: context.read<NotesCubit>().notes));
            },
          ),
          const Expanded(child: NotesListView()),
        ],
      ),
    );
  }
}
