---
sidebar_position: 2
---

# Step 1a - Location App Bar
 
In this step, we are creating the UI for this simple app bar:
 
![App Bar](/img/docs/overview/app-bar.png)

## Making home widget holds multiple child widgets

Let's open `pages/home.dart`

This contains the widget representing our home page: `HomePage`. Currently it looks something like this:
```dart
class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: Theme.of(context).backgroundDecoration,
      child: Scaffold(
        body: DemoStatefulWidget(),
        // TODO: ListView
        //// TODO: App Bar
        //// TODO: Overview
        //// TODO: Forecast List
      ),
    );
  }
}
```
Take a look at this widget class. It extends `StatelessWidget`, which requires us to provide a `build` method.
The `build` method is where we define how the layout should look like by returning a widget.

:::info
There are two types of base widgets: `StatelessWidget` and `StatefulWidget`

We will cover `StatefulWidget` in Step 2 of this tutorial!
:::

The `DemoStatefulWidget` is a dummy widget we will be using in Step 2. For now we can safely remove it.
Lets do the following:
- Remove the `DemoStatefulWidget`
- Follow the `TODO` to add a `ListView` widget under the `body` parameter
- add a `children` parameter with an empty array `[]`

```dart
return Container(
  decoration: Theme.of(context).backgroundDecoration,
  child: Scaffold(
    body: ListView(
      children: [
        
      ],
    ),
    //// TODO: App Bar
    //// TODO: Overview
    //// TODO: Forecast List
  ),
);
```

:::tip
Using trailing commas after the each parameter helps dart formatter to better format your code automatically.

