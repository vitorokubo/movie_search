
# Movie Search

This project is an Android application where you can search for movie information through integration with the [OMDb API](https://www.omdbapi.com/). The project was created as part of a selection process requirement.

## How to Run the Application

You will need:

- Android SDK  
- Flutter SDK  
- An Android device in developer mode (if you want to run it on a physical device. You can also run it locally in the browser in a web version).

To run the app, you’ll need to create a **.env** file based on the provided **.env.example**, including your `API_KEY` from the [OMDb API](https://www.omdbapi.com/).  
The API key will be sent to the selection team via email for security purposes.

Once the `.env` file is added, run the following command in your terminal:

```bash
flutter run
```

## About the Project

The project was created following the specified requirements, such as the use of `Dio`, `Bloc`, and `shared_preferences` libraries, and a layered architecture.  
Best practices like *clean code* principles and separation of concerns were followed, where business logic is isolated from the UI using Bloc.

The result is a simple yet effective movie search app, with a clean and responsive interface.

## ✅ Requirements Met

### Features

- [x] Movie search screen (text input + search button)
- [x] Display results in a list with:
  - [x] Title
  - [x] Poster
  - [x] Release year
- [x] Movie details screen with:
  - [x] Title
  - [x] Highlighted poster
  - [x] Year, genre, synopsis
- [x] Locally store the last 5 searched movies
- [x] Display the last 5 movies in the "Recent" tab

### Technical Requirements

- [x] Flutter + Dart
- [x] Use of `dio` for HTTP requests
- [x] State management with `Bloc`
- [x] Layered architecture (minimum: `data`, `domain`, `presentation`)
- [x] Local persistence with `shared_preferences` or similar
- [x] Basic responsiveness

## 🧪 Achieved Results

### Home screen  
<img src="./images/tela.png" />

### After searching for a movie  
<img src="./images/tela1.png" />

### Movie details  
<img src="./images/tela2.png" />

### "Recent" tab showing the last 5 searched movies  
<img src="./images/tela3.png" />

## 🗂 Folder Structure

```
lib/
├── app/                          # Business rules and contracts layer
│   ├── data/                     # Application logic and services
│   │   ├── models                # Data models
│   │   ├── repositories          # Repository interfaces (data access)
│   ├── domain/                   # Application domain logic
│   │   ├── bloc                  # Domain entities (business concepts)
│   │   ├── services/             # Business rules
│   ├── presentation/             # Presentation layer (UI)
│   │   ├── screens               # App screens
│   │   ├── theme                 # Theme configuration (colors, fonts)
│   │   ├── widgets               # Reusable UI components
test/                             # Automated tests
```

## 💡 Future Ideas

- Integrate with Firebase for account creation and authentication.  
- Use a dedicated dependency injection library.  
- Add the ability to mark movies as favorites and store them locally.  
- Create a dedicated tab to show favorite movies.
