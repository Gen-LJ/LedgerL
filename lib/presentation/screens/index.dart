import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ledger_l/core/core.dart';
import '../presentation.dart';

class IndexScreen extends StatelessWidget {
  const IndexScreen({super.key, required this.hookCallback});
  final void Function(void Function(int page) Function() useIndexPageNavigator)
  hookCallback;

  static const String routeName = "index";
  static const String routePath = "/";

  @override
  Widget build(BuildContext context) {
    final ValueNotifier<int> currentIndex = ValueNotifier<int>(0);

    hookCallback(() {
      return (int page) {
        currentIndex.value = page; // Reset currentIndex to 0
      };
    });

    const List<Widget> screens = [
      HomeScreen(),
      HistoryScreen(),
      ProfileScreen(),
    ];

    final navItems = [
      NavItem(
        color: context.textTheme.bodySmall!.color!,
        icon: Icons.home,
        selectedIcon: Icons.home,
        selectedColor: context.theme.primaryColor,
        label: R.strings.lblHome,
      ),
      NavItem(
        color: context.textTheme.bodySmall!.color!,
        icon: Icons.history_outlined,
        selectedIcon: Icons.history,
        selectedColor: context.theme.primaryColor,
        label: R.strings.lblHistory,
      ),
      NavItem(
        color: context.textTheme.bodySmall!.color!,
        icon: Icons.person_outline,
        selectedIcon: Icons.person,
        selectedColor: context.theme.primaryColor,
        label: R.strings.lblProfile,
      )
    ];

    return ValueListenableBuilder<int>(
      valueListenable: currentIndex,
      builder: (context, index, child) {
        return Scaffold(
            appBar: StyledAppBar(
              actions: [
                IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.notifications_rounded)),
                index == 2
                    ? IconButton(
                        onPressed: () {
                          context.read<AuthenticationCubit>().logOut();
                          inject<NavigationRouter>().useIndexPageNavigator()(0);
                          context.goIndex();
                        },
                        icon: const Icon(Icons.logout_sharp))
                    : IconButton(
                        onPressed: () {}, icon: const Icon(Icons.dark_mode)),
              ],
            ),
            body: IndexedStack(
              index: index,
              children: screens,
            ),
            bottomNavigationBar: NavigationBar(
              indicatorColor: context.theme.primaryColor,
              selectedIndex: index,
              elevation: 0,
              destinations: navItems
                  .map((e) => NavigationDestination(
                        label: e.label,
                        icon: Icon(e.icon),
                        selectedIcon: Icon(e.selectedIcon),
                      ))
                  .toList(),
              onDestinationSelected: (index) {
                currentIndex.value = index; // Update the current index
              },
            ));
      },
    );
  }
}
