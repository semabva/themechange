import 'package:flutter/material.dart';
import 'package:flutter_application_1/theme.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ThemecolorData().createSharedPrefObj();
  runApp(ChangeNotifierProvider<ThemecolorData>(
      create: (BuildContext context) => ThemecolorData(), child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Provider.of<ThemecolorData>(context, listen: false)
        .loadThemeFromSharedPred();

    return MaterialApp(
      debugShowCheckedModeBanner: true,
      theme: Provider.of<ThemecolorData>(context).themeColor,
      home: Homepage(),
    );
  }
}

class Homepage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      appBar: AppBar(
        title: Text('Select theme'),
      ),
      body: Padding(
        padding: EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SwitchListTile(
              onChanged: (_) {
                Provider.of<ThemecolorData>(context, listen: false)
                    .toggleTheme();
              },
              value: Provider.of<ThemecolorData>(context).isGreen,
              title: Provider.of<ThemecolorData>(context).isGreen
                  ? Text('Green theme')
                  : Text('Red theme'),
            ),
            Card(
              child: ListTile(
                title: Text('Things to do'),
                trailing: Icon(Icons.check_box),
              ),
            ),
            SizedBox(height: 8),
            TextButton(onPressed: () {}, child: Text('Add')),
          ],
        ),
      ),
    );
  }
}
