import 'package:flutter/material.dart';

// types def
typedef IntCallback = void Function(int appId);



class AutocompleteWidget extends StatelessWidget {
  final IntCallback onGameSelection;
  final List<String> nameOptions;

  const AutocompleteWidget({super.key,required this.nameOptions, required this.onGameSelection});

  @override
  Widget build(BuildContext context) {

    return Autocomplete<String>(

      optionsBuilder: (TextEditingValue textEditingValue) {
        if (textEditingValue.text == '') {
          return const Iterable<String>.empty();
        }
        return nameOptions.where((String option) => option.contains(textEditingValue.text.toLowerCase()));
      },

      onSelected: (String selection) {
          onGameSelection(nameOptions.indexOf(selection));
      },

      fieldViewBuilder: (BuildContext context, TextEditingController fieldTextEditingController, FocusNode fieldFocusNode, VoidCallback onFieldSubmitted) {
        return SizedBox(
          height: 50,
          child: Center(
            child: TextField(

              controller: fieldTextEditingController,
              focusNode: fieldFocusNode,

              //style: const TextStyle(fontWeight: FontWeight.normal),

              decoration: InputDecoration(

                filled: true,
                fillColor: Colors.white,
                hintText: 'Search Game',
                contentPadding: EdgeInsets.zero,

                prefixIcon: const Icon(Icons.search),
                suffixIcon: IconButton(
                  icon: const Icon(Icons.close),
                  onPressed: () {
                    fieldTextEditingController.clear();
                  },
                ),

                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(100),
                ),
              ),
            ),
          ),
        );
      },

      optionsViewBuilder: (BuildContext context, AutocompleteOnSelected<String> onSelected, Iterable<String> options) {
        return Padding(
          padding: const EdgeInsets.only(top: 10.0),
          child: Align(
            alignment: Alignment.topLeft,

            child: Material(
              borderRadius: BorderRadius.circular(30),

              child: Container(
                width: 280,
                constraints: BoxConstraints(maxHeight: 250),
                color: Colors.transparent,
                child: ListView.builder(
                  padding: EdgeInsets.all(10.0),
                  itemCount: options.length,
                  itemBuilder: (BuildContext context, int index) {
                    final String option =
                    options.elementAt(index);
                    return GestureDetector(
                      onTap: () {
                        onSelected(option);
                      },
                      child: ListTile(

                        title: Text(option),
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
