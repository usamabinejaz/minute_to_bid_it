import 'package:flutter/material.dart';

import '../../util/core.dart';

class MainTemplate extends StatefulWidget {
  // Receives the name of the route from router delegate
  final String routeName;

  const MainTemplate({Key? key, required this.routeName}) : super(key: key);

  @override
  State<MainTemplate> createState() => _MainTemplateState();
}

class _MainTemplateState extends State<MainTemplate> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        title: const Text('Home Page'),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              onTap: () => logout(context),
              child: const Center(
                child: Text(
                  'Log Out ',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
            ),
          )
        ],
      ),
      drawer: Drawer(
        elevation: 1,
        child: ListView.builder(
          itemCount: routeList.length,
          itemBuilder: (context, i) {
            return _navTile(routeList[i]);
          },
        ),
      ),
      body: Center(
        child: RouteHandler().getRouteWidget(widget.routeName),
      ),
    );
  }

  Widget _navTile(SubNavigationRoutes route) {
    return ListTile(
      leading: Icon(
        route.icon,
        color: widget.routeName.contains(route.route.name)
            ? Colors.blue
            : Colors.grey,
      ),
      title: Text(
        route.title,
        style: TextStyle(
          color: widget.routeName.contains(route.route.name)
              ? Colors.blue
              : Colors.grey,
        ),
      ),
      onTap: () {
        AppRouterDelegate().setPathName(route.route.name);
      },
    );
  }
}
