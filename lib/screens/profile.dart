import 'package:flutter/material.dart';

// A provider class to manage the theme state
class ThemeProvider extends ChangeNotifier {
  bool _isDarkMode = false;

  bool get isDarkMode => _isDarkMode;

  void toggleTheme() {
    _isDarkMode = !_isDarkMode;
    notifyListeners();
  }
}

// Main profile page widget
class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  // Theme state
  final ThemeProvider _themeProvider = ThemeProvider();
  bool get isDarkMode => _themeProvider.isDarkMode;

  // Other state variables
  bool isNotificationsEnabled = true;

  @override
  void initState() {
    super.initState();
    // Listen to theme changes
    _themeProvider.addListener(_onThemeChanged);
  }

  @override
  void dispose() {
    _themeProvider.removeListener(_onThemeChanged);
    super.dispose();
  }

  void _onThemeChanged() {
    setState(() {});
  }

  // Apply theme to the app
  ThemeData get _currentTheme {
    return isDarkMode
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
            scaffoldBackgroundColor: Colors.white,
            appBarTheme: const AppBarTheme(
              backgroundColor: Colors.white,
              foregroundColor: Colors.black,
              elevation: 0,
            ),
          );
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: _currentTheme,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('My Profile'),
          actions: [
            IconButton(
              icon: const Icon(Icons.edit),
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Edit profile')),
                );
              },
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              // Profile Header
              Container(
                padding: const EdgeInsets.symmetric(vertical: 24),
                color: _currentTheme.primaryColor.withOpacity(0.1),
                child: Column(
                  children: [
                    // Profile Picture
                    Stack(
                      children: [
                        CircleAvatar(
                          radius: 60,
                          backgroundColor: isDarkMode
                              ? Colors.grey.shade800
                              : Colors.grey.shade200,
                          backgroundImage: const AssetImage("assets/bi.jpeg"),
                          onBackgroundImageError: (_, __) {},
                        ),
                        Positioned(
                          bottom: 0,
                          right: 0,
                          child: Container(
                            padding: const EdgeInsets.all(4),
                            decoration: BoxDecoration(
                              color: _currentTheme.primaryColor,
                              shape: BoxShape.circle,
                            ),
                            child: IconButton(
                              constraints: const BoxConstraints.tightFor(
                                width: 30,
                                height: 30,
                              ),
                              padding: EdgeInsets.zero,
                              icon: const Icon(Icons.camera_alt,
                                  color: Colors.white, size: 20),
                              onPressed: () {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      content: Text('Change profile picture')),
                                );
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    // User Info
                    const Text(
                      'Ranvijay Kumar',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'Ranvijaykumar9708@gmail.com',
                      style: TextStyle(
                        fontSize: 16,
                        color: isDarkMode ? Colors.grey.shade300 : Colors.grey,
                      ),
                    ),
                    const SizedBox(height: 16),
                    // User Stats
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          _buildStat('Shipments', '24'),
                          _buildStatDivider(),
                          _buildStat('Tracking', '8'),
                          _buildStatDivider(),
                          _buildStat('Delivered', '16'),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              // Account Settings
              _buildSection(
                title: 'Account Settings',
                children: [
                  _buildListTile(
                    icon: Icons.person,
                    title: 'Personal Information',
                    onTap: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                            content: Text('Edit personal information')),
                      );
                    },
                  ),
                  _buildListTile(
                    icon: Icons.lock,
                    title: 'Change Password',
                    onTap: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Change password')),
                      );
                    },
                  ),
                  _buildListTile(
                    icon: Icons.location_on,
                    title: 'Address Book',
                    onTap: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Manage addresses')),
                      );
                    },
                  ),
                  _buildSwitchTile(
                    icon: Icons.notifications,
                    title: 'Notifications',
                    value: isNotificationsEnabled,
                    onChanged: (value) {
                      setState(() {
                        isNotificationsEnabled = value;
                      });
                    },
                  ),
                  _buildSwitchTile(
                    icon: Icons.dark_mode,
                    title: 'Dark Mode',
                    value: isDarkMode,
                    onChanged: (value) {
                      _themeProvider.toggleTheme();
                    },
                  ),
                ],
              ),
              // Payment Methods
              _buildSection(
                title: 'Payment Methods',
                children: [
                  _buildListTile(
                    icon: Icons.credit_card,
                    title: 'Credit & Debit Cards',
                    onTap: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Manage payment cards')),
                      );
                    },
                  ),
                  _buildListTile(
                    icon: Icons.account_balance,
                    title: 'Bank Accounts',
                    onTap: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Manage bank accounts')),
                      );
                    },
                  ),
                ],
              ),
              // Support & About
              _buildSection(
                title: 'Support & About',
                children: [
                  _buildListTile(
                    icon: Icons.help,
                    title: 'Help Center',
                    onTap: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Open help center')),
                      );
                    },
                  ),
                  _buildListTile(
                    icon: Icons.policy,
                    title: 'Privacy Policy',
                    onTap: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('View privacy policy')),
                      );
                    },
                  ),
                  _buildListTile(
                    icon: Icons.description,
                    title: 'Terms of Service',
                    onTap: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('View terms of service')),
                      );
                    },
                  ),
                  _buildListTile(
                    icon: Icons.info,
                    title: 'About',
                    onTap: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('View app information')),
                      );
                    },
                  ),
                ],
              ),
              // Logout Button
              Padding(
                padding: const EdgeInsets.all(24),
                child: SizedBox(
                  width: double.infinity,
                  child: ElevatedButton.icon(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: const Text('Log Out'),
                          content:
                              const Text('Are you sure you want to log out?'),
                          actions: [
                            TextButton(
                              onPressed: () => Navigator.of(context).pop(),
                              child: const Text('CANCEL'),
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(content: Text('Logged out')),
                                );
                              },
                              child: const Text('LOG OUT'),
                            ),
                          ],
                        ),
                      );
                    },
                    icon: const Icon(Icons.exit_to_app),
                    label: const Text('Log Out'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStat(String label, String value) {
    return Column(
      children: [
        Text(
          value,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          label,
          style: TextStyle(
            color: isDarkMode ? Colors.grey.shade300 : Colors.grey,
          ),
        ),
      ],
    );
  }

  Widget _buildStatDivider() {
    return Container(
      height: 30,
      width: 1,
      color: (isDarkMode ? Colors.grey.shade700 : Colors.grey.shade300),
    );
  }

  Widget _buildSection(
      {required String title, required List<Widget> children}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 24, 16, 8),
          child: Text(
            title,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: isDarkMode ? Colors.grey.shade300 : Colors.black54,
            ),
          ),
        ),
        ...children,
        Divider(
            height: 1,
            color: isDarkMode ? Colors.grey.shade800 : Colors.grey.shade300),
      ],
    );
  }

  Widget _buildListTile({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
    String? subtitle,
  }) {
    return ListTile(
      leading: Icon(icon, color: _currentTheme.primaryColor),
      title: Text(title),
      subtitle: subtitle != null ? Text(subtitle) : null,
      trailing: const Icon(Icons.arrow_forward_ios, size: 16),
      onTap: onTap,
    );
  }

  Widget _buildSwitchTile({
    required IconData icon,
    required String title,
    required bool value,
    required ValueChanged<bool> onChanged,
  }) {
    return SwitchListTile(
      secondary: Icon(icon, color: _currentTheme.primaryColor),
      title: Text(title),
      value: value,
      onChanged: onChanged,
    );
  }
}
