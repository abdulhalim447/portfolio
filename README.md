# Abdul Halim - Flutter Developer Portfolio

A modern, responsive portfolio website built with Flutter Web to showcase Flutter development skills.

## Features

- Responsive design that works on mobile, tablet, and desktop
- Light and dark theme support
- Material 3 design with custom fintech-focused color scheme
- Interactive UI with animations
- Clean architecture with organized code structure
- Proper routing with Go Router

## Project Structure

```
lib/
  ├── core/
  │   ├── router/
  │   │   └── app_router.dart
  │   ├── theme/
  │   │   └── app_theme.dart
  │   └── widgets/
  │       ├── app_button.dart
  │       ├── app_drawer.dart
  │       ├── app_footer.dart
  │       ├── page_wrapper.dart
  │       ├── responsive_app_bar.dart
  │       └── section_title.dart
  ├── features/
  │   ├── about/
  │   │   └── about_page.dart
  │   ├── contact/
  │   │   └── contact_page.dart
  │   ├── home/
  │   │   └── home_page.dart
  │   ├── projects/
  │   │   └── projects_page.dart
  │   └── skills/
  │       └── skills_page.dart
  └── main.dart
```

### Directory Structure Explanation

- **core**: Contains shared components, utilities, and configurations
  - **router**: App navigation configuration with GoRouter
  - **theme**: Theme configuration for light and dark modes
  - **widgets**: Reusable widgets used across multiple features
- **features**: Feature-based organization, with each feature in its own directory
  - **about**: About page showing developer bio and experience
  - **contact**: Contact page with contact form and information
  - **home**: Home page with hero section
  - **projects**: Projects showcase page
  - **skills**: Skills and expertise showcase page
- **main.dart**: Entry point of the application

## Pages

- **Home** - Introduction and hero section
- **About** - Bio and professional journey
- **Skills** - Technical skills and expertise
- **Projects** - Showcase of Flutter projects
- **Contact** - Contact form and information

## Tech Stack

- Flutter 3.x
- Material 3 Design
- Go Router for navigation
- Responsive Framework for responsive design
- Font Awesome for icons
- URL Launcher for links
- Animated Text Kit for animations

## Getting Started

1. Clone the repository
2. Run `flutter pub get` to install dependencies
3. Run `flutter run -d chrome` to start the app in the browser

## Screenshots

Screenshots will be added after deployment.

## Deploy

To build for production:

```
flutter build web --release
```

## License

This project is licensed under the MIT License.

## Contact

Abdul Halim - contact@abdulhalim.com
