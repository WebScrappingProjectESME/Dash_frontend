import 'dart:ui';
import 'package:flutter/material.dart';



class HeaderSearchBar extends StatelessWidget {
  final SearchController _searchController = SearchController();

   HeaderSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(60),

      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 30, sigmaY: 30),

        child: SearchAnchor(

          viewConstraints: const BoxConstraints(maxHeight: 310,maxWidth: 350),
          searchController: _searchController,

          builder: (BuildContext context, SearchController controller) {
            return SearchBar(
              backgroundColor: const MaterialStatePropertyAll(Colors.white30),
              overlayColor: const MaterialStatePropertyAll(Colors.black26),

              side: const MaterialStatePropertyAll(BorderSide(color: Colors.black,width: 1.5)),
              elevation: const MaterialStatePropertyAll(0),

              constraints: const BoxConstraints(maxWidth: 350,minHeight: 40),

              leading: const Icon(Icons.search, color: Colors.black, size: 25,),
              onTap: () {
                _searchController.openView();
              },

              hintText: "Search ...",
              hintStyle: const MaterialStatePropertyAll(
                  TextStyle(
                      fontSize: 19,
                      fontWeight: FontWeight.normal,
                      color: Colors.black
                  )
              ),
            );
          },

          suggestionsBuilder: (BuildContext context, SearchController controller) {
            final keyword = controller.value.text;

            return ["EldenRing","Dota 2","City Skyline 2","FrostPunk","Minecraft"]
                .where((element) => element.toLowerCase().startsWith(keyword.toLowerCase()))
                .map((item) => ListTile(
                    title: Text(item),
                    onTap: () {() {
                      controller.closeView(item);
                      FocusScope.of(context).unfocus();
                    };
                    },
                  ));
                },

        ),
      ),
    );
  }
}
