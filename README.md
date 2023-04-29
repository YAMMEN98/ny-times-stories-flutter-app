# stories_app

A new Flutter project with Clean Architecture to fetch thw New Work Time
Stories, display story details, and see more about details.

## Getting Started

## Prerequisites

- Flutter SDK
- Android Studio or VS Code
- Dart plugin for your IDE

## Installing

- Clone the repository ```https://github.com/YAMMEN98/ny-times-stories-flutter-app.git```
- Open the project in Android Studio or VS Code.
- Run the app on an emulator or physical device.

## Feature

- Get all stories.
- Search a story.
- Filter stories by ```section```
- Display stories as ```List View``` or ```Grid View```
- Display story details.
- Apply Dark/Light theme.
- Apply localization en/ar languages.
- View Image And Zoom It.
- View story details from url by ```WebView```
- Created a lane to generate apk automatically when upload code to the main branch.


- Apply Unit Testing .

## Built With

- [Flutter](https://github.com/vedranMv/dataDashboard/releases) - The framework used).
- [The New Work a Times API](https://developer.nytimes.com/) - API used for weather data.
- ```Riverpod``` for State Management.
- ```Retrofit```  as a Third-Party to get stories data from API.

## Unit Test

To run test you should follow the steps:

- run command ```flutter test```.
- You can find coverage test file in ```/coverage``` folder in root app after run this.command ```flutter test --coverage```.

There is many tools to generate text coverage,
we will use [test_cov_console](https://pub.dev/packages/test_cov_console) to generate coverage
report, follow these steps to run it:

- Run the following command to make sure all flutter library is up-to-date ```flutter pub get```,
    - Run the following command to generate lcov.info on coverage
      directory ```flutter test --coverage```,
    - Run the tool to generate report from lcov.info to the
      console ```flutter pub run test_cov_console```,
      ![Text Coverage / Console](https://github.com/YAMMEN98/ny-times-stories-flutter-app/blob/main/coverage_test_console.png)

    - You can follow and see more of parameters
      in [test_cov_console](https://pub.dev/packages/test_cov_console).
    - You Can Output report to CSV file (-c, --csv, -o, --output)
      by ```flutter pub run test_cov_console -c --output=coverage/test_coverage.csv```
    - Open CSV file by excel and you will see like this result:

      ![Text Coverage / Excel](https://github.com/YAMMEN98/ny-times-stories-flutter-app/blob/main/coverage_test_excel.png)

## Author

Yamen Abdullrahman - Senior Flutter Developer;