You can read [the official Code Fomatting guide](https://docs.flutter.dev/development/tools/formatting) for more details
:::

By using a [`ListView` widget](https://api.flutter.dev/flutter/widgets/ListView-class.html), we allow the `HomePage` widget to hold muliple child widgets and lay them out linearly. `ListView` also allow its list of children to be scrollable if their combined heights are taller than the screen.

:::info
By default, `ListView` lay out its children vertically. You can configure the direction by specifying the parameter `scrollDirection`. For example:

```dart
ListView(
  scrollDirection: Axis.horizontal,
  children: [],
)
```
:::

We can now add the `LocationAppBar` widget. This widget is a custom widget defined by us, but its implementation is currently empty.
Nevertheless, we can add it first and work on it later.

Add a `LocationAppBar` widget inside the children array.

```dart
ListView(
  children: [
    LocationAppBar(stationName: stationName),
  ],
),
```

:::tip
When you type, your editor should have a dropdown list suggesting options. You can navigate using up/down arrow key and press `Enter` to autocomplete. This should also add an `import` statement on top of the file for you.

If you miss the autocomplete, simply retype and try again. Or you can add the import statement by yourself:
```dart
import 'package:weather/widgets/location_app_bar.dart';
```
:::

The autocomplete also fill in a parameter `stationName` for you, which indicates that this widget has this required parameter.
The data classes we are using provides mock data for mocking purpose. For a mock station name, we can obtain a mock `CurrentWeatherResponse` and:
```dart
CurrentWeatherResponse.mock().stations.first.name
```

For tidiness, we can move the remaining two `TODO` comments into the children array to remind us for the future steps.

Now your `HomePage` widget should look like this:
```dart
class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: Theme.of(context).backgroundDecoration,
      child: Scaffold(
        body: ListView(
          children: [
            LocationAppBar(stationName: CurrentWeatherResponse.mock().stations.first.name),
            //// TODO: Overview
            //// TODO: Forecast List
          ],
        ),
      ),
    );
  }
}
```
:::tip
Click on `File > Save` in your editor or simply do `Command + S` key combo to hot reload.
The editor will indicate that "Hot Reload Completed" and your app will update instantly.
:::

## Working on the `LocationAppBar` widget

Open `lib/widgets/location_app_bar.dart`. This is where the `LocationAppBar` widget we previously included lives.
This is what it currently looks like:
```dart
import 'package:flutter/material.dart';

class LocationAppBar extends StatelessWidget {
  final String stationName;

  const LocationAppBar({
    Key? key,
    required this.stationName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(); // TODO: Location App Bar
  }
}
```

:::info
Notice the variable and contructor parameter `stationName`, which we need to supply when constructing this widget in the previous step.
:::

### Parent Widget - Row

Let's get down to business!

![App Bar](/img/docs/overview/app-bar.png)

Looking back at the app bar design, it's clear that we will be layout out our children widget horizontally.
For this, we can use a `Row` widget, which accepts an array of widgets as children, similar to `ListView` we used before.

We can use a `SizedBox` widget to set the desired height. Checking the Figma design, the height should be `60px`

Change the default `Container` widget to an `SizedBox` widget with a `Row` widget as its child as follows:

```dart
@override
Widget build(BuildContext context) {
  return SizedBox(
    height: 60,
    child: Row(
      children: [],
    ),
  );
}
```
:::tip
Normally we will use an [`AppBar` widget](https://api.flutter.dev/flutter/material/AppBar-class.html) for app bar implementations. Here we are simplying things by using a `SizedBox` due to the one-page design.
:::

### Inner Child Widgets

Now we need to determine what we need for the child widgets.

![Child Widgets Analyze](/img/docs/1-widgets/1a-appbar/child-widget-analyze.png)

:::tip
Utilize the Outline View in Figma by doing `View > Show Outline`
:::

By utilizing the outline view in Figma, it's clear that we will need three widgets:
- Location Icon
- Station Text
- Arrow Icon
  
We can use the `Icon` widget for displaying the two vector icons, and the `Text` widget for displaying text.

First, lets add the location icon.

Flutter comes with a collection of Material vector icons that we can use out of the box. For the location icon we can use `Icons.place_rounded`

Add a `Icon` widget as the first child inside the `Row`'s children:
```dart
Row(
  children: [
    Icon(Icons.place_rounded),
  ],
),
```

:::caution
`Icon` is the Icon widget class, while `Icons` is the class containing collections of vector icons
:::

After hot-reloading (`File > Save`), you will notice the location icon appears on the app! However, 2 things are strange:
- The icon color is different
- The icon is aligned on the far left of the screen

![Added Location Icon](/img/docs/1-widgets/1a-appbar/added-location-icon.png)

The first problem is because we haven't tell Flutter to use the same color as the station text on the icons. To do this, set the `color` parameter in the `Icon` widget.

The second problem is because we haven't properly specify how to align the children inside the `Row` widget. To do this, set the `mainAxisAlign` parameter in the `Row` widget

```dart
child: Row(
  mainAxisAlignment: MainAxisAlignment.center, // Make children pack at center
  children: [
    Icon(
      Icons.place_rounded,
      color: Theme.of(context).textTheme.headline6!.color,
    ),
  ],
),
```

:::note
Refer to the Figma design system for what text style and color to use
:::

:::caution
The `!` after `headline6` is necessary.
Since the text style `headline6` is **nullable**, the `!`
:::

:::tip
The `MainAxisAlignment` class contains many configurations on how to align a `Row`/`Column`'s children.
The default is `MainAxisAlignment.start`, which is the reason why we see our `Icon` widget aligned to the start of the screen without any configurations. (Left-to-Right)
:::

![Added Location Icon Aligned](/img/docs/1-widgets/1a-appbar/added-location-icon-aligned.png)

Much better! Let's speed up the addition of the remaining two widgets.

We will add a `Text` widget, with the `stationName` as the parameter. That is the parameter passed to us by our parent widget in the previous steps if you recall.

We will also add another `Icon` widget after the `Text` widget, using `Icons.arrow_drop_down_rounded` as the parameter for the arrow drop down icon.

```dart
child: Row(
  mainAxisAlignment: MainAxisAlignment.center, // Make children pack at center
  children: [
    Icon(
      Icons.place_rounded,
      color: Theme.of(context).textTheme.headline6!.color,
    ),
    Text(
      stationName,
      style: Theme.of(context).textTheme.headline6,
    ),
    Icon(
      Icons.arrow_drop_down_rounded,
      color: Theme.of(context).textTheme.headline6!.color,
    ),
  ],
),
```

Now, hitting save for hot-reloading...

![Added All Children](/img/docs/1-widgets/1a-appbar/added-all-children.png)

Comparing with the Figma design file, there seems to be a lack of spacing between the location icon and the station text. We can surround the `Text` widget with a `Padding` widget for adding padding.

```dart
Padding(
  padding: const EdgeInsets.only(left: 8.0),
  child: Text(
    stationName,
    style: Theme.of(context).textTheme.headline6,
  ),
),
```

:::tips
There are convenient refactoring shortcuts to help you do this easier if you have installed the Flutter plugin in your editor:

Android Studio: While placing your cursor inside the widget name (in this case `Text`), hit `Option + Return`
VS Code: While placing your cursor inside the widget name (in this case `Text`), hit `Ctrl + Shift + R`

This will bring up the refacting menu. Then simply select `Wrap with Padding`, and change the necessary padding options.
:::

Complete code:
```dart
import 'package:flutter/material.dart';

class LocationAppBar extends StatelessWidget {
  final String stationName;

  const LocationAppBar({
    Key? key,
    required this.stationName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center, // Make children pack at center
        children: [
          Icon(
            Icons.place_rounded,
            color: Theme.of(context).textTheme.headline6!.color,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Text(
              stationName,
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
          Icon(
            Icons.arrow_drop_down_rounded,
            color: Theme.of(context).textTheme.headline6!.color,
          ),
        ],
      ),
    );
  }
}
```

![Step 1a Complete](/img/docs/1-widgets/1a-appbar/complete.png)

Horray! We finished our first Widget!

:::info
You can also compare your work with the respective sample git commit
:::