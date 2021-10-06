import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class TravelPage extends StatefulWidget {
  const TravelPage({Key? key}) : super(key: key);

  @override
  _TravelPageState createState() => _TravelPageState();
}

class _TravelPageState extends State<TravelPage> with TickerProviderStateMixin {
  final img_url =
      "http://www.happywalagift.com/wp-content/uploads/2015/08/Indian-Flag-Wallpapers-HD-Images-Free-Download.jpg";

  final pic1 =
      "https://www.unciatrails.com/wp-content/uploads/2020/07/Taj2.jpg";
  final pic2 =
      "https://i.pinimg.com/originals/e2/a7/1f/e2a71f9b3c3bb0c1ba90e268b4ae90be.jpg";

  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Vx.purple500,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        leading: VStack([
          VxBox().size(20, 2).white.make(),
          5.heightBox,
          VxBox().size(28, 2).white.make(),
          5.heightBox,
          VxBox().size(15, 2).white.make(),
        ]).pOnly(left: 16, top: 16),
      ),
      body: VStack([
        VxBox(
                child: [
          VxBox()
              .square(100)
              .roundedFull
              .neumorphic(color: Vx.purple500, elevation: 30.0)
              .bgImage(DecorationImage(image: NetworkImage(img_url)))
              .make(),
          "Hi, "
              .richText
              .withTextSpanChildren(["India".textSpan.bold.make()])
              .white
              .xl2
              .make()
              .p8(),
          "Solo Traveller".text.white.make(),
          VxTextField(
            borderType: VxTextFieldBorderType.none,
            borderRadius: 20,
            hint: "Search",
            contentPaddingTop: 13,
            fillColor: Vx.green200.withOpacity(0.3),
            autofocus: false,
            prefixIcon: Icon(
              Icons.search_outlined,
              color: Colors.white,
            ),
          )
              .customTheme(
                  themeData: ThemeData(
                brightness: Brightness.dark,
              ))
              .cornerRadius(10)
              .p16()
        ].column())
            .makeCentered()
            .h32(context),
        ClipRRect(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
          child: VxBox(
              child: VStack([
            TabBar(
              controller: _tabController,
              indicatorColor: Colors.purple,
              indicatorSize: TabBarIndicatorSize.label,
              labelColor: Vx.purple500,
              unselectedLabelColor: Vx.gray400,
              labelPadding: Vx.m16,
              tabs: [
                Icon(Icons.map, size: 30),
                Icon(Icons.pin_drop, size: 30),
                Icon(Icons.restaurant, size: 30),
                Icon(Icons.person, size: 30),
              ],
            ),
            TabBarView(
              controller: _tabController,
              children: ["1", "2", "3", "4"]
                  .map((e) => VStack([
                        "Discover Places in India".text.gray600.xl2.bold.make(),
                        20.heightBox,
                        TravelCard(
                            title: "Taj Mahal",
                            subttle: "Delhi",
                            imageurl: pic1),
                        20.heightBox,
                        TravelCard(
                            title: "Lonavala",
                            subttle: "Maharashtra",
                            imageurl: pic2)
                      ]).p16())
                  .toList(),
            ).expand()
          ])).white.make(),
        ).expand()
      ]),
    );
  }
}

class TravelCard extends StatelessWidget {
  final String title, subttle, imageurl;

  const TravelCard(
      {Key? key,
      required this.title,
      required this.subttle,
      required this.imageurl})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return HStack([
      Image.network(
        imageurl,
        fit: BoxFit.cover,
      ).wh(context.percentWidth * 35, 100).cornerRadius(10),
      20.widthBox,
      VStack(
        [
          title.text.semiBold.make(),
          3.heightBox,
          subttle.text.make().shimmer(),
          5.heightBox,
          [
            VxRating(
              size: 13,
              onRatingUpdate: (value) {},
            ),
            5.heightBox,
            "(100)".text.xs.gray600.make(),
          ].row(),
        ],
        crossAlignment: CrossAxisAlignment.start,
      ).expand()
    ]).cornerRadius(8).backgroundColor(Vx.gray200);
  }
}
