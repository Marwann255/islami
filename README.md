# Islami

A Flutter mobile app for reading the Quran and Hadith, built with a dark, gold-accented interface.

<p align="center">
  <img src="assets/images/Screenshot_20260928_213828.png" width="200" alt="Splash screen" />
  <img src="assets/images/Screenshot_20261001_173136.png" width="200" alt="Quran sura list" />
  <img src="assets/images/Screenshot_20261001_173142.png" width="200" alt="Hadith tab" />
</p>

## Features

- **Quran:** browse the list of suras and read their text
- **Hadith:** browse and read Hadith content
- **Custom splash screen and launcher icon** (Android 12 and iOS supported)
- **Arabic typography** using the JannaLT font
- **Sebha** helps the user in tasbeh
- **Radio** play Quran audio from diffrent Reciters
- **Pray Time** browse Prayer Time and next prayer
- **Azkar** browse and read Azkar

## Tech Stack

| Area | Details |
| --- | --- |
| Framework | Flutter (Dart SDK `^3.11.5`) |
| Local storage | [`shared_preferences`](https://pub.dev/packages/shared_preferences) |
| UI | [`carousel_slider`](https://pub.dev/packages/carousel_slider), [`flutter_svg`](https://pub.dev/packages/flutter_svg), `cupertino_icons` |
| Tooling | [`flutter_native_splash`](https://pub.dev/packages/flutter_native_splash), [`flutter_launcher_icons`](https://pub.dev/packages/flutter_launcher_icons), `flutter_lints` |
| Platforms | Android, iOS |

## Project Structure

```
islami/
├── android/            # Android platform code
├── ios/                # iOS platform code
├── assets/
│   ├── images/         # Images with 1.5x–4.0x resolution variants
│   ├── fonts/          # JannaLT
│   └── files/
│       ├── Suras/      # Quran sura text files
│       └── Hadeeth/    # Hadith text files
├── lib/                # Application source code
├── test/               # Tests
└── pubspec.yaml
```

## Getting Started

### Prerequisites

- [Flutter SDK](https://docs.flutter.dev/get-started/install) with Dart `^3.11.5`
- Android Studio or VS Code with the Flutter extension
- An Android emulator/device or an iOS simulator/device

### Run locally

```bash
# 1. Clone the repository
git clone https://github.com/Marwann255/islami.git
cd islami

# 2. Install dependencies
flutter pub get

# 3. Check your setup
flutter doctor

# 4. Run the app
flutter run
```

### Regenerate splash screen and launcher icons

```bash
dart run flutter_native_splash:create
dart run flutter_launcher_icons
```

### Build a release APK

```bash
flutter build apk --release
```

## Content Sources

<!-- TODO: state where the Quran text and Hadith data come from (publisher, edition, narration/riwaya, license). -->

- Quran text: _source and edition to be added_
- Hadith collection: _source to be added_

## Roadmap

<!-- TODO: keep only what you actually plan to build -->

- [ ] Search across suras and Hadith
- [ ] Bookmarks and last-read position
- [ ] Light theme
- [ ] Tests for core screens

