# Flutter InheritedModel Concept Demo

A practical demonstration of Flutter's `InheritedModel` widget for efficient state management and selective widget rebuilding.

## What is InheritedModel?

`InheritedModel` is an advanced Flutter widget that extends `InheritedWidget` with the ability to control which dependent widgets rebuild when data changes. Unlike `InheritedWidget` which notifies all dependents when any data changes, `InheritedModel` allows for **selective notifications** based on "aspects" or specific pieces of data.

### Key Benefits

- **Selective Rebuilding**: Only widgets that depend on changed data will rebuild
- **Performance Optimization**: Reduces unnecessary widget rebuilds in complex applications
- **Aspect-Based Dependencies**: Widgets can listen to specific data aspects rather than the entire model

## How This Demo Works

### Project Structure

```
lib/
├── main.dart                           # Main app and home page
├── model/
│   └── color_inherited_model.dart      # Custom InheritedModel implementation
└── widgets/
    ├── box1_widget.dart                # Widget dependent on color1
    └── box2_widget.dart                # Widget dependent on color2
```

### The ColorInheritedModel

Our custom `InheritedModel` manages two colors and uses string aspects to identify which color each widget depends on:

```dart
class ColorInheritedModel extends InheritedModel<String> {
  final Color color1;
  final Color2;
  
  // Two key methods control rebuilding behavior:
  
  // 1. updateShouldNotify: Called when any data changes
  @override
  bool updateShouldNotify(ColorInheritedModel oldWidget) {
    return oldWidget.color1 != color1 || oldWidget.color2 != color2;
  }
  
  // 2. updateShouldNotifyDependent: Controls selective rebuilding
  @override
  bool updateShouldNotifyDependent(
    ColorInheritedModel oldWidget,
    Set<String> aspects,
  ) {
    if (aspects.contains('color1') && oldWidget.color1 != color1) {
      return true; // Rebuild widgets depending on 'color1'
    }
    if (aspects.contains('color2') && oldWidget.color2 != color2) {
      return true; // Rebuild widgets depending on 'color2'
    }
    return false; // Don't rebuild if the aspect hasn't changed
  }
}
```

### Widget Dependencies

Each box widget declares its dependency on a specific color aspect:

**Box1 (depends on 'color1')**:
```dart
final color = ColorInheritedModel.of(context, 'color1');
```

**Box2 (depends on 'color2')**:
```dart
final color = ColorInheritedModel.of(context, 'color2');
```

## Demonstrating Selective Rebuilding

The app includes two floating action buttons that change each color independently:

1. **Up Arrow Button**: Changes `color1` (red ↔ green)
   - Only `Box1` rebuilds
   - `Box2` remains unchanged
   - Console shows: "Build box 1" only

2. **Down Arrow Button**: Changes `color2` (blue ↔ teal)
   - Only `Box2` rebuilds  
   - `Box1` remains unchanged
   - Console shows: "Build box 2" only

## Key Concepts Illustrated

### 1. Aspect-Based Dependencies
Widgets specify which aspect they care about using the second parameter in `InheritedModel.inheritFrom()`:

```dart
// This widget only cares about 'color1' changes
ColorInheritedModel.of(context, 'color1')
```

### 2. Selective Notification Logic
The `updateShouldNotifyDependent` method checks:
- Which aspects the dependent widget cares about (`aspects` parameter)
- Whether those specific aspects have actually changed
- Returns `true` only if the widget's relevant data changed

### 3. Performance Benefits
Compare this with a regular `InheritedWidget`:
- **InheritedWidget**: Changing any color → both boxes rebuild
- **InheritedModel**: Changing color1 → only Box1 rebuilds

## Running the Demo

1. Clone the repository
2. Run `flutter pub get`
3. Launch the app with `flutter run`
4. Watch the console output while tapping the floating action buttons
5. Observe how only the relevant box rebuilds when its color changes

## When to Use InheritedModel

`InheritedModel` is ideal when:

- You have complex state with multiple independent pieces of data
- Different widgets depend on different parts of your state
- Performance optimization is crucial
- You want to minimize unnecessary rebuilds in large widget trees

## Comparison with Other State Management

| Solution | Selective Rebuilds | Learning Curve | Use Case |
|----------|-------------------|----------------|----------|
| InheritedModel | ✅ Yes | Medium | Complex apps with independent state pieces |
| InheritedWidget | ❌ No | Easy | Simple shared state |
| Provider | ✅ Yes | Easy | General state management |
| Bloc/Cubit | ✅ Yes | Hard | Large, complex applications |

## Console Output Example

When you run the demo and tap the buttons, you'll see:

```
// Tapping up arrow (changes color1)
Build box 1

// Tapping down arrow (changes color2)  
Build box 2

// Note: Only the relevant widget rebuilds!
```

This demonstrates the power of `InheritedModel` for creating efficient, performant Flutter applications with smart rebuilding behavior.
