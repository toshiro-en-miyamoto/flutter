# Flutter for Beginners (2nd ed), Section 2, Chapter 7

- By Thomas Bailey, Alessandro Biessek, Trevor Wills
- October, 2021
- ISBN 978-1-80056-599-9

Section 2: The Flutter User Interface — Everything is a Widget

# Chapter 7: Routing — Navigating between Screens

- Understading the Navigator widget
  - Navigator 1.0 and 2.0
  - Navigator
  - Navigator 1.0
  - Navigator 2.0
- Screen transitions
  - PageRouteBuilder
  - Custom transitions in practice
- Passing data between screens
  - Passing state in widgets parameters
  - InheritedWidget
  - BLoC
  - Redux

<!--- ///////////////////////////////////////////////////////////////////// --->
## Understading the Navigator widget

The main classes in the navigation layer are as follows:
- `Navigator`: The `Route` manager.
- `Overlay`: `Naviagtor` uses this to specify the appearances of the routes.
- `Route`: A navigation endpoint.

<!--- ================================================================= --->
### Navigator 1.0 and 2.0

As Flutter has moved to the web, ... there are two different available ways to navigate:
- Navigator 1.0 worked in an imperative style.
- Navigator 2.0 follows a declaretive style.

<!--- ================================================================= --->
### Navigator

Navigation in Flutter is conceptually a stack of screens:
- We have one element at the top of the stack. In Navigator, the topmost element on the stack is the currently visible screen of the app.
- The last element inserted in the first to be removed from the stack, commonly referred to as **last in first out**. The last screen visible is the first that is removed.
- The `Navigator` widget has `push()` and `pop()` methods to add and remove screens from the stack. This is the imperative, Navigator 1.0 style; the navigator is being told to add or remove screens.
- The `Navigator` widget has a `page` property where, much like a stack containing a list of widgets, the pages are listed and shown or removed based on the state of the containing widget. This is the declaretive, Navigator 2.0 style; the screen listed in the `page` property are shown or ot based on state rather than being told to show or not.

<!--- ================================================================= --->
### Navigator 1.0

#### Routes

The navigation stack elements are Routes. When we want to navigate to a new screen, we define a new Route widget to it, in addition to some parameters defined as a `RouteSettings` instance.

`RouteSettings` is a simple class that contains information about the route relevant to the `Navigator` widget. The manin properties it contains are:
- `name`: identifies the route uniquely.
- `arguments`: with this, we can pass anything to the destination route.

The `Route` class is a high-level abstraction, but different platforms may expect screen changes to behave differently. In Flutter, there are two main alternative implementations that align with platform expectations:
- `MaterialPageRoute`
- `CupertinoPageRoute`

So, you must decide when developing an application whether to use the Material Design or iOS Cupertino transitions, or both, depending on the context.

```dart
  Navigator.of(context).push(...);
```

The `Navigator` widget is an inherited widget, which means you can find it by seraching the context to retrive it. There is an implicit `Navigator` created within the `MaterialApp` widget, so this is looking up the tree and finding the `Navigator` associated with the `MaterialApp` widget and returning it.

```dart
onPressed: () {
  Navigator.of(context)
      .push(MaterialPageRoute(builder: (context) {
    return const AnotherScreen(title: 'Go back');
  }));
},
```

We pass the `push` method a `MaterialPageRoute`. This holds the information about the new screen that we want to draw, and the contents of the new screen are returned as part of the `builder` property on the `MaterialPageRoute`.

Set the following code as the `onPressed` method on the `ElevatedButton` of the `AnotherScreen` class:

```dart
onPressed: () {
  Navigator.of(context).pop();
},
```

You may see code examples where the `Navigator` call looks slightly different. Instead of `Navigator.of(context).pop()`, you may see `Navigator.pop(context)`. These are effectively equivalent because the first line of code in `Navigator.pop(context)` is to find the `Navigator` using `Navigator.of(context)`. Use whichever approach feels more comfortable to you.

#### Named Routes

Named routes are specified on the `MaterialApp` widget, so let's modify the hello world code to use named routes.
The `'/'` route is a special route that is equivalent to the home of the app, so you are effectively defining `home` twice and Flutter doesn't know which one should be used.

