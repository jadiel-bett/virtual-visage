<div align="center">

# 🚀 Personal Portfolio Website

[![Flutter](https://img.shields.io/badge/Flutter-02569B?style=for-the-badge&logo=flutter&logoColor=white)](https://flutter.dev/)
[![Dart](https://img.shields.io/badge/Dart-0175C2?style=for-the-badge&logo=dart&logoColor=white)](https://dart.dev/)
[![Netlify](https://img.shields.io/badge/Netlify-00C7B7?style=for-the-badge&logo=netlify&logoColor=white)](https://www.netlify.com/)

**A modern, responsive portfolio website built with Flutter**

[Live Demo](https://master--jadielbett.netlify.app/) • [Report Bug](https://github.com/yourusername/portfolio/issues) • [Request Feature](https://github.com/yourusername/portfolio/issues)

</div>

---

## 📋 Table of Contents

- [About](#about)
- [Features](#features)
- [Tech Stack](#tech-stack)
- [Getting Started](#getting-started)
  - [Prerequisites](#prerequisites)
  - [Installation](#installation)
  - [Running the Project](#running-the-project)
- [Project Structure](#project-structure)
- [Building for Production](#building-for-production)
- [Deployment](#deployment)
- [Screenshots](#screenshots)
- [Contributing](#contributing)
- [License](#license)
- [Contact](#contact)

---

## 🎯 About

A professional portfolio website showcasing skills, projects, and experience as a **Mechatronic Engineer** and **Software Developer**. Built with Flutter for seamless cross-platform performance, this portfolio demonstrates expertise in modern web development, responsive design, and clean architecture.

### Key Highlights

- ✨ Fully responsive design (Desktop, Tablet, Mobile)
- 🎨 Modern UI/UX with smooth animations
- 🚀 Fast loading and optimized performance
- 📱 Cross-platform compatibility
- 🌐 SEO-friendly web application

---

## ✨ Features

### 🏠 Home Section
- Eye-catching hero section with professional introduction
- Animated elements and smooth transitions
- Call-to-action buttons for quick navigation

### 👨‍💻 About Me
- Comprehensive overview of academic and professional background
- Skills showcase with visual representations
- Expertise in mechatronics, software development, and system automation

### 💼 Projects Portfolio
- Detailed project cards with descriptions and technologies used
- Featured projects including:
  - Hedge Trimming Robot (Final Year Project)
  - Mobile Application Development
  - Engineering and Automation Projects
- Live demo links and source code repositories

### 🛠️ Skills & Technologies
- Technical proficiencies display
- Categories: Programming, Frameworks, Tools, Hardware
- Technologies: Flutter, Arduino, Autodesk Inventor, C++, Python, Control Systems

### 📄 Resume/CV
- Downloadable resume in PDF format
- Up-to-date professional experience and qualifications

### 📞 Contact
- Multiple contact methods
- Social media integration (LinkedIn, GitHub, etc.)
- Contact form for direct communication

---

## 🛠️ Tech Stack

### Frontend Framework
- **Flutter** - UI toolkit for building natively compiled applications
- **Dart** - Programming language optimized for UI

### Key Dependencies
```yaml
flutter_sdk: ">=2.12.0 <3.0.0"
cupertino_icons: ^1.0.8
url_launcher: ^6.2.6
font_awesome_flutter: ^10.7.0
scroll_to_index: latest
web: ^0.5.1
```

### Hosting & Deployment
- **Netlify** - Continuous deployment and hosting
- **Git** - Version control

### Development Tools
- Flutter DevTools
- VS Code / Android Studio
- Git & GitHub

---

## 🚀 Getting Started

### Prerequisites

Before you begin, ensure you have the following installed:

- **Flutter SDK** (2.12.0 or higher)
  ```bash
  flutter --version
  ```
- **Dart SDK** (included with Flutter)
- **Git**
- A code editor (VS Code, Android Studio, or IntelliJ IDEA)
- Chrome browser (for web development)

### Installation

1. **Clone the repository**
   ```bash
   git clone https://github.com/yourusername/portfolio.git
   cd portfolio
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **Verify Flutter installation**
   ```bash
   flutter doctor
   ```

### Running the Project

#### Web Development
```bash
flutter run -d chrome
```

#### Mobile Development (Android)
```bash
flutter run -d android
```

#### Mobile Development (iOS)
```bash
flutter run -d ios
```

#### Hot Reload
Press `r` in the terminal to hot reload
Press `R` to hot restart

---

## 📁 Project Structure

```
portfolio/
├── lib/
│   ├── main.dart                 # Application entry point
│   ├── Model/
│   │   └── Method.dart           # Utility methods and helpers
│   ├── UI/
│   │   ├── About.dart            # About section
│   │   ├── FeatureProject.dart   # Featured projects section
│   │   ├── Home.dart             # Desktop home page
│   │   ├── HomePage.dart         # Main page wrapper
│   │   ├── MobileHome.dart       # Mobile responsive home
│   │   └── Work.dart             # Work experience section
│   └── Widget/
│       ├── AppBarTitle.dart      # Custom app bar
│       ├── CustomDrawer.dart     # Navigation drawer
│       ├── CustomText.dart       # Reusable text widgets
│       ├── MainTiitle.dart       # Section titles
│       ├── MobileProject.dart    # Mobile project cards
│       ├── MobileWork.dart       # Mobile work section
│       ├── MobileWorkBox.dart    # Mobile work items
│       ├── OSImages.dart         # Image widgets
│       ├── Workbox.dart          # Desktop work items
│       └── work_custom_data.dart # Work data models
├── images/                       # Image assets
├── web/                          # Web-specific files
├── android/                      # Android-specific files
├── pubspec.yaml                  # Project dependencies
└── README.md                     # Project documentation
```

---

## 🏗️ Building for Production

### Web Build
```bash
flutter build web --release
```
Output: `build/web/`

### Android APK
```bash
flutter build apk --release
```
Output: `build/app/outputs/flutter-apk/app-release.apk`

### Android App Bundle
```bash
flutter build appbundle --release
```
Output: `build/app/outputs/bundle/release/app-release.aab`

### iOS Build
```bash
flutter build ios --release
```

---

## 🌐 Deployment

### Netlify Deployment

1. **Build the project**
   ```bash
   flutter build web --release
   ```

2. **Deploy to Netlify**
   - Connect your GitHub repository to Netlify
   - Set build command: `flutter build web --release`
   - Set publish directory: `build/web`
   - Deploy!

### Manual Deployment
```bash
# Install Netlify CLI
npm install -g netlify-cli

# Deploy
netlify deploy --prod --dir=build/web
```

---

## 📸 Screenshots

> Add screenshots of your portfolio here to showcase the design and features

### Desktop View
![Desktop Home](screenshots/desktop-home.png)
![Desktop Projects](screenshots/desktop-projects.png)

### Mobile View
![Mobile Home](screenshots/mobile-home.png)
![Mobile Projects](screenshots/mobile-projects.png)

---

## 🤝 Contributing

While this is a personal portfolio project, feedback and suggestions are always welcome!

1. Fork the project
2. Create your feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

---

## 📝 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

---

## 📧 Contact

**Jadiel Bett Kipkosgei**

- Portfolio: [https://jadielbett.com/](Jadiel Bett)
- LinkedIn: [Your LinkedIn Profile](https://linkedin.com/in/yourprofile)
- GitHub: [Your GitHub Profile](https://github.com/yourusername)
- Email: your.email@example.com

---

<div align="center">

### ⭐ Star this repository if you found it helpful!

Made with ❤️ using Flutter

</div>
