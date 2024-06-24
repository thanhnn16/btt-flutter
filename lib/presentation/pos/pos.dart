import 'package:flutter/material.dart';

class PosScreen extends StatefulWidget {
  const PosScreen({super.key});

  @override
  State<PosScreen> createState() => _PosScreenState();
}

class _PosScreenState extends State<PosScreen> {
  List<String> list = [
    'Hot dish',
    'Cold dish',
    'Drink',
    'Dessert',
    'Grill',
    'Fast food',
    'Seafood',
    'Vegetarian',
    'Other'
  ];

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: Row(
        children: [
          Expanded(
            flex: 4,
            child: Scaffold(
              key: _scaffoldKey,
              drawer: const Sidebar(),
              appBar: AppBar(
                  backgroundColor: const Color(0xff188B8A),
                  toolbarHeight: 64,
                  leading: IconButton(
                    onPressed: () {
                      _scaffoldKey.currentState?.openDrawer();
                    },
                    icon: const Icon(
                      Icons.menu,
                      size: 48,
                      color: Colors.white,
                    ),
                  ),
                  title: const Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    'Store 001',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  Icon(
                                    Icons.arrow_drop_down,
                                    color: Colors.white,
                                  ),
                                  Text(
                                    'Online',
                                    style: TextStyle(
                                        color: Colors.white,
                                        backgroundColor: Colors.green),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Icon(Icons.account_circle_outlined,
                                      color: Colors.white),
                                  Text(
                                    'Thanhnn',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  Text(' | ',
                                      style: TextStyle(color: Colors.white)),
                                  Text(
                                    'HCM',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                      Icon(
                        Icons.search_outlined,
                        size: 48,
                        color: Colors.white,
                      ),
                    ],
                  )),
              body: Stack(
                children: [
                  DefaultTabController(
                    length: 5,
                    child: Column(
                      children: [
                        const TabBar(
                          isScrollable: true,
                          tabs: [
                            Tab(text: 'Đơn 1'),
                            Tab(text: 'Đơn 2'),
                            Tab(text: 'Đơn 3'),
                            Tab(text: 'Đơn 4'),
                            Tab(text: 'Đơn 5'),
                          ],
                        ),
                        Expanded(
                          child: TabBarView(
                            children: [
                              _buildOrderListView(),
                              _buildOrderListView(),
                              _buildOrderListView(),
                              _buildOrderListView(),
                              _buildOrderListView(),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  DraggableScrollableSheet(
                    initialChildSize: 0.25,
                    minChildSize: 0.1,
                    maxChildSize: 0.5,
                    builder: (context, scrollController) {
                      return Container(
                        height: 100,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius:
                              BorderRadius.vertical(top: Radius.circular(16)),
                        ),
                        child: SingleChildScrollView(
                          controller: scrollController,
                          child: ClipRRect(
                            borderRadius: const BorderRadius.vertical(
                                top: Radius.circular(16)),
                            child: Column(
                              children: [
                                const Divider(),
                                const ListTile(
                                  title: Text('Tạm tính (3 món)'),
                                  trailing: Text('109,000đ'),
                                ),
                                const ListTile(
                                  title: Text('Thuế'),
                                  trailing: Text('10,900đ'),
                                ),
                                const ListTile(
                                  title: Text('Khuyến mãi'),
                                  trailing: Text('900đ'),
                                ),
                                const ListTile(
                                  title: Text('Tổng cộng'),
                                  trailing: Text('99,000đ'),
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    ElevatedButton(
                                      onPressed: () {},
                                      child: const Text('Thanh toán ví điện tử'),
                                    ),
                                    ElevatedButton(
                                      onPressed: () {},
                                      child: const Text('Thanh toán thẻ'),
                                    ),
                                    ElevatedButton(
                                      onPressed: () {},
                                      child: const Text('Thanh toán'),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: Scaffold(
              backgroundColor: const Color(0xffE0E6E9),
              appBar: AppBar(
                  toolbarHeight: 64,
                  backgroundColor: const Color(0xffE0E6E9),
                  title: Row(
                    children: [
                      const Expanded(
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Select product/food',
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 18)),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: SearchBar(
                          hintText: 'Search for food, drink...',
                          leading: const Icon(Icons.search_outlined),
                          shape: WidgetStateProperty.all(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0),
                            side: const BorderSide(color: Color(0xff9F9F9F)),
                          )),
                          backgroundColor:
                              WidgetStateProperty.all(const Color(0xffF6F6F6)),
                          elevation: WidgetStateProperty.all(0),
                        ),
                      ),
                    ],
                  )),
              body: Center(
                child: GridTile(
                  child: GridView.builder(
                    itemCount: 30,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      childAspectRatio: 1.0,
                    ),
                    itemBuilder: (context, index) {
                      return Container(
                        margin: const EdgeInsets.all(8.0),
                        decoration: BoxDecoration(
                          color: const Color(0xffFAFAFA),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: Center(
                          child: Text('Product $index'),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: ListView.builder(
                itemCount: list.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(list[index]),
                    tileColor: Colors.white,
                    titleAlignment: ListTileTitleAlignment.center,
                  );
                }),
          ),
        ],
      ),
    );
  }
}

class Sidebar extends StatelessWidget {
  const Sidebar({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: 120,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.zero),
      ),
      backgroundColor: Colors.white,
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.black, // Màu chủ đạo của ứng dụng
            ),
            child: Center(
              child: Column(
                children: [
                  Icon(Icons.money_outlined, color: Colors.white, size: 56),
                  Text(
                    'Tiền Mặt',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                    ),
                  ),
                ],
              ),
            ),
          ),
          IconButton(
            style: ButtonStyle(
              fixedSize: WidgetStateProperty.all<Size>(const Size(56, 94)),
              backgroundColor: WidgetStateProperty.all<Color>(Colors.white),
              shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
            icon: const Icon(Icons.add, size: 18, color: Color(0xff0084CC)),
            onPressed: () {
              // Xử lý khi nhấn vào mục "Thêm"
            },
          ),
          IconButton(
            icon: const Icon(Icons.message),
            onPressed: () {
              // Xử lý khi nhấn vào mục "Tin nhắn"
            },
          ),
          IconButton(
            icon: const Icon(Icons.bar_chart),
            onPressed: () {
              // Xử lý khi nhấn vào mục "Thống kê"
            },
          ),
          IconButton(
            icon: const Icon(Icons.notifications),
            onPressed: () {
              // Xử lý khi nhấn vào mục "Thông báo"
            },
          ),
          const Divider(), // Thêm đường phân cách
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              // Xử lý khi nhấn vào mục "Cài đặt"
            },
          ),
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              // Xử lý khi nhấn vào mục "Đăng xuất"
            },
          ),
        ],
      ),
    );
  }
}

Widget _buildOrderListView() {
  return ListView.builder(
    itemCount: 10,
    itemBuilder: (context, index) {
      return ListTile(
        title: Text('Category $index'),
      );
    },
  );
}
