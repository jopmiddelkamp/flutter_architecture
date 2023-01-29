# flutter_architecture

## Melos

This project is using melos. [Melos](https://melos.invertase.dev) is a tool that optimizes the workflow around managing multi-package repositories.

### Install

```bash
dart pub global activate melos
```

### Scripts

To initialize the project (get and generate) :
```bash
melos init
```
To reinitialize the project (clean, get and generate):
```bash
melos reinit
```
To clean all packages :
```bash
melos postclean
```
To get all packages :
```bash
melos get
```
To generate code in all packages :
```bash
melos generate
```
To generate l10n code in all packages :
```bash
melos l10n
```
To analyze all packages :
```bash
melos analyze
```
To format all packages :
```bash
melos format
```
To fix and apply all packages :
```bash
melos fix:apply
```
To format all packages and exit if changed :
```bash
melos format:set_exit_if_changed
```
To run the Flutter application in debug mode :
```bash
melos run:debug
```
To run the tests :
```bash
melos test
```
To generate l10n code in all packages :
```bash
melos l10n
```

To run flutter pub get :
```bash
melos [package prefix]:get
```
To run build_runner build :
```bash
melos [package prefix]:build
```
To run build_runner watch :
```bash
melos [package prefix]:watch
```
To run build_runner clean :
```bash
melos [package prefix]:clean
```
