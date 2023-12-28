# World of payback

"World of payback App is a simple app with 3 screens based on the Swift language and SwiftUI.

For app implementation, I attempted to use SwiftUI + Composable Architecture + TCACoordinators 
(if you'd like to see a UIKit + RxSwift project, please check my project here: https://github.com/TimurAsayonok/testio-app).

After reading the main requirements from the documentation, the following were created:

- сreated a transaction list screen. Each transaction displays `bookingDate`, `partnerDisplayName`, `transactionDetail.description`, `value.amount`, and `value.currency` (randomly presented error or mocked data). By default, they're sorted by `bookingDate` from newest (top) to oldest (bottom).
- added a loading indicator when attempting to get transactions; if there's an error, an alert will appear.
- implemented communication if the app is offline.
- added a filter button on the transaction list. Users can filter the list by date or category.
- included the sum of value.amount; when a user applies filtering to the list, this value will change.
- created a Transaction details screen that presents `partnerDisplayName` and `transactionDetail.description`.

Additionally, based on general information from the documentation, the following features were added:

- added support for `Polish`, `English`, and `German` languages. To test, change the Scheme to `Production`, `Staging`, or `Development`; each represents a different language.
- added date formatting for different languages.
- enabled the use of `Production` and `Test` environments. To test, change the Scheme to `Production`, `Staging`, or `Development`. Production Scheme has Production environments and Staging, Development have Test environments.

Knowing that the app will be maintained and that 8 or more developers will add more features, the app was divided into packages. In this case, each new feature will be created in a separate package.

### 🤤 AppPackage
- `Sources`:
    - `LocalizationStrings` - Contains strings for each location (pl, en, de). A custom LocalizationHelper has been added, but in the future, I think it might be better to use tools to auto-generate this file, like SwiftGen.
    - `WorldOfPaybackApp` - The main package that will be included in the project.
    - `WorldOfPaybackAppComponents` - Contains reusable UI components.
    - `WorldOfPaybackAppCoordinator` - Contains TCA coordinator and Screen Router.
    - `WorldOfPaybackAppCore` - Contains the main logic for the app, configurations, and NetworkLayer.
    - `WorldOfPaybackAppModels` - Contains models for the app. In the future, I think it might be better to move some models under the Feature package.
    - `WorldOfPaybackAppTransactionsFeature` - Contains screens, API calls for the Transactions Feature.
    - `WorldOfPaybackAppWelcomeFeature` - Contains screens for the Welcome feature.
    - `WorldOfPaybackAppServices` - Contains different services like NetworkMonitor.
    - `WorldOfPaybackAppExtensions` - Contains extensions like Date+Extension.
- `Tests`: Contains tests for each Source."

### 🧰 Libs
- `swift-composable-architecture` - for managing app State
- `TCACoordinators` - The coordinator pattern in the Composable Architecture

### 📺 Screens
- Welcome screen
- Transaction List screen
- Transaction detail screen

### 🎨 Design
was created simple and minimal design
