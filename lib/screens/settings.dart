import 'package:flutter/material.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  bool _isDarkMode = false;
  bool _notificationsEnabled = true;

  // Update dark mode
  void _toggleDarkMode(bool val) {
    setState(() {
      _isDarkMode = val;
    });
  }

  // Update notifications
  void _toggleNotifications(bool val) {
    setState(() {
      _notificationsEnabled = val;
    });
  }

  void _logout() {
    // Add your logout logic here
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Logged out')),
    );
  }

  // Get the current theme
  ThemeData _getTheme() {
    return _isDarkMode
        ? ThemeData.dark().copyWith(
            primaryColor: Colors.blueAccent,
            appBarTheme: const AppBarTheme(
              backgroundColor: Color(0xFF1F1F1F),
              elevation: 0,
            ),
            scaffoldBackgroundColor: const Color(0xFF121212),
            cardColor: const Color(0xFF1F1F1F),
            dividerColor: Colors.white24,
          )
        : ThemeData.light().copyWith(
            primaryColor: Colors.blue,
            appBarTheme: const AppBarTheme(
              backgroundColor: Colors.white,
              foregroundColor: Colors.black,
              elevation: 0,
            ),
            scaffoldBackgroundColor: Colors.white,
          );
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: _getTheme(), // Apply the current theme here
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Settings'),
        ),
        body: ListView(
          padding: const EdgeInsets.all(16.0),
          children: [
            // Dark Mode Toggle
            SwitchListTile(
              value: _isDarkMode,
              onChanged: _toggleDarkMode,
              title: const Text('Dark Mode'),
              secondary: const Icon(Icons.dark_mode),
            ),
            // Notifications Toggle
            SwitchListTile(
              value: _notificationsEnabled,
              onChanged: _toggleNotifications,
              title: const Text('Enable Notifications'),
              secondary: const Icon(Icons.notifications),
            ),
            const Divider(),
            // Account Management
            ListTile(
              leading: const Icon(Icons.account_circle),
              title: const Text('Account'),
              subtitle: const Text('Manage your account settings'),
              onTap: () {
                // Navigate to account screen if needed
              },
            ),
            // Privacy Policy
            ListTile(
              leading: const Icon(Icons.privacy_tip),
              title: const Text('Privacy Policy'),
              onTap: () {
                // Navigate to privacy policy
              },
            ),
            const Divider(),
            // Logout Button
            ListTile(
              leading: const Icon(Icons.logout, color: Colors.red),
              title: const Text('Logout', style: TextStyle(color: Colors.red)),
              onTap: _logout,
            ),
          ],
        ),
      ),
    );
  }
}
