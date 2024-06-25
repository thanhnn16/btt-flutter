import 'package:bongtuyettrang/domain/models/product/product_category.dart';
import 'package:bongtuyettrang/gen/assets.gen.dart';
import 'package:bongtuyettrang/presentation/home/account/account.dart';
import 'package:bongtuyettrang/presentation/home/cart/cart.dart';
import 'package:bongtuyettrang/presentation/home/saved/saved.dart';
import 'package:bongtuyettrang/presentation/home/search/search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'components/product_item.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;

  // mock category list
  final List<ProductCategory> categories = [
    ProductCategory(
        id: '1',
        categoryName: 'Air-Con',
        description: 'Air-Con',
        isDeleted: false,
        createdAt: DateTime.now(),
        updatedAt: DateTime.now()),
    ProductCategory(
        id: '2',
        categoryName: 'Refrigerator',
        description: 'Refrigerator',
        isDeleted: false,
        createdAt: DateTime.now(),
        updatedAt: DateTime.now()),
    ProductCategory(
        id: '3',
        categoryName: 'Washing Machine',
        description: 'Washing Machine',
        isDeleted: false,
        createdAt: DateTime.now(),
        updatedAt: DateTime.now()),
    ProductCategory(
        id: '4',
        categoryName: 'Television',
        description: 'Television',
        isDeleted: false,
        createdAt: DateTime.now(),
        updatedAt: DateTime.now()),
    ProductCategory(
        id: '5',
        categoryName: 'Microwave',
        description: 'Microwave',
        isDeleted: false,
        createdAt: DateTime.now(),
        updatedAt: DateTime.now()),
    ProductCategory(
        id: '6',
        categoryName: 'Fan',
        description: 'Fan',
        isDeleted: false,
        createdAt: DateTime.now(),
        updatedAt: DateTime.now()),
    ProductCategory(
        id: '7',
        categoryName: 'Water Heater',
        description: 'Water Heater',
        isDeleted: false,
        createdAt: DateTime.now(),
        updatedAt: DateTime.now()),
    ProductCategory(
        id: '8',
        categoryName: 'Vacuum Cleaner',
        description: 'Vacuum Cleaner',
        isDeleted: false,
        createdAt: DateTime.now(),
        updatedAt: DateTime.now()),
    ProductCategory(
        id: '9',
        categoryName: 'Air Purifier',
        description: 'Air Purifier',
        isDeleted: false,
        createdAt: DateTime.now(),
        updatedAt: DateTime.now()),
    ProductCategory(
        id: '10',
        categoryName: 'Cooker',
        description: 'Cooker',
        isDeleted: false,
        createdAt: DateTime.now(),
        updatedAt: DateTime.now()),
    ProductCategory(
        id: '11',
        categoryName: 'Water Purifier',
        description: 'Water Purifier',
        isDeleted: false,
        createdAt: DateTime.now(),
        updatedAt: DateTime.now()),
    ProductCategory(
        id: '12',
        categoryName: 'Dishwasher',
        description: 'Dishwasher',
        isDeleted: false,
        createdAt: DateTime.now(),
        updatedAt: DateTime.now()),
    ProductCategory(
        id: '13',
        categoryName: 'Oven',
        description: 'Oven',
        isDeleted: false,
        createdAt: DateTime.now(),
        updatedAt: DateTime.now()),
    ProductCategory(
        id: '14',
        categoryName: 'Blender',
        description: 'Blender',
        isDeleted: false,
        createdAt: DateTime.now(),
        updatedAt: DateTime.now())
  ];

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
                        title: top < 145
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
                                            icon: SvgPicture.asset(
                                              Assets.icons.common.search.path,
                                              height: 24,
                                              width: 24,
                                            )),
                                        IconButton(
                                          onPressed: () {},
                                          icon: SvgPicture.asset(
                                            Assets
                                                .icons.common.notification.path,
                                            height: 24,
                                            width: 24,
                                          ),
                                        )
                                      ],
                                    ),
                                    const SizedBox(height: 4),
                                    SingleChildScrollView(
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
                                              shape: WidgetStatePropertyAll(
                                                RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10.0),
                                                  side: const BorderSide(
                                                    color: Colors.black12,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            child: const Text("All"),
                                          ),
                                          const SizedBox(width: 4),
                                          ...categories
                                              .map(
                                                (category) =>
                                                    ProductCategoryItems(
                                                        category: category),
                                              )
                                              .toList(),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            : null,
                        background: Stack(
                          fit: StackFit.expand,
                          children: [
                            Positioned(
                              top: top > 140 ? 48 : 0,
                              left: 24,
                              right: 24,
                              child: Column(
                                children: [
                                  Row(children: [
                                    Expanded(
                                        child: Text(
                                      '${AppLocalizations.of(context)!.hello}, thanhnn16',
                                      style: Theme.of(context)
                                          .textTheme
                                          .headlineLarge,
                                    )),
                                    IconButton(
                                      onPressed: () {},
                                      icon: SvgPicture.asset(
                                        Assets.icons.common.notification.path,
                                        height: 24,
                                        width: 24,
                                      ),
                                    )
                                  ]),
                                  const SizedBox(height: 4),
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
                                      hintStyle: const WidgetStatePropertyAll(
                                        TextStyle(
                                          fontSize: 14,
                                        ),
                                      ),
                                    )),
                                    IconButton(
                                        onPressed: () {},
                                        icon: SvgPicture.asset(
                                          Assets.icons.common.filter.path,
                                          height: 52,
                                          width: 52,
                                        )),
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
                  collapsedHeight: 96,
                  pinned: true,
                ),
                SliverGrid(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 0.65,
                    ),
                    delegate: SliverChildBuilderDelegate((context, int index) {
                      return ProductItem(
                        productName: 'Product $index',
                        oldPrice: index % 2 == 0 ? 100 : null,
                        price: 100.0 - index,
                        imageUrl: 'https://picsum.photos/200/300?random=$index',
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
            labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
            indicatorColor: Colors.white,
            backgroundColor: Colors.white,
            selectedIndex: selectedIndex,
            shadowColor: Colors.black26,
            height: 64,
            elevation: 8,
            destinations: [
              NavigationDestination(
                icon: SvgPicture.asset(
                  Assets.icons.bottomNav.unselected.home.path,
                  height: 24,
                  width: 24,
                ),
                selectedIcon: SvgPicture.asset(
                  Assets.icons.bottomNav.selected.home.path,
                  height: 24,
                  width: 24,
                ),
                label: AppLocalizations.of(context)!.home,
              ),
              NavigationDestination(
                icon: SvgPicture.asset(
                  Assets.icons.bottomNav.unselected.search.path,
                  height: 24,
                  width: 24,
                ),
                selectedIcon: SvgPicture.asset(
                  Assets.icons.bottomNav.selected.search.path,
                  height: 24,
                  width: 24,
                ),
                label: AppLocalizations.of(context)!.search,
              ),
              NavigationDestination(
                icon: SvgPicture.asset(
                  Assets.icons.bottomNav.unselected.heart.path,
                  height: 24,
                  width: 24,
                ),
                selectedIcon: SvgPicture.asset(
                  Assets.icons.bottomNav.selected.heart.path,
                  height: 24,
                  width: 24,
                ),
                label: AppLocalizations.of(context)!.saved,
              ),
              NavigationDestination(
                icon: SvgPicture.asset(
                  Assets.icons.bottomNav.unselected.cart.path,
                  height: 24,
                  width: 24,
                ),
                selectedIcon: SvgPicture.asset(
                  Assets.icons.bottomNav.selected.cart.path,
                  height: 24,
                  width: 24,
                ),
                label: AppLocalizations.of(context)!.cart,
              ),
              NavigationDestination(
                icon: SvgPicture.asset(
                  Assets.icons.bottomNav.unselected.user.path,
                  height: 24,
                  width: 24,
                ),
                selectedIcon: SvgPicture.asset(
                  Assets.icons.bottomNav.selected.user.path,
                  height: 24,
                  width: 24,
                ),
                label: AppLocalizations.of(context)!.account,
              ),
            ],
          ),
          floatingActionButton: FloatingActionButton.extended(
              onPressed: () {},
              tooltip: AppLocalizations.of(context)!.bookAppointment,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(100),
              ),
              label: Text(AppLocalizations.of(context)!.bookAppointment),
              icon: const Icon(Icons.calendar_month_sharp)),
          floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
          floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
        ),
      ),
    );
  }
}

class ProductCategoryItems extends StatelessWidget {
  const ProductCategoryItems({super.key, required this.category});

  final ProductCategory category;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4.0),
      child: TextButton(
        onPressed: () {
          // TODO: Implement category filter
        },
        style: ButtonStyle(
          backgroundColor: const WidgetStatePropertyAll(
            Colors.white,
          ),
          textStyle: const WidgetStatePropertyAll(
            TextStyle(
              color: Colors.black,
            ),
          ),
          shape: WidgetStatePropertyAll(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
              side: const BorderSide(
                color: Colors.black12,
              ),
            ),
          ),
        ),
        child: Text(category.categoryName),
      ),
    );
  }
}
