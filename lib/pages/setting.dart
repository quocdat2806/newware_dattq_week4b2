import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:week4b2/providers/setting_provider.dart';

class Setting extends StatelessWidget {
  const Setting({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(useMaterial3: true),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Setting'),
          centerTitle: true,
          leading: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: const Icon(Icons.arrow_back_ios),),
        ),
        body: const Center(
          child: MySwitch(),
        ),
      ),
    );
  }
}

class MySwitch extends StatefulWidget {
  const MySwitch({super.key});

  @override
  State<MySwitch> createState() => _SwitchState();
}

class _SwitchState extends State<MySwitch> {
  bool light = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Temperature units'),
            Text('use metric measurements for temperature units')
          ],
        ),
        Consumer<SettingProvider>(
          builder: (context, settingProvider, child) => Switch(
            value: settingProvider.isSwitch,
            activeColor: Colors.red,
            onChanged: (bool value) {
              settingProvider.switchButton();
            },
          ),
        ),
      ],
    );
  }
}
