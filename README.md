# 🌦️ Weather Application

A sleek and modern Flutter weather application using the [OpenWeatherMap API](https://openweathermap.org/api), Hive for local caching, and Provider for state management. Built with a dark UI theme for visual appeal.

---

## 📱 Features

- Fetches real-time weather data using OpenWeatherMap API
- Caches data locally using Hive for offline support and speed
- Beautiful dark-themed UI
- Hourly & Weekly mock forecasts
- Air Quality Index placeholder
- Clean architecture using Provider

---

## 📸 Screenshots

![Screenshot_1744284549](https://github.com/user-attachments/assets/b9b9583a-215f-42de-8229-d78b19ae6201)
![Screenshot_1744284691](https://github.com/user-attachments/assets/284de3b5-463e-4b91-9e75-c47105323827)
![Screenshot_1744284643](https://github.com/user-attachments/assets/ff52863f-4c0c-4d2d-a024-9a136a9641e7)


---

## 🧱 Project Structure

```
lib/
├── models/
│   └── weather_model.dart
├── providers/
│   └── weather_provider.dart
├── screens/
│   └── weather_screen.dart
├── services/
│   └── weather_service.dart
├── widgets/
│   ├── air_quality_index.dart
│   ├── hourly_forecast.dart
│   ├── weather_card.dart
│   └── weekly_forecast.dart
├── secrets/
│   └── api_key.dart ← 🔒 (add your key here)
└── main.dart
```

---

## 🚀 Getting Started

### 1. Clone the repository

```bash
git clone https://github.com/Siddiqui145/weather_application.git
cd weather_application
```

### 2. Add your API Key

Create the file:

```bash
lib/secrets/api_key.dart
```

With content:

```dart
const String apiKey = 'YOUR_API_KEY_HERE';
```

### 3. Install Dependencies

```bash
flutter pub get
```

### 4. Generate Hive Adapters (if any in future)

```bash
flutter packages pub run build_runner build
```

### 5. Run the App

```bash
flutter run
```

---

## 📦 Dependencies Used

- [`http`](https://pub.dev/packages/http) - for API requests
- [`hive`](https://pub.dev/packages/hive) & [`hive_flutter`](https://pub.dev/packages/hive_flutter) - for local storage
- [`provider`](https://pub.dev/packages/provider) - state management
- [`flutter/material.dart`](https://api.flutter.dev/flutter/material/material-library.html) - UI framework

---

## 🌐 API Info

This app uses:

- `https://api.openweathermap.org/data/2.5/weather?q={city}&appid={API_KEY}`

For more endpoints, refer to the [OpenWeatherMap docs](https://openweathermap.org/api).

---

## 🌓 UI Theme

- Dark grey / black primary background
- Light/white text and highlights
- Clean minimal design with refresh support

---

## 🛠️ Future Improvements

- Integrate hourly & weekly forecasts from OpenWeather API
- Real air quality data integration
- Better error handling and fallback
- User geolocation support
- Theme switcher (light/dark)

---

## 🤝 Contributing

Pull requests are welcome! For major changes, please open an issue first.

---

## 📄 License

This project is open source and available under the [MIT License](LICENSE).
