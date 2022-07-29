import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  final String routeName;
  const Home({Key? key, required this.routeName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0),
      child: DefaultTabController(
        length: 3,
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: PreferredSize(
            preferredSize: const Size(
              double.infinity,
              80,
            ),
            child: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              flexibleSpace: Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).scaffoldBackgroundColor,
                  border: Border(
                    bottom: BorderSide(
                      color: Theme.of(context).colorScheme.primary,
                      width: 0.8,
                    ),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: TabBar(
                            indicatorColor: Theme.of(context).colorScheme.primary,
                            isScrollable: true,
                            labelPadding:
                            const EdgeInsets.only(left: 10, right: 10),
                            tabs: [
                              Padding(
                                padding: const EdgeInsets.only(right: 8),
                                child: Tab(
                                  child: Text(
                                    "My Projects",
                                    style: TextStyle(
                                      color: Theme.of(context).colorScheme.primary,
                                      fontSize: 24,
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 8),
                                child: Tab(
                                  child: Text(
                                    "Download & Share",
                                    style: TextStyle(
                                      color: Theme.of(context).colorScheme.primary,
                                      fontSize: 24,
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 8),
                                child: Tab(
                                  child: Text(
                                    "Export",
                                    style: TextStyle(
                                      color: Theme.of(context).colorScheme.primary,
                                      fontSize: 24,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Align(
                      alignment: Alignment.bottomLeft,
                      child: InkWell(
                        overlayColor: MaterialStateProperty.all(Theme.of(context).hintColor),
                        onTap: () {},
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Row(
                            children: [
                              Icon(
                                Icons.add_circle_outline,
                                size: 24,
                                color: Theme.of(context).colorScheme.primary,
                              ),
                              const SizedBox(
                                width: 8.0,
                              ),
                              Text(
                                "New Folder",
                                style: TextStyle(
                                  color: Theme.of(context).colorScheme.primary,
                                  fontSize: 24,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          body: TabBarView(
            children: [
              Container(
                color: Colors.purple,
                height: double.infinity,
                width: double.infinity,
              ),
              Container(
                color: Colors.white,
                height: double.infinity,
                width: double.infinity,
              ),
              Container(
                color: Colors.yellow,
                height: double.infinity,
                width: double.infinity,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
