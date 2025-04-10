# Freight Rate Finder

This project is a Flutter-based application designed to help users search for the best freight rates for their shipping needs. The application provides an intuitive interface to input shipment details, fetch real-time data, and display accurate freight rates based on user preferences.

## Features

**1. Origin and Destination Suggestions:**
- Auto-complete feature powered by an API for fetching origin and destination ports or locations.
- Real-time suggestions as users type in the fields.

**2. Include Nearby Ports Options:**
- Checkbox options to include nearby origin and destination ports for more flexible searches.

**3. Commodity and Cut-Off Date Selection:**
- Dropdown to select commodity type.
- Date picker for selecting the cut-off date.
  
**4. Shipment Type Selection:**
- Options to choose between FCL (Full Container Load) and LCL (Less than Container Load) shipments.

**5. Container Size Details:**
- Dropdown to select container sizes (e.g., 40' Dry, 40' Dry High, 45' Dry High).
- Displays internal dimensions (length, width, height) of selected container sizes dynamically.

## Technology Stack

- **Flutter:** Frontend framework for building cross-platform applications.
- **HTTP Package:** To fetch real-time suggestions for origin and destination fields via API calls.
- **intl Package:** For date formatting.

## Installation

**1. Clone the repository:**
```bash
git clone https://github.com/Ranvijaykumar9708/Freight_Rate_Finder.git
