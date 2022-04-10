import 'package:flutter/material.dart';
import 'package:responsive_list_view/responsive/responsive_utils.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        title: "ListView",
        debugShowCheckedModeBanner: false,
        home: ListViewPage());
  }
}

class ListViewPage extends StatelessWidget {
  const ListViewPage({Key? key}) : super(key: key);

  @override
  Widget build(final BuildContext context) {
    Size _screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: _appBar(),
      drawer: !ResponsiveUtils.isScreenWeb(context)?_menu():null,
      body: ResponsiveUtils(
        screenWeb: _webView(_screenSize, context),
        screenTablet: _tabletView(_screenSize, context),
        screenMobile: _mobileView(_screenSize, context),
      )
    );
  }

  Widget _webView(Size _screenSize, BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
            flex:
                _screenSize.width > ResponsiveUtils.tabletWidthLimit ? 3 : 4,
            child: _menu()),
        Expanded(
            flex:
                _screenSize.width > ResponsiveUtils.tabletWidthLimit ? 5 : 7,
            child: _listView(context)),
        Expanded(
            flex:
                _screenSize.width > ResponsiveUtils.tabletWidthLimit ? 8 : 10,
            child: _listDetail())
      ],
    );
  }
  Widget _tabletView(Size _screenSize, BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
            flex:
            _screenSize.width > ResponsiveUtils.tabletWidthLimit ? 5 : 7,
            child: _listView(context)),
        Expanded(
            flex:
            _screenSize.width > ResponsiveUtils.tabletWidthLimit ? 8 : 10,
            child: _listDetail())
      ],
    );
  }
  Widget _mobileView(Size _screenSize, BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
            flex:
            _screenSize.width > ResponsiveUtils.tabletWidthLimit ? 5 : 7,
            child: _listView(context)),
      ],
    );
  }

  AppBar _appBar() => AppBar(
        title: const Text('Responsive List View'),
        centerTitle: true,
      );

  Widget _listDetail() => Container(
        alignment: Alignment.center,
        margin: const EdgeInsetsDirectional.only(top: 6, end: 6),
        width: double.infinity,
        height: 400,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 4,
              offset: const Offset(0, 3), // changes position of shadow
            ),
          ],
          color: Colors.amber,
          borderRadius: BorderRadius.circular(6),
        ),
        child: const Text(
          'List Detail',
          style: TextStyle(
              color: Colors.black87, fontWeight: FontWeight.w400, fontSize: 26),
        ),
      );

  Widget _menu() => Container(
        margin: const EdgeInsets.only(top: 6),
        alignment: Alignment.topCenter,
        height: double.infinity,
        width: 230,
        color: const Color(0xff12206a),
        child: const Text(
          'Menu',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      );

  Widget _listView(final BuildContext context) => ListView.builder(
        physics: const AlwaysScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: 10,
        itemBuilder: (_, index) => Container(
          alignment: Alignment.center,
          width: double.infinity,
          margin: const EdgeInsetsDirectional.only(top: 6, end: 6, start: 6),
          height: 150,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6),
              color: const Color(0xee5062c1)),
          child: Text(
            'List Item $index',
            style: const TextStyle(
                color: Colors.white, fontWeight: FontWeight.w400),
          ),
        ),
      );
}
