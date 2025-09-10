# Flutter InheritedWidget Demo

A simple Flutter application demonstrating the use of **InheritedWidget** for state management and data sharing across the widget tree.

## 📋 Overview

This project showcases how to use Flutter's `InheritedWidget` to share data and callbacks between different widgets without explicitly passing them through constructors. The app demonstrates:

- Creating a custom `InheritedWidget` (`TimeProvider`)
- Sharing state across multiple screens
- Updating UI when state changes
- Navigation between screens while maintaining shared state

## 🚀 Features

- **Time Display**: Shows current timestamp when button is tapped
- **State Sharing**: Shares data between multiple screens using InheritedWidget
- **Navigation**: Navigate between screens while preserving state
- **Clean Architecture**: Demonstrates proper InheritedWidget implementation

## 📱 App Structure

### Main Components

1. **MyApp** (`main.dart`)
   - Root widget that holds the application state
   - Provides `TimeProvider` to the entire widget tree
   - Manages the title state and update callback

2. **TimeProvider** (`time_provider.dart`)
   - Custom `InheritedWidget` implementation
   - Provides `title`, `name`, and `onTap` callback to descendant widgets
   - Handles efficient rebuilding when state changes

3. **HomeScreen** (`main.dart`)
   - Main screen with a tappable button
   - Accesses TimeProvider data
   - Updates title on button tap
   - Navigates to second page

4. **SecondPage** (`main.dart`)
   - Secondary screen that also accesses TimeProvider data
   - Demonstrates state persistence across navigation

## 🏗️ How InheritedWidget Works

### Key Concepts

1. **Data Provision**: `TimeProvider` wraps the widget tree and provides data to all descendants
2. **Data Access**: Child widgets use `TimeProvider.of(context)` to access shared data
3. **Efficient Updates**: Only widgets that depend on the InheritedWidget rebuild when data changes
4. **No Constructor Drilling**: Eliminates the need to pass data through multiple widget constructors

### Code Flow

```
MyApp (StatefulWidget)
├── TimeProvider (InheritedWidget)
    ├── MaterialApp
        ├── HomeScreen
        └── SecondPage (via navigation)
```

## 🔧 Implementation Details

### TimeProvider Class

```dart
class TimeProvider extends InheritedWidget {
  final String title;       // Current title (timestamp)
  final String name;        // User name
  final VoidCallback onTap; // Callback to update title

  // Access method for descendant widgets
  static TimeProvider? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<TimeProvider>();
  }

  // Determines when to rebuild dependent widgets
  @override
  bool updateShouldNotify(TimeProvider oldWidget) {
    return oldWidget.title != title;
  }
}
```

### Using the Provider

```dart
// Access TimeProvider data in any descendant widget
final provider = TimeProvider.of(context);

// Use the provided data
Text(provider!.title)           // Display title
onTap: provider!.onTap         // Use callback
```

## 📦 Getting Started

### Prerequisites

- Flutter SDK (latest stable version)
- Dart SDK
- Android Studio / VS Code with Flutter extensions

### Installation

1. **Clone the repository**
   ```bash
   git clone <repository-url>
   cd inhereted_widget
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **Run the app**
   ```bash
   flutter run
   ```

## 🎯 Usage

1. **Launch the app**: You'll see the main screen with "No Title" in the app bar
2. **Tap the blue button**: The title updates to show the current timestamp
3. **Navigate to second page**: Use the floating action button (arrow) to go to the second screen
4. **Observe state persistence**: The second page shows the same updated data from the TimeProvider

## 🏆 Benefits of InheritedWidget

### Advantages

- **Efficient**: Only rebuilds widgets that actually depend on the data
- **Clean Code**: Eliminates prop drilling through multiple widget layers
- **Performance**: Built-in optimization for widget rebuilding
- **Scalable**: Easy to extend with additional data and callbacks

### When to Use

- Sharing data across multiple widgets in different parts of the tree
- Avoiding excessive constructor parameters
- Need for efficient rebuilding of specific widgets
- Theme data, user preferences, or app-wide state management

## 🔄 State Management Flow

1. **State Creation**: `MyApp` creates and holds the state (`title`)
2. **State Provision**: `TimeProvider` wraps the app and provides state + callbacks
3. **State Access**: Child widgets access state using `TimeProvider.of(context)`
4. **State Update**: Callback triggers `setState()` in `MyApp`
5. **Automatic Rebuild**: Only dependent widgets rebuild automatically

## 📚 Learning Resources

- [Flutter InheritedWidget Documentation](https://api.flutter.dev/flutter/widgets/InheritedWidget-class.html)
- [Flutter State Management Guide](https://flutter.dev/docs/development/data-and-backend/state-mgmt)
- [Widget Tree and BuildContext](https://flutter.dev/docs/development/ui/widgets-intro)

## 🤝 Contributing

Feel free to fork this project and submit pull requests for any improvements or bug fixes.

## 📄 License

This project is open source and available under the [MIT License](LICENSE).

---

**Happy Coding! 🚀**
