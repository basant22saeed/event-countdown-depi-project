import 'dart:io';
import 'package:event_countdown/screens/notifications/notification.dart';
import 'package:event_countdown/screens/provider_drawer.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:provider/provider.dart';

class AppDrawer extends StatefulWidget {
  @override
  _AppDrawerState createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {
  bool _isNightMode = false;
  String _selectedLanguage = "En";
  String _username = "UserName";
  File? _profileImage;

  @override
  void initState() {
    super.initState();
    _loadSettings();
  }

  Future<void> _loadSettings() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _isNightMode = prefs.getBool('nightMode') ?? false;
      _selectedLanguage = prefs.getString('language') ?? 'En';
      _username = prefs.getString('username') ?? 'UserName';
    });
  }

  Future<void> _saveSettings() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('nightMode', _isNightMode);
    prefs.setString('language', _selectedLanguage);
    prefs.setString('username', _username);
  }

  Future<void> _pickProfileImage() async {
    final ImagePicker _picker = ImagePicker();
    final action = await showDialog<int>(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Choose an option'),
        actions: [
          TextButton(
            child: Text('Take a Picture'),
            onPressed: () => Navigator.of(context).pop(0),
          ),
          TextButton(
            child: Text('Select from Gallery'),
            onPressed: () => Navigator.of(context).pop(1),
          ),
        ],
      ),
    );

    if (action != null) {
      XFile? pickedImage;
      if (action == 0) {
        pickedImage = await _picker.pickImage(source: ImageSource.camera);
      } else if (action == 1) {
        pickedImage = await _picker.pickImage(source: ImageSource.gallery);
      }

      if (pickedImage != null) {
        setState(() {
          _profileImage = File(pickedImage!.path);
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    bool isDarkMode = Provider.of<ThemeProvider>(context)
        .isDarkMode; // Get the current theme mode
    return Drawer(
      child: Container(
        color: isDarkMode ? Color(0xff1B1B1B) : Color(0xffBFBFDB),
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            SizedBox(height: 85.0),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'APP NAME',
                  style: TextStyle(
                      color: isDarkMode ? Colors.white : Color(0xFF0D1445),
                      fontSize: 30), // Change text color based on theme
                ),
              ],
            ),
            SizedBox(height: 16.0),
            Container(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Stack(
                    children: [
                      CircleAvatar(
                        radius: 45,
                        backgroundColor: Colors.white,
                        backgroundImage: _profileImage != null
                            ? FileImage(_profileImage!)
                            : null,
                        child: _profileImage == null
                            ? Icon(Icons.person,
                                size: 50, color: Colors.black45)
                            : null,
                      ),
                      Positioned(
                        bottom: -1,
                        right: -1,
                        child: GestureDetector(
                          onTap: _pickProfileImage,
                          child: CircleAvatar(
                            backgroundColor: Colors.blueAccent,
                            radius: 17,
                            child: Icon(Icons.camera_alt,
                                color: Colors.white, size: 20),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 12.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.person,
                              color: isDarkMode
                                  ? Colors.white
                                  : Color(
                                      0xFF0D1445)), // Change icon color based on theme
                          SizedBox(width: 12.0),
                          Text(
                            _username,
                            style: TextStyle(
                                color: isDarkMode
                                    ? Colors.white
                                    : Color(0xFF0D1445),
                                fontSize:
                                    18), // Change text color based on theme
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 12),
                        child: IconButton(
                          icon: Icon(Icons.edit,
                              color: isDarkMode
                                  ? Colors.white
                                  : Color(
                                      0xFF0D1445)), // Change icon color based on theme
                          onPressed: _editUsername,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            ListTile(
              title: Text(
                'Settings',
                style: TextStyle(
                    color: isDarkMode ? Colors.white : Color(0xFF0D1445),
                    fontSize: 20), // Change text color based on theme
              ),
            ),
            SwitchListTile(
              secondary: Icon(
                isDarkMode ? Icons.dark_mode : Icons.light_mode,
                color: isDarkMode ? Colors.white : Color(0xff1B1B1B),
              ),
              title: Text('Night mode',
                  style: TextStyle(
                      color: isDarkMode
                          ? Colors.white
                          : Color(
                              0xFF0D1445))), // Change text color based on theme
              value: isDarkMode,
              activeColor: Colors.blue,
              onChanged: (bool value) {
                final provider =
                    Provider.of<ThemeProvider>(context, listen: false);
                provider.toggleTheme(value);
              },
            ),
            ListTile(
              leading: Icon(Icons.language,
                  color: isDarkMode
                      ? Colors.white
                      : Color(0xFF0D1445)), // Change icon color based on theme
              title: Text('Language',
                  style: TextStyle(
                      color: isDarkMode
                          ? Colors.white
                          : Color(
                              0xFF0D1445))), // Change text color based on theme
              trailing: Padding(
                padding: const EdgeInsets.only(right: 12),
                child: Text(
                  _selectedLanguage,
                  style: TextStyle(
                      color: isDarkMode ? Colors.white : Color(0xFF0D1445),
                      fontSize: 20), // Change text color based on theme
                ),
              ),
              onTap: _selectLanguage,
            ),
            ListTile(
              leading: Icon(Icons.notifications,
                  color: isDarkMode
                      ? Colors.white
                      : Color(0xFF0D1445)), // Change icon color based on theme
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Notification',
                    style: TextStyle(
                        color: isDarkMode
                            ? Colors.white
                            : Color(
                                0xFF0D1445)), // Change text color based on theme
                  ),
                  SizedBox(width: 8.0), // Space between text and icon
                  Padding(
                    padding: const EdgeInsets.only(right: 12),
                    child: Icon(Icons.arrow_forward_ios,
                        color: isDarkMode ? Colors.white : Color(0xFF0D1445)),
                  ),
                ],
              ),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => NotificationHistory( events: [],),
                    ));
              },
            ),
          ],
        ),
      ),
    );
  }

  void _editUsername() {
    showDialog(
      context: context,
      builder: (context) {
        TextEditingController _usernameController =
            TextEditingController(text: _username);
        return AlertDialog(
          title: Text('Edit Username'),
          content: TextField(
            controller: _usernameController,
            decoration: InputDecoration(hintText: 'Enter new username'),
          ),
          actions: [
            TextButton(
              onPressed: () {
                setState(() {
                  _username = _usernameController.text;
                  _saveSettings();
                });
                Navigator.of(context).pop();
              },
              child: Text('Save'),
            ),
          ],
        );
      },
    );
  }

  void _selectLanguage() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Select Language'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                title: Text('English'),
                onTap: () {
                  setState(() {
                    _selectedLanguage = 'En';
                    _saveSettings();
                  });
                  Navigator.of(context).pop();
                },
              ),
              ListTile(
                title: Text('Arabic'),
                onTap: () {
                  setState(() {
                    _selectedLanguage = 'Ar';
                    _saveSettings();
                  });
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
        );
      },
    );
  }
}