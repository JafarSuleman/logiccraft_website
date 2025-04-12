# LogicCraft Technologies - Website

A professional website for LogicCraft Technologies built with Flutter Web.

## Features

- Responsive design for desktop, tablet, and mobile views
- Interactive UI with animations
- About page with team information
- Services showcase
- Portfolio gallery
- Contact form
- Modern design with consistent branding

## Technology Stack

- **Framework**: Flutter Web
- **State Management**: GetX
- **Animations**: animate_do
- **Deployment**: GitHub Pages

## Live Demo

Visit the website at: https://yourusername.github.io/logiccraft_website/

## Getting Started

### Prerequisites

- Flutter SDK (channel stable, version 3.13.0 or newer)
- Git

### Running Locally

1. Clone the repository:
   ```bash
   git clone https://github.com/yourusername/logiccraft_website.git
   cd logiccraft_website
   ```

2. Get dependencies:
   ```bash
   flutter pub get
   ```

3. Run the web app:
   ```bash
   flutter run -d chrome
   ```

### Deployment

The website is automatically deployed to GitHub Pages using GitHub Actions. Any push to the `main` branch will trigger a new build and deployment.

To deploy manually:

1. Build the web app:
   ```bash
   flutter build web --release --base-href "/logiccraft_website/"
   ```

2. Deploy to GitHub Pages:
   - Enable GitHub Pages in your repository settings
   - Select the `gh-pages` branch as the source

## How to Customize

- **Images**: Replace images in the `assets/images/` directory
- **Content**: Modify text constants in `lib/core/constants/`
- **Styling**: Adjust theme settings in `lib/core/theme/app_theme.dart`
- **Team Members**: Update team data in `lib/controllers/about_controller.dart`
- **Services**: Modify service listings in `lib/controllers/services_controller.dart`

## License

This project is licensed under the MIT License - see the LICENSE file for details.

## Contact

For inquiries, please contact us at info@logiccraft.tech.
