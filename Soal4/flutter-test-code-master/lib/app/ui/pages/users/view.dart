import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:refactory_flutter_test/app/infrastructures/app_component.dart';
import 'package:refactory_flutter_test/app/ui/pages/users/controller.dart';

class UsersPage extends View {
  UsersPage({Key key}) : super(key: key);
  @override
  _UsersPageState createState() => new _UsersPageState(
      AppComponent.getInjector().getDependency<UsersController>());
}

class _UsersPageState extends ViewState<UsersPage, UsersController> {
  _UsersPageState(UsersController controller) : super(controller);

  @override
  Widget buildPage() {
    return Scaffold(
      key: globalKey,
      body: SafeArea(
        child: Column(
          children: [
            Text(controller.items.length.toString()),
            ListView.builder(
              itemCount: controller.items.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                final item = controller.items[index];
                return ListTile(title: item.buildContent(context));
              },
            ),
          ],
        ),
      ),
    );
  }
}
