import 'package:bongtuyettrang/domain/models/product/product_category.dart';
import 'package:bongtuyettrang/gen/assets.gen.dart';
import 'package:bongtuyettrang/presentation/gemini/gemini.dart';
import 'package:bongtuyettrang/presentation/home/account/account.dart';
import 'package:bongtuyettrang/presentation/home/notification/notification.dart';
import 'package:bongtuyettrang/presentation/home/shop/shop.dart';
import 'package:flutter/material.dart';
import 'package:flutter_carousel_widget/flutter_carousel_widget.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../service/appointment/book_appointment.dart';
import '../appointment/appointment.dart';
import 'components/product_item.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;

  final fabKey = GlobalKey();

  // mock category list
  final List<ProductCategory> categories = [
    ProductCategory(
        categoryName: 'All', id: '', description: '', isDeleted: false),
    ProductCategory(
        categoryName: 'Electronics', id: '', description: '', isDeleted: false),
    ProductCategory(
        categoryName: 'Fashion', id: '', description: '', isDeleted: false),
    ProductCategory(
        categoryName: 'Home & Kitchen',
        id: '',
        description: '',
        isDeleted: false),
  ];

  final List<String> bannerImages = [
    Assets.images.banner.banner1.path,
    Assets.images.banner.banner2.path,
    Assets.images.banner.banner3.path,
    Assets.images.banner.banner4.path,
  ];

  final List<String> serviceImages = [
    Assets.images.service.suaChua.path,
    Assets.images.service.thaoLap.path,
    Assets.images.service.veSinh.path,
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
                      bool isExpanded = top >
                          145; // Kiểm tra xem AppBar có được mở rộng hay không

                      return FlexibleSpaceBar(
                        title: isExpanded
                            ? null // Ẩn tiêu đề khi AppBar được mở rộng
                            : Padding(
                                padding: const EdgeInsets.only(top: 32),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  // Canh giữa các phần tử trong Row
                                  children: [
                                    Text(
                                      AppLocalizations.of(context)!.discover,
                                      style: Theme.of(context)
                                          .textTheme
                                          .headlineLarge,
                                    ),
                                    Row(
                                      children: [
                                        IconButton(
                                          onPressed: () {
                                            // Xử lý sự kiện khi nhấn nút tìm kiếm
                                          },
                                          icon: SvgPicture.asset(
                                            Assets.icons.common.search.path,
                                            height: 24,
                                            width: 24,
                                          ),
                                        ),
                                        IconButton(
                                          onPressed: () {},
                                          icon: SvgPicture.asset(
                                            Assets.icons.common.cart.path,
                                            height: 24,
                                            width: 24,
                                          ),
                                        ),
                                        IconButton(
                                          onPressed: () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    const NotificationScreen(),
                                              ),
                                            );
                                          },
                                          icon: SvgPicture.asset(
                                            Assets
                                                .icons.common.notification.path,
                                            height: 24,
                                            width: 24,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                        background: Stack(
                          fit: StackFit.expand,
                          children: [
                            Positioned(
                              top: top > 140 ? 48 : 0,
                              left: 24,
                              right: 24,
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    // Canh giữa các phần tử trong Row
                                    children: [
                                      Expanded(
                                        child: Text(
                                          '${AppLocalizations.of(context)!.hello}, thanhnn16',
                                          style: Theme.of(context)
                                              .textTheme
                                              .headlineLarge,
                                          overflow: TextOverflow
                                              .ellipsis, // Thêm thuộc tính này để xử lý trường hợp văn bản quá dài
                                        ),
                                      ),
                                      IconButton(
                                        onPressed: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  const NotificationScreen(),
                                            ),
                                          );
                                        },
                                        icon: SvgPicture.asset(
                                          Assets.icons.common.notification.path,
                                          height: 24,
                                          width: 24,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 4),
                                  Row(
                                    children: [
                                      Expanded(
                                        child: SearchBar(
                                          shape: WidgetStatePropertyAll(
                                            RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10.0),
                                            ),
                                          ),
                                          elevation:
                                              const WidgetStatePropertyAll(0.0),
                                          side: const WidgetStatePropertyAll(
                                            BorderSide(
                                              color: Colors.black26,
                                            ),
                                          ),
                                          backgroundColor:
                                              const WidgetStatePropertyAll(
                                            Colors.white,
                                          ),
                                          hintText:
                                              AppLocalizations.of(context)!
                                                  .searchForProducts,
                                          hintStyle:
                                              const WidgetStatePropertyAll(
                                            TextStyle(
                                              fontSize: 14,
                                            ),
                                          ),
                                        ),
                                      ),
                                      IconButton(
                                        onPressed: () {
                                          showModalBottomSheet(
                                            context: context,
                                            showDragHandle: true,
                                            useSafeArea: true,
                                            builder: (context) {
                                              return const FilterSheet();
                                            },
                                          );
                                        },
                                        icon: SvgPicture.asset(
                                          Assets.icons.common.filter.path,
                                          height: 52,
                                          width: 52,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        centerTitle: false,
                        titlePadding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 8),
                        expandedTitleScale: 1.3,
                        collapseMode: CollapseMode.pin,
                        stretchModes: const [
                          StretchMode.fadeTitle,
                          StretchMode.zoomBackground,
                        ],
                      );
                    },
                  ),
                  collapsedHeight: 56,
                  pinned: true,
                ),
                SliverList(
                  delegate: SliverChildListDelegate([
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 8.0, horizontal: 16),
                      child: Column(
                        children: [
                          Stack(
                            children: [
                              FlutterCarousel(
                                options: CarouselOptions(
                                  height: 160.0,
                                  showIndicator: false,
                                  enableInfiniteScroll: true,
                                  autoPlay: true,
                                  autoPlayInterval: const Duration(seconds: 3),
                                  autoPlayAnimationDuration:
                                      const Duration(milliseconds: 800),
                                  autoPlayCurve: Curves.fastOutSlowIn,
                                  enlargeStrategy:
                                      CenterPageEnlargeStrategy.scale,
                                  aspectRatio: 16 / 9,
                                  enlargeCenterPage: true,
                                  slideIndicator: const CircularSlideIndicator(
                                    itemSpacing: 16,
                                  ),
                                ),
                                items: bannerImages.map((i) {
                                  return Builder(
                                    builder: (BuildContext context) {
                                      return Container(
                                        width: double.infinity,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            image: DecorationImage(
                                                image: AssetImage(i),
                                                fit: BoxFit.cover)),
                                      );
                                    },
                                  );
                                }).toList(),
                              ),
                            ],
                          ),
                          const SizedBox(height: 24),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                AppLocalizations.of(context)!.topProducts,
                                style:
                                    Theme.of(context).textTheme.headlineMedium,
                              ),
                              TextButton(
                                onPressed: () {},
                                child: Text(
                                  AppLocalizations.of(context)!.seeMore,
                                  style:
                                      Theme.of(context).textTheme.headlineSmall,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 16),
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            padding: EdgeInsets.zero,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: categories
                                  .map((category) => ProductCategoryItems(
                                        category: category,
                                      ))
                                  .toList(),
                            ),
                          ),
                          const SizedBox(height: 8),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                AppLocalizations.of(context)!.topServices,
                                style:
                                    Theme.of(context).textTheme.headlineMedium,
                              ),
                              TextButton(
                                onPressed: () {},
                                child: Text(
                                  AppLocalizations.of(context)!.seeMore,
                                  style:
                                      Theme.of(context).textTheme.headlineSmall,
                                ),
                              ),
                            ],
                          ),
                          Column(
                            children: serviceImages
                                .map((image) => Padding(
                                      padding:
                                          const EdgeInsets.only(bottom: 16.0),
                                      child: Container(
                                        height: 120,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          image: DecorationImage(
                                            image: AssetImage(image),
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                    ))
                                .toList(),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                AppLocalizations.of(context)!.newArrivals,
                                style:
                                    Theme.of(context).textTheme.headlineMedium,
                              ),
                              TextButton(
                                onPressed: () {},
                                child: Text(
                                  AppLocalizations.of(context)!.seeMore,
                                  style:
                                      Theme.of(context).textTheme.headlineSmall,
                                ),
                              ),
                            ],
                          ),
                          Column(
                            children: List.generate(
                                8,
                                (index) => ProductItem(
                                      productName: 'Product $index',
                                      oldPrice: index % 2 == 0 ? 100 : null,
                                      price: 100.0 - index,
                                      imageUrl:
                                          'https://picsum.photos/200/300?random=$index',
                                      isFavorite: index % 2 == 0,
                                    )),
                          ),
                        ],
                      ),
                    ),
                  ]),
                ),
              ],
            ),
            const ShopScreen(),
            const AppointmentScreen(),
            const AccountScreen()
          ][selectedIndex],
          bottomNavigationBar: NavigationBar(
            onDestinationSelected: (index) {
              setState(() {
                selectedIndex = index;
              });
            },
            labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
            indicatorColor: const Color(0xffF3F4F6),
            overlayColor: const WidgetStatePropertyAll(Color(0xffF3F4F6)),
            indicatorShape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(100.0)),
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
                  Assets.icons.bottomNav.unselected.shop.path,
                  height: 24,
                  width: 24,
                ),
                selectedIcon: SvgPicture.asset(
                  Assets.icons.bottomNav.selected.shop.path,
                  height: 24,
                  width: 24,
                ),
                label: AppLocalizations.of(context)!.search,
              ),
              NavigationDestination(
                icon: SvgPicture.asset(
                  Assets.icons.bottomNav.unselected.appointment.path,
                  height: 24,
                  width: 24,
                ),
                selectedIcon: SvgPicture.asset(
                  Assets.icons.bottomNav.selected.appointment.path,
                  height: 24,
                  width: 24,
                ),
                label: AppLocalizations.of(context)!.bookAppointment,
              ),
              NavigationDestination(
                icon: SvgPicture.asset(
                  Assets.icons.bottomNav.unselected.profile.path,
                  height: 24,
                  width: 24,
                ),
                selectedIcon: SvgPicture.asset(
                  Assets.icons.bottomNav.selected.profile.path,
                  height: 24,
                  width: 24,
                ),
                label: AppLocalizations.of(context)!.account,
              ),
            ],
          ),
          floatingActionButton: FloatingActionButton.extended(
              key: fabKey,
              onPressed: () {
                final RenderBox renderBox =
                    fabKey.currentContext!.findRenderObject() as RenderBox;
                final position = renderBox.localToGlobal(Offset.zero);
                showMenu(
                  context: context,
                  position: RelativeRect.fromLTRB(
                    position.dx,
                    position.dy - renderBox.size.height * 2,
                    position.dx + renderBox.size.width,
                    position.dy,
                  ),
                  popUpAnimationStyle: AnimationStyle(
                      duration: const Duration(milliseconds: 200),
                      curve: Curves.easeInOut),
                  color: Colors.white,
                  items: [
                    PopupMenuItem(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const BookAppointmentScreen()));
                      },
                      child: Row(
                        children: [
                          const Icon(Icons.calendar_today),
                          const SizedBox(width: 8),
                          Text(
                            AppLocalizations.of(context)!.bookNow,
                          ),
                        ],
                      ),
                    ),
                    PopupMenuItem(
                      value: 1,
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const GeminiChatScreen()));
                      },
                      child: Row(
                        children: [
                          const Icon(Icons.support_agent_sharp),
                          const SizedBox(width: 8),
                          Text(
                            AppLocalizations.of(context)!.customerService,
                          )
                        ],
                      ),
                    ),
                  ],
                );
              },
              tooltip: AppLocalizations.of(context)!.bookAppointment,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(100)),
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
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: SizedBox(
        width: 64,
        child: Column(
          children: [
            Container(
              width: 62,
              height: 62,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Colors.grey[200],
                // image: DecorationImage(
                //   image: AssetImage(Assets.images.category.electronics.path),
                //   fit: BoxFit.cover,
                // ),
              ),
            ),
            const SizedBox(height: 8),
            Text(
              category.categoryName,
              softWrap: true,
              style: const TextStyle(
                fontSize: 12,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class FilterSheet extends StatelessWidget {
  const FilterSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
        initialChildSize: 0.6,
        minChildSize: 0.1,
        maxChildSize: 0.6,
        builder: (context, scrollController) {
          return SingleChildScrollView(
            controller: scrollController,
            child: SizedBox(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  children: [
                    const SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          onPressed: () {},
                          icon: SvgPicture.asset(
                            Assets.icons.common.filter.path,
                            height: 24,
                            width: 24,
                          ),
                        ),
                        Text(
                          AppLocalizations.of(context)!.filter,
                          style: Theme.of(context).textTheme.headlineMedium,
                        ),
                        IconButton(
                            onPressed: () {}, icon: const Icon(Icons.close)),
                      ],
                    ),
                    const SizedBox(height: 16),
                    const Divider(),
                    const SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          // TODO
                          // AppLocalizations.of(context)!.priceRange,
                          'Price Range',
                          style: Theme.of(context).textTheme.headlineSmall,
                        ),
                        Text(
                          '\$0 - \$100',
                          style: Theme.of(context).textTheme.headlineSmall,
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    const Divider(),
                    const SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          //  TODO
                          // AppLocalizations.of(context)!.rating,
                          'Rating',
                          style: Theme.of(context).textTheme.headlineSmall,
                        ),
                        Text(
                          '4.5',
                          style: Theme.of(context).textTheme.headlineSmall,
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    const Divider(),
                    const SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          // TODO
                          // AppLocalizations.of(context)!.brand,
                          'Brand',
                          style: Theme.of(context).textTheme.headlineSmall,
                        ),
                        Text(
                          'Samsung',
                          style: Theme.of(context).textTheme.headlineSmall,
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    const Divider(),
                    const SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          // TODO:
                          // AppLocalizations.of(context)!.color,
                          'Color',
                          style: Theme.of(context).textTheme.headlineSmall,
                        ),
                        Text(
                          'Black',
                          style: Theme.of(context).textTheme.headlineSmall,
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    const Divider(),
                    const SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          // TODO
                          // AppLocalizations.of(context)!.size,
                          'Size',
                          style: Theme.of(context).textTheme.headlineSmall,
                        ),
                        Text(
                          'Large',
                          style: Theme.of(context).textTheme.headlineSmall,
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    const Divider(),
                    const SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          AppLocalizations.of(context)!.clearAll,
                          style: Theme.of(context).textTheme.headlineSmall,
                        ),
                        Text(
                          AppLocalizations.of(context)!.apply,
                          style: Theme.of(context).textTheme.headlineSmall,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
