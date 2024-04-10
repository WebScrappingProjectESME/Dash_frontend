// Libs
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

// Pages
import 'package:main_project/components/layout_component.dart ';
import 'package:main_project/components/layout_component_header.dart';

// Type
import 'package:main_project/types/games_data.dart';



// Code

class GalleryComponent extends StatefulWidget {
  final GameData gameData;

  const GalleryComponent({super.key, required this.gameData});

  @override
  State<GalleryComponent> createState() => _GalleryComponentState();
}

class _GalleryComponentState extends State<GalleryComponent> with TickerProviderStateMixin{
  late PageController _pageViewController;
  late TabController _tabController;
  int _currentPageIndex = 0;

  @override
  void initState() {
    super.initState();
    _pageViewController = PageController(initialPage: 0,keepPage: false);
    _tabController = TabController(length: 5, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _pageViewController.dispose();
    _tabController.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return LayoutComponent(
        header: LayoutComponentHeader(
          size: 40,
          icon: Icons.bubble_chart,
          iconColor: Colors.blueAccent,
          iconColorBg: const Color(0xff004862).withAlpha(80),
          text: widget.gameData.name,
          fontWeight: FontWeight.bold,
        ),

        child: Stack(
          alignment: Alignment.bottomCenter,

          children: [
            PageView(
              controller: _pageViewController,
              onPageChanged: _handlePageViewChanged,
              children: widget.gameData.screenshotUrl.map(
                      (url) => ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image(
                            image: Image.network(url).image,
                            width: double.maxFinite,
                            fit: BoxFit.fitWidth,
                          )
                      )
              ).toList(),
            ),

            PageIndicator(
              tabController: _tabController,
              currentPageIndex: _currentPageIndex,
              tabLength: widget.gameData.screenshotUrl.length,
              onUpdateCurrentPageIndex: _updateCurrentPageIndex,
              isOnDesktopFormat: _isOnDesktopFormat
            )
          ],
        )
    );
  }

  void _handlePageViewChanged(int currentPageIndex){
    if(!_isOnDesktopFormat) {
      return;
    }
    _tabController.index = currentPageIndex;
    setState(() {
      _currentPageIndex = currentPageIndex;
    });
  }

  void _updateCurrentPageIndex(int index){
    _tabController.index = index;
    _pageViewController.animateToPage(
        index,
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOut
    );
  }

  bool get _isOnDesktopFormat{
    if (kIsWeb) {
      return true;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.macOS:
      case TargetPlatform.linux:
      case TargetPlatform.windows:
        return true;
      case TargetPlatform.android:
      case TargetPlatform.iOS:
      case TargetPlatform.fuchsia:
        return false;
    }
  }
}


class PageIndicator extends StatelessWidget {
  int currentPageIndex;
  final int tabLength;
  final TabController tabController;
  final void Function(int) onUpdateCurrentPageIndex;
  final bool isOnDesktopFormat;

  PageIndicator({
    super.key,
    required this.tabController,
    required this.currentPageIndex,
    required this.tabLength,
    required this.onUpdateCurrentPageIndex,
    required this.isOnDesktopFormat,
  });

  @override
  Widget build(BuildContext context) {
    if(!isOnDesktopFormat){
      return const SizedBox.shrink();
    }
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(100)
            ),
            child: IconButton(
              color: Colors.white,
              splashRadius: 16,
              padding: EdgeInsets.zero,
              onPressed: () {
                if (currentPageIndex == 0){
                  currentPageIndex = tabLength;
                }
                onUpdateCurrentPageIndex(currentPageIndex - 1);
              },
              icon: const Icon(
                  Icons.arrow_left_rounded,
                  size: 32
              ),
            ),
          ),

          Container(
            margin: const EdgeInsets.symmetric(horizontal: 10),
            padding: const EdgeInsets.symmetric(horizontal: 10),
            height: 40,
            decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(100)
            ),
            child: TabPageSelector(
              controller: tabController,
              color: Colors.grey[900],
              selectedColor: Colors.white,
            ),
          ),

          Container(
            decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(100)
            ),
            child: IconButton(
              color: Colors.white,
              splashRadius: 16,
              padding: EdgeInsets.zero,
              onPressed: () {
                if (currentPageIndex == tabLength-1){
                  currentPageIndex = -1;
                }
                onUpdateCurrentPageIndex(currentPageIndex + 1);
              },
              icon: const Icon(
                  Icons.arrow_right_rounded,
                  size: 32
              ),
            ),
          ),
        ],
      ),
    );
  }
}



