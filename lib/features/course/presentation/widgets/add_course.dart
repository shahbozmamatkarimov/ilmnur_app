import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ilmnur_app/features/course/data/models/createcourse.dart';
import 'package:ilmnur_app/features/course/presentation/bloc/course/course_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class AddCourseModal extends StatefulWidget {
  const AddCourseModal({super.key});

  @override
  AddCourseModalState createState() => AddCourseModalState();
}

class AddCourseModalState extends State<AddCourseModal> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  XFile? _image; // Store selected image

  Future<void> _pickImage() async {
    final ImagePicker picker = ImagePicker();
    // Pick an image
    _image = await picker.pickImage(source: ImageSource.gallery);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Add New Course'),
      content: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min, // Allow dialog to be small
            children: [
              GestureDetector(
                onTap: _pickImage,
                child: Container(
                  width: 100,
                  height: 100,
                  color: Colors.grey[200],
                  child: _image == null
                      ? const Icon(Icons.add_a_photo, size: 40)
                      : Image.file(File(_image!.path), fit: BoxFit.cover),
                ),
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: _titleController,
                decoration: const InputDecoration(labelText: 'Title'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a title';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: _descriptionController,
                decoration: const InputDecoration(labelText: 'Description'),
                maxLines: 3,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a description';
                  }
                  return null;
                },
              ),
            ],
          ),
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            if (_formKey.currentState!.validate()) {
              // Handle the submission of the form
              String title = _titleController.text;
              String description = _descriptionController.text;
              // Process the inputs (e.g., send to API or store locally)
              context.read<CourseBloc>().add(
                CreateCourse(
                  course: CreateCourseModel(
                    title: title,
                    description: description,
                    image: _image!.path,
                    price: 10,
                    discount: 0,
                    group_id: 1,
                  ),
                ),
              );
              Navigator.of(context).pop(); // Close the dialog
            }
          },
          child: const Text('Submit'),
        ),
        TextButton(
          onPressed: () {
            Navigator.of(context).pop(); // Close the dialog without submission
          },
          child: const Text('Cancel'),
        ),
      ],
    );
  }
}
