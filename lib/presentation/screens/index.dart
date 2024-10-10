import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../presentation.dart';

class IndexScreen extends StatelessWidget {
  final int initialTab;

  const IndexScreen(
      {super.key, required this.indexCallback, this.initialTab = 0});

  final void Function(void Function(int page) Function() useIndexPageNavigator)
      indexCallback;

  static const String routeName = "index";
  static const String routePath = "/";
  static int? lastTab;

  @override
  Widget build(BuildContext context) {
    final ValueNotifier<int> currentIndex =
        ValueNotifier<int>(lastTab ?? initialTab);

    indexCallback(() {
      return (int index) {
        currentIndex.value = index;
        lastTab = index;
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
                          showLogoutConfirmation(context, () {
                            context.read<AuthenticationCubit>().logOut();
                            lastTab = null;
                          });
                        },
                        icon: const Icon(Icons.logout_sharp))
                    : BlocBuilder<AppSettingCubit, AppSettingState>(
                        builder: (context, state) {
                          return IconButton(
                              onPressed: () {
                                context.read<AppSettingCubit>().onChangeTheme(
                                    state.themeMode == ThemeMode.dark
                                        ? ThemeMode.light
                                        : ThemeMode.dark);
                              },
                              icon: Icon(state.themeMode == ThemeMode.dark
                                  ? Icons.light_mode
                                  : Icons.dark_mode));
                        },
                      ),
              ],
            ),
            body: IndexedStack(
              index: index,
              children: screens,
            ),
            bottomNavigationBar: NavigationBar(
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
                currentIndex.value = index;
                lastTab = index;
              },
            ));
      },
    );
  }
}