```dart
class MyApp extends StatelessWidget {
  ...
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      ...
      // home: const MyHomePage(title: 'Flutter Navigator 1.0'),
      routes: {
        '/': (context) => const MyHomePage(title: 'Flutter Navigator 2.0'),
        '/screen2': (context) => const AnotherScreen(title: "Go back"),
      },
    );
  }
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    ...
            ElevatedButton(
              child: const Text('Press this'),
              onPressed: () {
                Navigator.of(context).pushNamed("/screen2");
                // Navigator.of(context)
                //     .push(MaterialPageRoute(builder: (context) {
                //   return const AnotherScreen(title: 'Go back');
                // }));
              },
            ),
    ...
  }
}
```

Notice how much cleaner the code feels, and the intent of the navigation is clearer. The creation of a `MaterialPageRoute` is now implicit.

`pop()` continues to work as before; `pushNamed` still just adds a screen to the stack, so the `pop` will simply remove that screen as expected.

Whether you choose to use named routes is your choice — there is no right answer because the choice will be based on personal opinion.

Personally, I prefer to use the `push()` method because it has strong type safety on the constructor parameters of the widget within the route. However, if you are not passing arguments to the routes, or you prefer the style of having central route management, then you may choose named routes.

#### Retrieving results from Route

We have seen that we can pass arguments to a new `Route`. As the inverse path is also possible, instead of sending a message to the second screen, we can take a message when it pops back.
Let's update `AnotherScreen` so that the user can make a choice.

```dart
class AnotherScreen extends StatelessWidget {
  const AnotherScreen({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              child: Text(title),
              onPressed: () {
                Navigator.of(context).pop(true);
              },
            ),
            ElevatedButton(
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop(false);
              },
            ),
          ],
        ),
      ),
    );
  }
}
```

Now we need to update the code in `onPressed` of `ElevatedButton` in `MyHomePage` so that it can receive the returned value.

```dart
ElevatedButton(
  child: const Text('Press this'),
  onPressed: () async {
    bool? outcome = await Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) {
      return const AnotherScreen(title: 'Go back');
    }));
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text('$outcome')));
  },
),
```

The result of push is a `Future`.

<!--- ================================================================= --->
### Navigator 2.0

The `Navigator` has a parameter called `pages` that takes a list of `Page` widgets. As this list changes, due to changes in state, the stack of routes is updated to match the `pages` list.

```dart
class _MyAppState extends State<MyApp> {
  ...
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      ...
      home: Navigator(
        pages: [
          MaterialPage(
            child: MyHomePage(
              ...
            ),
          ),
        ],
      ),
    );
  }
}
```

<!--- ///////////////////////////////////////////////////////////////////// --->
## Screen transitions

On Android, for example, the entrance transition for the page slides the page upward and fade it in. The exit transition does the same in reeverse. On iOS, the page slide in from the right and exits in reverse. Flutter lets us customize this behavior by adding our own transitions between the screens.

<!--- ================================================================= --->
### PageRouteBuilder

`PageRouteBuilder` is a helper class that can be used for custom `Route` creation, instead of using the pre-built route subclasses of `MaterialPageRoute` and `CupertinoPageRoute`.

- `transitionBuilder`: specify the callback for the transition animation.
- `pageBuilder`: specify the callback that draws the page we are transitioning to.
- `transitionDuration`: the duration of the transition.
- `barrierColr` and `barrierDismissible`: define partially covered routes of the model and not for the fullscreen of the app.

<!--- ================================================================= --->
### Custom transitions in practice

```dart
class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('Hello My Home Page!'),
            ElevatedButton(
              child: const Text('Press this'),
              onPressed: () async {
                Navigator.of(context).push(
                  PageRouteBuilder(
                    pageBuilder: (context, animation, secondaryAnimation) =>
                        const AnotherScreen(title: 'Go back'),
                    transitionsBuilder:
                        (context, animation, secondaryAnimation, child) {
                      // return child;
                      return SlideTransition(
                        position: Tween<Offset>(
                          begin: const Offset(-1, 0),
                          end: Offset.zero,
                        ).animate(animation),
                        child: child,
                      );
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
```

