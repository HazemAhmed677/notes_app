import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/add_note_cubit/add_note_cubit.dart';
import 'package:notes_app/cubits/add_note_cubit/add_note_states.dart';
import 'package:notes_app/cubits/notes_cubit/notes_cubit.dart';
import 'package:notes_app/widgets/add_note.dart';

class AddBottomSheet extends StatelessWidget {
  const AddBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddNoteCubit(),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: BlocConsumer<AddNoteCubit, AddNoteStates>(
          listener: (context, state) {
            if (state is FailureAddNoteState) {
            } else if (state is SuccessAddNoteState) {
              BlocProvider.of<NotesCubit>(context).fetchAllNotes();
              Navigator.pop(context);
            }
          },
          builder: (context, state) {
            return AbsorbPointer(
              absorbing: (state is LoadingAddNoteState) ? true : false,
              child: const SingleChildScrollView(
                child: AddNote(),
              ),
            );
          },
        ),
      ),
    );
  }
}
