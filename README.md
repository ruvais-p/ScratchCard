# Flutter Scratch Card App

This Flutter application features a scratch card interface where users can interact with scratch cards to reveal prizes. It utilizes the **Provider** package for state management, ensuring that the UI updates dynamically as users interact with the cards.

## Features

- Scratch cards to reveal prizes.
- Dynamic updating of the card list using Provider.
- Responsive design suitable for various screen sizes.
- Clean and organized code structure for easy modifications.

## Getting Started

### Prerequisites

Make sure you have the following installed:

- **Flutter SDK**
- **Dart SDK**
- An IDE (such as Visual Studio Code or Android Studio)

### Installation

1. Clone the repository:

   ```bash
   git clone https://github.com/your-username/scratch_card_app.git
   
## Key Classes and Functions
1. main.dart
The main entry point of the application.

dart
Copy code
void main() {
  runApp(const MyApp());
}

## MyApp Class
# Purpose: Initializes the application and sets the theme.
# Key Function:
# build: Builds the MaterialApp with ScratchCardScreen as the home widget.
## 2. ScratchCardScreen
A stateful widget that displays a grid of scratch cards.

# Key Variables:
cardsList: A list of maps, where each map contains the type and prize of each card.
Key Functions:
_removeCard: Removes a card from the cardsList based on its index.
build Method
Renders the app bar and a grid of cards using a Wrap widget to allow dynamic arrangement based on screen size.

## 3. Cards Class
A stateless widget representing an individual scratch card.

# Key Variables:
type: An integer indicating the type of card (affects its appearance).
prize: An integer indicating the prize associated with the card.
removeCard: A callback function to remove the card when it has been scratched off.
# Key Functions:
_backGroundImage: Returns the background image asset based on the card type.
_prizeImage: Returns the prize image asset based on the prize number.
build Method
Renders the card with a GestureDetector that opens a dialog when tapped, allowing the user to scratch off the card.

## 4. _dialogBuilder
A function within the Cards class that creates a dialog for scratching the card.

# Parameters:
scratchLayerImage: The background image shown when the card is scratched.
prizeImage: The image of the prize to be revealed.
# Key Logic:
Uses the Scratcher widget to track the scratching progress.
Reveals the prize when more than 75% of the card is scratched off.
Calls removeCard when the card is successfully scratched.
## 5. ScratchCardDetails
A stateless widget that displays details about the prize after a card is scratched.

# build Method
Renders a fullscreen image of the prize and includes a button to return to the main ScratchCardScreen.
Using Provider for State Management
This application uses the Provider package to manage the state of the scratch cards.

The ScratchCardProvider class holds the list of cards and notifies listeners when a card is removed. This allows the UI to update seamlessly when user actions occur.
To integrate Provider:

Wrap your MaterialApp with a ChangeNotifierProvider in main.dart.
Create a ScratchCardProvider class that extends ChangeNotifier.
Use Provider.of<ScratchCardProvider>(context) to access the provider in your widgets.

## Video Demo
   (https://github.com/ruvais-p/ScratchCard/blob/main/Screen%20Recording%202024-10-27%20112651.mp4)