Here, instead of simply returning the child widget, we return a `SlideTransition` widget that encapsulates the animation logic for us; a transition from left to right, until it becomes fully visible. The child widget is nested inside `SlideTransition`, so the contents of your new page slide over the previous screen because it is contained within the `SlideTransition` widget.

If you are planning to use the same transition for every page, then useful approach would be to extend the `PageRouteBuilder` class and create a reusable transition that you could add to the code.

```dart
class MySlideTransition extends PageRouteBuilder {
  final Widget transitionPage;
  MySlideTransition({required this.transitionPage})
      : super(
          pageBuilder: (context, animation, secondaryAnimation) =>
              transitionPage,
          transitionsBuilder: (context, animation, secondaryAnimation, child) =>
              SlideTransition(
            position: Tween<Offset>(
              begin: const Offset(-1, 0),
              end: Offset.zero,
            ).animate(animation),
            child: child,
          ),
        );
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('Hello My Home Page!'),
            ElevatedButton(
              child: const Text('Press this'),
              onPressed: () async {
                Navigator.of(context).push(MySlideTransition(
                  transitionPage: const AnotherScreen(title: 'Go back'),
                ));
              },
            ),
          ],
        ),
      ),
    );
  }
}
```

There are many different transitions you can try that have built-in classes, such as:

- `ScaleTransition`: the new screen enlarges over the previous screen.
- `RotationTransition`: the new screen spins as it overlaps the previous screen.
- `FadeTransition`: the new screen fades in over the previous screen.

You would simply replace the `SlideTransition` widget with one of these other widgets to get the desired effect.

<!--- ///////////////////////////////////////////////////////////////////// --->
## Passing data between screens

Flutter doesn't have a single way to hold and share an application state.

It's worth noting that there is no right or wrong answer for state management, but every approach has benefits and weaknesses and you will decide which approach suits you from maintenance, code readability, and app usage perspective.

<!--- ================================================================= --->
### Passing state in widgets parameters

The simplest way to share state around your app, and probably the way most developers start managing state with Flutter, is simply to pass it to each screen within the constructor parameter.

For example, suppose that when a user logs in to your app, you create an instance of your own `User` class that holds important information. You can then simply pass that instance to any screen through a constructor parameter.

There are, however, many drawbacks with this approach:

- If you decide a screen needs some extra state information that is currently not available to it, then all intermediate screens will need to be updated to pass that state to the screen.
- You cannot naturally listen for changes to the state and make the pages (including those already on the stack but not active) automatically update and reflect the changes.
- Long-running asynchronous activities such as listening on database updates do not have a natural place to live and may get bundled into the state classes.

<!--- ================================================================= --->
### InheritedWidget

We've seen the use of `InheritedWidget` several times within this chapter and previous chapters. Specific examples have been for finding the `Navigator` and `ScaffoldMessenger`. You achive this using the `<type>.of(context)` syntax, which searches the context for the first instance of the specified type.

This approach can be used with state, allowing you to serach the context for the state information you require. This specifically alleviates one of the drawbacks of the parameter-based approach previously mentioned because intermediate screens that have no interest in specific state information do not need to accept it in their parameters just so they can pass it to a child widget.

<!--- ================================================================= --->
### BLoC

The **BLoC** (Business Logic Components) approach uses a streams approach to sharing state information. Your widgets listen to their chosen state information streams and are told when the state has changed so that they can choose how to deal with that state change when it happens.

This fists very nicely with the Flutter declarative approach because when the app state chages, the widget is notified and can choose to update its own internal state if the app state change is relevant. By updating its internal state, it will then trigger a build call and render any changes to the user.

Additionally, the BLoC pattern works really well for listening on external systems such as databases or network requests because the listener logic sits within the BLoC and manages updates to the app state as needed.

<!--- ================================================================= --->
### Redux

The key difference between Redux and BLoC is that Redux has one state object that manages all the app states, whereas BLoC has a set of BLoCs that deal with different areas of the app state.

There are three main concepts in Redux:

- **Store**: is where the apps state is tored.
- **Action**: is information about an intention to change the state.
- **Reducer**: calculates the next app state based on an action.
