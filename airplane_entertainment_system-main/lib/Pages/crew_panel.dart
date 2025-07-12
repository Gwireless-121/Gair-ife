import 'package:flutter/material.dart';
import '../state/app_state.dart';

class CrewPanelPage extends StatefulWidget {
  @override
  _CrewPanelPageState createState() => _CrewPanelPageState();
}

class _CrewPanelPageState extends State<CrewPanelPage> {
  final TextEditingController _routeController = TextEditingController();
  final TextEditingController _timeController = TextEditingController();
  final TextEditingController _messageController = TextEditingController();
  final TextEditingController _pinController = TextEditingController();

  bool _authenticated = false;
  final String _correctPin = '3284';

  void _submit() {
    if (_pinController.text == _correctPin) {
      setState(() {
        _authenticated = true;
      });
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Incorrect PIN')),
      );
    }
  }

  void _updateState() {
    AppState.update(
      newRoute: _routeController.text,
      newMessage: _messageController.text,
      newTime: _timeController.text,
    );
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Flight data updated')),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (!_authenticated) {
      return Scaffold(
        appBar: AppBar(title: Text('Crew Panel Login')),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              TextField(
                controller: _pinController,
                obscureText: true,
                decoration: InputDecoration(labelText: 'Enter Crew PIN'),
              ),
              ElevatedButton(
                onPressed: _submit,
                child: Text('Login'),
              ),
            ],
          ),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(title: Text('Crew Control Panel')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: [
            TextField(
              controller: _routeController,
              decoration: InputDecoration(labelText: 'Flight Route (e.g. HNL → LAX)'),
            ),
            TextField(
              controller: _timeController,
              decoration: InputDecoration(labelText: 'Time Remaining (e.g. 4:30)'),
            ),
            TextField(
              controller: _messageController,
              decoration: InputDecoration(labelText: 'Broadcast Message'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _updateState,
              child: Text('Update Flight Info'),
            ),
          ],
        ),
      ),
    );
  }
}