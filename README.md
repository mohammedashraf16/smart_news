# Smart News App

Smart News is a dynamic news application built with Flutter that allows users to browse, search, and read the latest news articles from various sources around the world. The app is structured using the BLoC pattern for efficient state management and fetches data from the NewsAPI.

## Features

- **Browse by Category**: Explore news across various categories like Business, Technology, Sports, Health, and more.
- **Source Selection**: Filter news articles by specific sources within each category.
- **Search Functionality**: Easily search for news articles on any topic.
- **Article Details**: View a detailed screen for each news article, including the title, description, and source.
- **View Full Article**: Seamlessly open the original news article in an external browser.
- **Clean UI**: A user-friendly interface with a custom theme and intuitive navigation.

## Tech Stack & Architecture

- **Framework**: Flutter
- **State Management**: BLoC (Cubit)
- **Networking**: `http` package for making API calls to the [NewsAPI](https://newsapi.org/).
- **Dependency Management**: Pub
- **Key Dependencies**:
  - `flutter_bloc`: For state management.
  - `http`: For network requests.
  - `google_fonts`: For custom text styling.
  - `url_launcher`: To open article URLs in the browser.
  - `loader_overlay`: To display loading indicators during data fetching.

The project follows a feature-driven architecture, separating the code into logical modules like `home`, `categories`, `search`, and `splash`. This promotes scalability and maintainability.

## Project Structure

The `lib` directory is organized as follows:
```
lib/
├── core/             # Core utilities like constants (API keys, endpoints).
├── features/         # Main application features.
│   ├── bloc/         # BLoC/Cubit logic, states, and observer.
│   ├── categories/   # Category selection screen and widgets.
│   ├── home/         # Home screen, data models, and main news feed.
│   ├── search/       # Search functionality and UI.
│   └── splash/       # Splash screen implementation.
├── theme/            # Application-wide theme data.
└── main.dart         # App entry point and route configuration.
```
## Samples of implementation
<img width="600" height="600" alt="Image" src="https://github.com/user-attachments/assets/6cdd657e-1b55-4eff-b1fa-d85230c5e65e" />

## Getting Started

To get a local copy up and running, follow these simple steps.

### Prerequisites

- Flutter SDK installed on your machine.
- An API key from [NewsAPI](https://newsapi.org/).

### Installation

1.  **Clone the repository:**
    ```sh
    git clone https://github.com/mohammedashraf16/smart_news.git
    ```

2.  **Navigate to the project directory:**
    ```sh
    cd smart_news
    ```

3.  **Update API Key:**
    Open `lib/core/constants/constants.dart` and replace the placeholder `apiKey` with your own key from NewsAPI.
    ```dart
    abstract class Constants {
      static const String baseUrl = "newsapi.org";
      static const String endPoint = "/v2/top-headlines/sources";
      static const String endPointNews = "/v2/everything";
      static const String apiKey = "YOUR_API_KEY_HERE"; // Replace with your key
    }
    ```

4.  **Install dependencies:**
    ```sh
    flutter pub get
    ```

5.  **Run the application:**
    ```sh
    flutter run
