import 'package:bongtuyettrang/presentation/home/account/account.dart';
import 'package:bongtuyettrang/presentation/home/cart/cart.dart';
import 'package:bongtuyettrang/presentation/home/saved/saved.dart';
import 'package:bongtuyettrang/presentation/home/search/search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'components/product_item.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Scaffold(
            backgroundColor: Colors.white,
            body: <Widget>[
              CustomScrollView(
                physics: const BouncingScrollPhysics(),
                slivers: [
                  SliverAppBar(
                    stretch: true,
                    expandedHeight: 140,
                    backgroundColor: Colors.white,
                    flexibleSpace: LayoutBuilder(
                      builder: (context, BoxConstraints constraints) {
                        double top = constraints.biggest.height;
                        return FlexibleSpaceBar(
                          title: top < 140
                              ? Padding(
                                  padding: const EdgeInsets.only(top: 16),
                                  child: Column(
                                    children: [
                                      Row(
                                        children: [
                                          Expanded(
                                            child: Text(
                                              AppLocalizations.of(context)!
                                                  .discover,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .headlineLarge,
                                            ),
                                          ),
                                          IconButton(
                                              onPressed: () {},
                                              icon: const Icon(Icons.search)),
                                          IconButton(
                                              onPressed: () {},
                                              icon: const Icon(
                                                  Icons.notifications_outlined))
                                        ],
                                      ),
                                      const SizedBox(height: 8),
                                      Scrollable(
                                        viewportBuilder: (context, position) {
                                          return SingleChildScrollView(
                                            scrollDirection: Axis.horizontal,
                                            child: Row(
                                              children: [
                                                const SizedBox(width: 16),
                                                TextButton(
                                                  onPressed: () {},
                                                  style: ButtonStyle(
                                                    backgroundColor:
                                                        const WidgetStatePropertyAll(
                                                      Colors.white,
                                                    ),
                                                    textStyle:
                                                        const WidgetStatePropertyAll(
                                                      TextStyle(
                                                        color: Colors.black,
                                                      ),
                                                    ),
                                                    shape:
                                                        WidgetStatePropertyAll(
                                                      RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10.0),
                                                        side: const BorderSide(
                                                          color: Colors.black12,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  child: const Text("All"),
                                                ),
                                                const SizedBox(width: 16),
                                                TextButton(
                                                  onPressed: () {},
                                                  style: ButtonStyle(
                                                    backgroundColor:
                                                        const WidgetStatePropertyAll(
                                                      Colors.white,
                                                    ),
                                                    textStyle:
                                                        const WidgetStatePropertyAll(
                                                      TextStyle(
                                                        color: Colors.black,
                                                      ),
                                                    ),
                                                    shape:
                                                        WidgetStatePropertyAll(
                                                      RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10.0),
                                                        side: const BorderSide(
                                                          color: Colors.black12,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  child: const Text("Air-Con"),
                                                ),
                                              ],
                                            ),
                                          );
                                        },
                                      ),
                                    ],
                                  ),
                                )
                              : null,
                          background: Stack(
                            fit: StackFit.expand,
                            children: [
                              Positioned(
                                top: top > 140 ? 35 : 0,
                                left: 24,
                                right: 24,
                                child: Column(
                                  children: [
                                    Row(children: [
                                      Expanded(
                                          child: Text(
                                        AppLocalizations.of(context)!.discover,
                                        style: Theme.of(context)
                                            .textTheme
                                            .headlineLarge,
                                      ))
                                    ]),
                                    const SizedBox(height: 16),
                                    Row(children: [
                                      Expanded(
                                          child: SearchBar(
                                        shape: WidgetStatePropertyAll(
                                            RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                        )),
                                        elevation:
                                            const WidgetStatePropertyAll(0.0),
                                        side: const WidgetStatePropertyAll(
                                            BorderSide(
                                          color: Colors.black26,
                                        )),
                                        backgroundColor:
                                            const WidgetStatePropertyAll(
                                                Colors.white),
                                        hintText: AppLocalizations.of(context)!
                                            .searchForProducts,
                                      )),
                                      IconButton(
                                          onPressed: () {},
                                          icon: const Icon(Icons.filter_list)),
                                    ]),
                                  ],
                                ),
                              )
                            ],
                          ),
                          centerTitle: false,
                          titlePadding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 8),
                          expandedTitleScale: 1.5,
                          collapseMode: CollapseMode.pin,
                          stretchModes: const [
                            StretchMode.fadeTitle,
                            StretchMode.zoomBackground,
                          ],
                        );
                      },
                    ),
                    collapsedHeight: 78,
                    pinned: true,
                  ),
                  SliverGrid(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 0.65,
                      ),
                      delegate:
                          SliverChildBuilderDelegate((context, int index) {
                        return ProductItem(
                          productName: 'Product $index',
                          oldPrice: index % 2 == 0 ? 100 : null,
                          price: 100.0 - index,
                          imageUrl:
                              'https://picsum.photos/200/300?random=$index',
                          isFavorite: index % 2 == 0,
                        );
                      }, childCount: 20))
                ],
              ),
              const SearchScreen(),
              const SavedScreen(),
              const CartScreen(),
              const AccountScreen()
            ][selectedIndex],
            bottomNavigationBar: NavigationBar(
              onDestinationSelected: (index) {
                setState(() {
                  selectedIndex = index;
                });
              },
              backgroundColor: Colors.white,
              indicatorColor: Colors.white,
              selectedIndex: selectedIndex,
              shadowColor: Colors.black26,
              destinations: [
                NavigationDestination(
                  icon: const Icon(Icons.home_outlined),
                  selectedIcon: const Icon(Icons.home),
                  label: AppLocalizations.of(context)!.home,
                ),
                NavigationDestination(
                  icon: const Icon(Icons.search_outlined),
                  selectedIcon: const Icon(Icons.search_sharp),
                  label: AppLocalizations.of(context)!.search,
                ),
                NavigationDestination(
                  icon: const Icon(Icons.favorite_outline),
                  selectedIcon: const Icon(Icons.favorite),
                  label: AppLocalizations.of(context)!.saved,
                ),
                NavigationDestination(
                  icon: const Icon(Icons.shopping_cart_outlined),
                  selectedIcon: const Icon(Icons.shopping_cart),
                  label: AppLocalizations.of(context)!.cart,
                ),
                NavigationDestination(
                  icon: const Icon(Icons.person_outline),
                  selectedIcon: const Icon(Icons.person),
                  label: AppLocalizations.of(context)!.account,
                ),
              ],
            )),
      ),
    );
  }
}
