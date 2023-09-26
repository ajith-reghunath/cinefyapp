import 'package:cinefy/core/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../application/drop_down_bloc/drop_down_bloc.dart';

// ignore: must_be_immutable
class MultiSelectDropDownCheckBox extends StatelessWidget {
  MultiSelectDropDownCheckBox(
      {super.key,
      required this.items,
      required this.buttonText,
      required this.dropBoxTitle,
      required this.selectedItemsList});
  List<String> selectedItem = [];
  List<String> items;
  String buttonText;
  String dropBoxTitle;
  List<dynamic> selectedItemsList;

  void showMultiSelect(BuildContext context) async {
    await showDialog(
        context: context,
        builder: (context) => MultiSelect(
              items: items,
              dropBoxTitle: dropBoxTitle,
              selectedItemsList: selectedItemsList,
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextButton(
          onPressed: () {
            showMultiSelect(context);
          },
          child: Text(
            buttonText,
            style: const TextStyle(color: accentColor),
          ),
        )
      ],
    );
  }
}

// ignore: must_be_immutable
class MultiSelect extends StatelessWidget {
  String dropBoxTitle;
  final List<String> items;
  List<dynamic> selectedItemsList;

  MultiSelect(
      {super.key,
      required this.items,
      required this.dropBoxTitle,
      required this.selectedItemsList});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DropDownBloc, DropDownState>(
      builder: (context, state) {
        return AlertDialog(
          title: Center(
              child: Text(
            dropBoxTitle,
            style: const TextStyle(fontFamily: 'PoppinsMedium'),
          )),
          content: SingleChildScrollView(
            child: ListBody(
              children: items
                  .map((item) => CheckboxListTile(
                      value: selectedItemsList.contains(item),
                      title: Text(item),
                      activeColor: accentColor,
                      onChanged: (isChecked) {
                        isChecked!
                            ? context.read<DropDownBloc>().add(Selected(
                                itemValue: item,
                                listOfValues: selectedItemsList))
                            : context.read<DropDownBloc>().add(DeSelected(
                                itemValue: item,
                                listOfValues: selectedItemsList));
                      }))
                  .toList(),
            ),
          ),
          actions: [
            TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('Continue',
                    style: TextStyle(
                        fontFamily: 'PoppinsMedium', color: accentColor))),
          ],
        );
      },
    );
  }
}

// ignore: must_be_immutable

