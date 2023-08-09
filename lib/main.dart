import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:personal_project_one/screens/settings_screen.dart';
import 'package:personal_project_one/screens/toDo_screen.dart';
import 'package:personal_project_one/screens/transactions_screen.dart';
import 'package:personal_project_one/theme/theme_constant.dart';
import 'package:personal_project_one/providers/theme_manager.dart';
import 'package:personal_project_one/widgets/custom_floating_actionButton.dart';

void main() {
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(themeProvider);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: ref.read(themeProvider.notifier).themeMode,
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends ConsumerStatefulWidget {
  const MyHomePage({super.key});

  @override
  ConsumerState<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends ConsumerState<MyHomePage> {
  final List<Map<String, dynamic>> _pages = [
    {'page': const ToDoScreen(), 'title': 'ToDo'},
    {'page': const TransactionsScreen(), 'title': 'Transactions'},
    {'page': const SettingsScreen(), 'title': 'Settings'}
  ];

  int _pageIndex = 0;
  void _selectedPage(
    int index,
  ) {
    setState(() {
      _pageIndex = index;
    });
  }

// Size.fromHeight(deviceSize.height * 0.070)
// _pages[_pageIndex]['page']
  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Theme.of(context).canvasColor,
      appBar: AppBar(
          backgroundColor: Theme.of(context).primaryColor,
          title: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Hisaab-Kitaab',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Theme.of(context).textTheme.displayLarge!.color,
                fontSize: deviceSize.height * 0.025,
              ),
            ),
          ),
          bottom: PreferredSize(
            preferredSize: Size.square(deviceSize.height * 0.070),
            child: SizedBox(
              height: deviceSize.height * 0.1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  AnimatedSize(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeIn,
                    child: TextButton.icon(
                      onPressed: () => _selectedPage(0),
                      label: Text(
                        'ToDo',
                        style: TextStyle(
                          fontSize: _pageIndex == 0
                              ? deviceSize.height * 0.015
                              : deviceSize.height * 0.01,
                          color: _pageIndex == 0
                              ? Colors.blueAccent
                              : Theme.of(context).textTheme.displayLarge!.color,
                        ),
                      ),
                      icon: Icon(
                        Icons.check_box_outlined,
                        color: _pageIndex == 0
                            ? Colors.blueAccent
                            : Theme.of(context).textTheme.displayLarge!.color,
                      ),
                    ),
                  ),
                  AnimatedSize(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeIn,
                    child: TextButton.icon(
                      onPressed: () => _selectedPage(1),
                      label: Text(
                        'Transactions',
                        style: TextStyle(
                          fontSize: _pageIndex == 1
                              ? deviceSize.height * 0.015
                              : deviceSize.height * 0.01,
                          color: _pageIndex == 1
                              ? Colors.blueAccent
                              : Theme.of(context).textTheme.displayLarge!.color,
                        ),
                      ),
                      icon: Icon(
                        Icons.attach_money_outlined,
                        color: _pageIndex == 1
                            ? Colors.blueAccent
                            : Theme.of(context).textTheme.displayLarge!.color,
                      ),
                    ),
                  ),
                  AnimatedSize(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeIn,
                    child: TextButton.icon(
                      onPressed: () => _selectedPage(2),
                      label: Text(
                        'Settings',
                        style: TextStyle(
                          fontSize: _pageIndex == 2
                              ? deviceSize.height * 0.015
                              : deviceSize.height * 0.01,
                          color: _pageIndex == 2
                              ? Colors.blueAccent
                              : Theme.of(context).textTheme.displayLarge!.color,
                        ),
                      ),
                      icon: Icon(
                        Icons.settings_outlined,
                        color: _pageIndex == 2
                            ? Colors.blueAccent
                            : Theme.of(context).textTheme.displayLarge!.color,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )),
      body: _pages[_pageIndex]['page'],
      floatingActionButton: const CustomFloatingActionButton(),
    );
  }
}
