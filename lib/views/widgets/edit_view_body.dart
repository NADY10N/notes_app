import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes/cubits/notes_cubit/notes_cubit.dart';
import 'package:notes/models/note_model.dart';
import 'package:notes/views/widgets/custom_app_bar.dart';

import 'package:notes/views/widgets/custom_text_field.dart';

class EditNoteViewBody extends StatefulWidget {
  const EditNoteViewBody({super.key, required this.note});
  final NoteModel note;

  @override
  State<EditNoteViewBody> createState() => _EditNoteViewBodyState();
}

class _EditNoteViewBodyState extends State<EditNoteViewBody> {
  String? title, content;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 24,
        ),
        child: Column(
          children: [
            const SizedBox(
              height: 50,
            ),
            CustomAppBar(
              onPressed: () {
                widget.note.title = title ?? widget.note.title;
                widget.note.subTitle = content ?? widget.note.subTitle;
                widget.note.save();
                context.read<NotesCubit>().fetchAllNotes();
                Navigator.of(context).pop();
              },
              title: "Edit Note",
              icon: Icons.check,
            ),
            CustomTextfield(
              initialValue: widget.note.title,
              onChanged: (value) {
                title = value;
              },
              // hint: widget.note.title,
              hint: "Title",
            ),
            SizedBox(
              height: 16,
            ),
            CustomTextfield(
              initialValue: widget.note.subTitle,
              onChanged: (value) {
                content = value;
              },
              hint: "Subtitle",
              maxLines: 5,
            ),
          ],
        ),
      ),
    );
  }
}
