import 'package:flutter/material.dart';
import 'package:inhereted_widget/time_provider.dart';

void main() {
  runApp(const MyApp());
}

/// ---------------------------------------------------------------------------
/// MyApp:
/// Root StatefulWidget jo state (title) hold karta hai aur usse TimeProvider
/// ke through poore widget tree me provide karta hai.
/// ---------------------------------------------------------------------------
class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // Title initially "No Title"
  String title = 'No Title';

  /// setTitle:
  /// Jab call hota hai toh state update hoti hai aur title me current time store hota hai.
  void setTitle() {
    setState(() {
      title = DateTime.now().toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return TimeProvider(
      name: "Saqib",
      title: title,     // Provide current title
      onTap: setTitle,  // Provide callback function
      child: MaterialApp(
        home: const HomeScreen(),
      ),
    );
  }
}


/// ---------------------------------------------------------------------------
/// HomeScreen:
/// Ye ek StatelessWidget hai jo TimeProvider se onTap callback access karta hai
/// aur ek button (InkWell) ke click par title update karta hai.
/// Saath hi ek FloatingActionButton hai jo dusre page par navigate karta hai.
/// ---------------------------------------------------------------------------
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // TimeProvider se data access karna
    final provider = TimeProvider.of(context);

    return Scaffold(
      appBar: AppBar(title: Text(provider!.title)),
      body: Center(
        child: Material(
          color: Colors.blue, // Button background color
          child: InkWell(
            // On tap, TimeProvider ka onTap callback run hoga (title update karega)
            onTap: provider!.onTap,
            child: const SizedBox(
              height: 100,
              width: 100,
              child: Center(
                child: Text(
                  'Tap on me',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        // Navigate to SecondPage
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const SecondPage()),
          );
        },
        child: const Icon(Icons.arrow_forward),
      ),
    );
  }
}


/// ---------------------------------------------------------------------------
/// SecondPage:
/// Ye page bhi TimeProvider se data access karta hai.
/// Yahan AppBar title me current [title] show hota hai jo pehle page se update hua tha.
/// ---------------------------------------------------------------------------
class SecondPage extends StatelessWidget {
  const SecondPage({super.key});

  @override
  Widget build(BuildContext context) {
    // TimeProvider se title access karna
    final provider = TimeProvider.of(context);

    return Scaffold(
      appBar: AppBar(title: Text(provider!.name)),
      body: Container(
        color: Colors.white,
        child: const Center(
          child: Text(
            "This is Second Page\nTitle is inherited from provider",
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}


