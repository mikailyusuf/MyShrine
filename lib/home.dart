import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_web/model/product.dart';
import 'package:flutter_web/model/products_repository.dart';
import 'package:intl/intl.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SHRINE'),
        leading: IconButton(
          icon: Icon(
            Icons.menu,
            semanticLabel: 'menu',
          ),
          onPressed: () {
            print('Menu Button');
          },
        ),
        actions: [
          IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
                print('Search Button');
              }),
          IconButton(
              icon: Icon(
                Icons.tune,
                semanticLabel: 'filter',
              ),
              onPressed: () {
                print('Tune  Button');
              })
        ],
      ),
      body: GridView.count(
        crossAxisCount: 2,
        padding: EdgeInsets.all(16.0),
        childAspectRatio: 8.0 / 9.0,
        children: _buildGridCards(context),
      ),
      resizeToAvoidBottomInset: false,
    );
  }


  List<Card> _buildGridCards(BuildContext context) {
    List<Product> products = ProductsRepository.loadProducts(Category.all);

    if (products == null || products.isEmpty) {
      return const <Card>[];
    }

    final ThemeData theme = Theme.of(context);
    final NumberFormat formatter = NumberFormat.simpleCurrency(
        locale: Localizations.localeOf(context).toString());

    return products.map((product) {
      return Card(
        clipBehavior: Clip.antiAlias,
        // TODO: Adjust card heights (103)
        child: Column(
          // TODO: Center items on the card (103)
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            AspectRatio(
              aspectRatio: 18 / 11,
              child: Image.asset(
                product.assetName,
                package: product.assetPackage,
                // TODO: Adjust the box size (102)
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.fromLTRB(16.0, 12.0, 16.0, 8.0),
                child: Column(
                  // TODO: Align labels to the bottom and center (103)
                  crossAxisAlignment: CrossAxisAlignment.start,
                  // TODO: Change innermost Column (103)
                  children: <Widget>[
                    // TODO: Handle overflowing labels (103)
                    Text(
                      product.name,
                      style: theme.textTheme.headline6,
                      maxLines: 1,
                    ),
                    SizedBox(height: 8.0),
                    Text(
                      formatter.format(product.price),
                      style: theme.textTheme.subtitle2,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    }).toList();
  }










//   List<Card> _buildCards(int count) {
//
//     List<Product> products = ProductsRepository.loadProducts(category.all);
//
//     if(products == null || products.isEmpty){
//       return const <Card>[];
//     }
//
//     final ThemeData theme = Theme.of(context);
//     final NumberFormat formatter = NumberFormat.simpleCurrency(
//         locale: Localizations.localeOf(context).toString());
//
//     return products.map((products){
// return Card(
//
// )
//     });
//
//     List<Card> cards = List.generate(
//         count,
//         (index) => Card(
//             clipBehavior: Clip.antiAlias,
//             child:
//                 Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
//               Padding(
//                 padding: EdgeInsets.only(top: 8.0),
//                 child: AspectRatio(
//                     aspectRatio: 18.0 / 11.0,
//                     child: Image.asset('assets/images/instagram.jpeg')),
//               ),
//               Padding(
//                 padding: EdgeInsets.fromLTRB(16.0, 12.0, 16.0, 8.0),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text('Title'),
//                     SizedBox(
//                       height: 8.0,
//                     ),
//                     Text('Secondary Text')
//                   ],
//                 ),
//               )
//             ])));
//     return cards;
//   }
}
