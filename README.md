# flutter
Google Flutter

# The Dart Language

The `dart/hello` Dart project in this repository was created by using the Dart plugin for VS Code. Open the Command Palette (`Ctrl`+`Shift`+`P` | `Cmd`+`Shift`+`P` on macOS), then

- Select **Dart: New Project**.
- Select the template *Console Application console-full*.
  - This template provide you with a sample project with the `bin/hello.dart`, `lib/hello.dart`, and `test/hello_test.dart` modules.
  - The *Simple Console Application console-simple* template only contains the `bin/` module.
- Select the directory where the application directory will reside.
- Specify the project name; `hello` in this case.

## Git and Dart projects

If you `git clone` a Dart project, you may find the project does not compile saying "Target of URI doesn't exist" on `import` statements. This happens because the `.packages` and `.dart_tool/package_config.json` files for the project are missing.
According to [Dart Package Configuration File v2.0](https://github.com/dart-lang/language/blob/master/accepted/future-releases/language-versioning/package-config-file-v2.md),

- Dart currently uses a `.packages` file to configure package URI resolution (converting a package URI to a file name).
- (The Dart team will) introduce a *new* file containing the information that we intended to store in the `.packages` file.
  - The new file will be stored by Pub in the `.dart_tool` sub-directory of the current pub package's root directory.
  - The new file is named `package_config.json`.

The `.gitignore` file of Dart projects created by the Dart plugin contains `.packages` and `.dart_tool/`. This is why the abovementioned files are missing. So how can you solve the situation?

```
$ dart pub deps
No .dart_tool/package_config.json file found, please run "pub get".

Starting with Dart 2.7, the package_config.json file configures resolution of package import URIs; run "pub get" to generate it.
```

So, you can run the `pub get` command to have the files created:

```
$ dart pub get
Resolving dependencies... 
Got dependencies!
```
