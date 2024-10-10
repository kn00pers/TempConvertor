# TempConverter

TempConverter is a SwiftUI application that allows users to convert temperatures between different units, including Kelvin, Celsius, Fahrenheit, Rankine, and Reaumur. The application provides a user-friendly interface, enabling users to enter a temperature in one unit and see the converted value in another unit instantly.

## Features

- **Unit Conversion**: Convert temperatures between multiple units:
  - Kelvin
  - Celsius
  - Fahrenheit
  - Rankine
  - Reaumur
- **Responsive Design**: Beautifully designed UI with gradient backgrounds and responsive layout.
- **Error Handling**: Displays an alert message if a temperature value below absolute zero (0 Kelvin) is entered.
- **Unit Selection**: Easy selection of temperature units using a modal interface.

## Installation

To run the TempConverter application locally, follow these steps:

1. Clone the repository:

   ```bash
   git clone https://github.com/kn00pers/TempConverter.git

2. Open the project in Xcode:
   ```bash
   open TempConverter.xcodeproj

3. Build and run the application on a simulator or a physical device.
   

## Usage

1. Enter a temperature value in the input field.
2. Select the unit of the entered temperature.
3. The converted value will automatically display in the corresponding output field.
4. **Note**: Temperatures below 0 Kelvin are not valid and will trigger an alert indicating that this value is impossible to achieve.

## Contributing

Contributions are welcome! If you have suggestions for improvements or new features, feel free to fork the repository and submit a pull request.

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.
