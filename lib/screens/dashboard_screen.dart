import 'package:carousel_slider/carousel_slider.dart';
import 'package:designanddio/consts/image_consts.dart';
import 'package:designanddio/widgets/widget_categories.dart';
import 'package:flutter/material.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  final controller = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: ListView(
          children: [
            _imageCarousel(context),
            WidgetCategories(),
          ],
        ),
      ),
    );
  }

  Widget _imageCarousel(BuildContext context) {
    return SizedBox(
        width: MediaQuery.of(context).size.width,
        height: 200,
        child: PageView.builder(
          controller: controller,
          scrollDirection: Axis.horizontal,
          onPageChanged: (index) {
            setState(() {
              index = index % imageUrls.length;
            });
          },
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: Colors.black, width: 5),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.network(
                      imageUrls[index % imageUrls.length],
                      fit: BoxFit.fill,
                    ),
                  )),
            );
          },
        ));
  }
}
