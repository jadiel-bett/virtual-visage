# Implementation Plan: Portfolio Optimization

## Overview

This implementation plan transforms the Flutter portfolio from a StatefulWidget-based hobbyist project into a production-ready showcase using Riverpod state management, decoupled data models, and modern Flutter architecture patterns. The implementation follows a bottom-up approach: SDK upgrade → data layer → state management → UI refactoring → web optimizations → testing.

## Tasks

- [x] 1. SDK and dependency upgrades
  - [x] 1.1 Upgrade Flutter SDK to 3.24+ and update pubspec.yaml
    - Update Flutter SDK to version 3.24.0 or higher
    - Update Dart SDK constraint to '>=3.5.0 <4.0.0'
    - Add flutter_riverpod: ^2.5.1, riverpod_annotation: ^2.3.5
    - Add url_launcher: ^6.3.0, share_plus: ^10.0.0
    - Update font_awesome_flutter to ^10.7.0
    - Add dev dependencies: riverpod_generator, build_runner
    - _Requirements: 3.1, 3.2, 3.4_
  
  - [x] 1.2 Fix deprecated API usage and verify compilation
    - Replace deprecated button widgets (FlatButton → TextButton, RaisedButton → ElevatedButton)
    - Update constructor key parameters to use super.key
    - Update url_launcher API calls to latest version
    - Run flutter clean && flutter pub get
    - Verify flutter build web --release completes successfully
    - _Requirements: 3.3, 3.5_

- [x] 2. Create data models and providers
  - [x] 2.1 Create ProjectModel class with immutable data structure
    - Create lib/models/project_model.dart
    - Define ProjectModel class with id, title, description, imageUrl, technologies, githubUrl, liveUrl, priority, category fields
    - Define ProjectCategory enum (featured, other)
    - Implement copyWith method for immutability
    - _Requirements: 2.1, 6.2_
  
  - [x] 2.2 Create ExperienceModel class with immutable data structure
    - Create lib/models/experience_model.dart
    - Define ExperienceModel class with id, company, position, duration, location, responsibilities, technologies, type, icon, iconColor fields
    - Define ExperienceType enum (mechatronics, software, hybrid)
    - Implement copyWith method for immutability
    - _Requirements: 2.2, 4.2_
  
  - [x] 2.3 Create projects data provider with featured projects
    - Create lib/providers/projects_provider.dart
    - Define projectsProvider as Provider<List<ProjectModel>>
    - Add Stima Tracker project (priority: 1, category: featured, technologies: Flutter, Firebase, IoT, ESP32)
    - Add Hedge Trimming Robot project (priority: 2, category: featured, technologies: ROS, Python, Computer Vision, Arduino)
    - Add IoTrix project (priority: 3, category: featured, technologies: Flutter, AWS IoT, MQTT, Node.js)
    - Add E-Movers project (priority: 4, category: featured, technologies: Flutter, Google Maps API, Firebase)
    - Add Blog App project (category: other, lower priority)
    - _Requirements: 2.1, 5.1, 5.2, 5.3, 5.4, 5.5, 6.2, 6.5_
  
  - [x] 2.4 Create experiences data provider with hybrid background narrative
    - Create lib/providers/experiences_provider.dart
    - Define experiencesProvider as Provider<List<ExperienceModel>>
    - Add experience entries highlighting Mechatronics and Software skills
    - Emphasize Fintech-relevant skills (state management, architecture patterns)
    - Emphasize Veno-relevant skills (IoT, embedded systems, robotics)
    - _Requirements: 2.2, 4.1, 4.2, 4.3, 4.4, 4.5_
  
  - [ ]* 2.5 Write property test for model update propagation
    - **Property 3: Model Update Propagation**
    - **Validates: Requirements 2.5**
    - Test that ProjectModel and ExperienceModel updates in providers propagate to UI components
    - Generate random model data and verify UI reflects changes without UI code modifications

- [x] 3. Implement Riverpod state management
  - [x] 3.1 Create ThemeProvider with StateNotifier
    - Create lib/providers/theme_provider.dart
    - Define ThemeState class with isDarkMode, primaryColor, accentColor fields
    - Implement ThemeNotifier extending StateNotifier<ThemeState>
    - Implement toggleTheme method to switch between light and dark themes
    - Define themeProvider as StateNotifierProvider
    - _Requirements: 1.1, 1.3_
  
  - [x] 3.2 Create NavigationProvider with StateNotifier
    - Create lib/providers/navigation_provider.dart
    - Define NavigationState class with currentIndex and currentRoute fields
    - Implement NavigationNotifier extending StateNotifier<NavigationState>
    - Implement navigateTo method to update navigation state
    - Define navigationProvider as StateNotifierProvider
    - _Requirements: 1.2, 1.4_
  
  - [x] 3.3 Wrap MyApp with ProviderScope
    - Update lib/main.dart to import flutter_riverpod
    - Wrap MyApp widget with ProviderScope in main() function
    - _Requirements: 1.1, 1.2_
  
  - [ ]* 3.4 Write property test for theme state reactivity
    - **Property 1: Theme State Reactivity**
    - **Validates: Requirements 1.1, 1.3**
    - Test that theme changes trigger rebuilds in all watching components
    - Generate random theme states and verify reactive updates
  
  - [ ]* 3.5 Write property test for navigation state updates
    - **Property 2: Navigation State Updates**
    - **Validates: Requirements 1.2, 1.4**
    - Test that navigation actions update NavigationProvider state correctly
    - Generate random valid indices and routes, verify state updates

- [x] 4. Checkpoint - Verify state management and data layer
  - Ensure all tests pass, ask the user if questions arise.

- [x] 5. Refactor UI components to use Riverpod and data models
  - [x] 5.1 Refactor FeatureProject component to consume ProjectModel
    - Update lib/UI/FeatureProject.dart to extend ConsumerWidget
    - Replace hardcoded project data with ProjectModel parameter
    - Use ref.watch(themeProvider) for theme-aware styling
    - Display project.title, project.description, project.imageUrl
    - Render technology tags from project.technologies list using Wrap widget
    - Add error handling for missing images with errorBuilder
    - Wrap with Semantics widget: label 'Project: ${project.title}'
    - _Requirements: 2.3, 6.1, 6.3, 6.4, 8.3_
  
  - [x] 5.2 Refactor Workbox component to consume ExperienceModel
    - Update lib/UI/Workbox.dart to extend ConsumerWidget
    - Replace hardcoded experience data with ExperienceModel parameter
    - Display experience.company, experience.position, experience.duration
    - Render responsibilities list from experience.responsibilities
    - Render technology tags from experience.technologies using Wrap widget
    - Use experience.icon and experience.iconColor for visual representation
    - Wrap with Semantics widget: label 'Experience: ${experience.position} at ${experience.company}'
    - _Requirements: 2.4, 4.1, 4.2, 4.3, 4.4, 8.4_
  
  - [x] 5.3 Update Home component to consume providers
    - Update lib/UI/Home.dart to extend ConsumerWidget
    - Use ref.watch(projectsProvider) to get project list
    - Sort projects by priority field (ascending order)
    - Filter featured projects (category == ProjectCategory.featured)
    - Use ref.watch(experiencesProvider) to get experience list
    - Pass ProjectModel instances to FeatureProject widgets
    - Pass ExperienceModel instances to Workbox widgets
    - _Requirements: 1.5, 2.3, 2.4, 5.6_
  
  - [x] 5.4 Update MobileHome component to consume providers
    - Update lib/UI/MobileHome.dart to extend ConsumerWidget
    - Use ref.watch(projectsProvider) to get project list
    - Sort projects by priority field (ascending order)
    - Use ref.watch(experiencesProvider) to get experience list
    - Pass ProjectModel instances to FeatureProject widgets
    - Pass ExperienceModel instances to Workbox widgets
    - _Requirements: 1.5, 2.3, 2.4, 5.6_
  
  - [ ]* 5.5 Write property test for project priority ordering
    - **Property 4: Project Priority Ordering**
    - **Validates: Requirements 5.6**
    - Test that projects are displayed in ascending priority order
    - Generate random project lists with random priorities, verify ordering
  
  - [ ]* 5.6 Write property test for featured projects presence
    - **Property 5: Featured Projects Presence**
    - **Validates: Requirements 5.1, 5.2, 5.3, 5.4**
    - Test that projectsProvider contains required featured projects
    - Verify presence of stima-tracker, hedge-trimming-robot, iotrix, e-movers with featured category
  
  - [ ]* 5.7 Write property test for technology tags display
    - **Property 6: Technology Tags Display**
    - **Validates: Requirements 6.1, 6.3**
    - Test that all technologies from ProjectModel appear in rendered output
    - Generate random project models with random technology lists, verify all tags displayed

- [x] 6. Implement Method component enhancements
  - [x] 6.1 Add resume download functionality to Method component
    - Update lib/UI/Method.dart to extend ConsumerWidget
    - Import url_launcher package
    - Implement downloadResume function using launchUrl with '/assets/resume/Jadiel_Bett_Resume.pdf'
    - Add ElevatedButton with download icon and "Download Resume" text
    - Wrap button with Semantics: label 'Download resume', button: true, hint: 'Opens resume in new tab'
    - Add try-catch error handling with SnackBar feedback
    - Display success SnackBar when download starts
    - Display error SnackBar with retry action on failure
    - _Requirements: 10.1, 10.2, 10.3, 10.4, 10.5_
  
  - [x] 6.2 Add social sharing functionality to Method component
    - Import share_plus package
    - Implement sharePortfolio function using Share.share with portfolio URL
    - Add IconButton with share icon
    - Wrap button with Semantics: label 'Share portfolio', button: true
    - Add try-catch error handling (silent failure for user cancellation)
    - _Requirements: 11.1, 11.2, 11.3, 11.4_
  
  - [ ]* 6.3 Write property test for resume download trigger
    - **Property 8: Resume Download Trigger**
    - **Validates: Requirements 10.2**
    - Test that clicking download button invokes downloadResume function
    - Mock url_launcher and verify launchUrl is called
  
  - [ ]* 6.4 Write property test for download feedback display
    - **Property 9: Download Feedback Display**
    - **Validates: Requirements 10.4**
    - Test that download initiation displays visual feedback
    - Verify SnackBar appears after download trigger
  
  - [ ]* 6.5 Write property test for share button trigger
    - **Property 10: Share Button Trigger**
    - **Validates: Requirements 11.2**
    - Test that clicking share button invokes share function
    - Mock share_plus and verify Share.share is called with correct URL

- [x] 7. Add SEO and accessibility enhancements
  - [x] 7.1 Add semantic labels to navigation elements
    - Update AppBar in Home.dart and MobileHome.dart
    - Wrap navigation IconButtons with Semantics widgets
    - Add labels: 'Navigate to home', 'Navigate to projects', 'Navigate to experience', 'Navigate to contact'
    - Set button: true for all navigation elements
    - _Requirements: 8.1, 8.2_
  
  - [x] 7.2 Update web/index.html with meta tags for social sharing
    - Add meta description tag with portfolio summary
    - Add meta keywords tag with relevant skills
    - Add Open Graph meta tags (og:title, og:description, og:image, og:url, og:type)
    - Add Twitter Card meta tags (twitter:card, twitter:title, twitter:description, twitter:image)
    - _Requirements: 11.5_
  
  - [ ]* 7.3 Write property test for semantic labels presence
    - **Property 7: Semantic Labels Presence**
    - **Validates: Requirements 8.2, 8.3, 8.4**
    - Test that all major UI components have Semantics widgets with non-empty labels
    - Generate random component trees and verify semantic labels exist

- [x] 8. Implement web renderer and performance optimizations
  - [x] 8.1 Configure auto web renderer in web/index.html
    - Update web/index.html script section
    - Set renderer: "auto" in engineInitializer.initializeEngine()
    - _Requirements: 7.1, 7.2_
  
  - [x] 8.2 Implement smooth scrolling physics
    - Create lib/utils/smooth_scroll_physics.dart
    - Define SmoothScrollPhysics class extending ScrollPhysics
    - Configure SpringDescription with mass: 80, stiffness: 100, damping: 1
    - Update Home.dart and MobileHome.dart to use ScrollConfiguration with SmoothScrollPhysics
    - Add dragDevices: touch, mouse, trackpad to ScrollConfiguration
    - _Requirements: 9.1, 9.2, 9.3, 9.4_
  
  - [x] 8.3 Add resume PDF asset to project
    - Create assets/resume/ directory
    - Add placeholder Jadiel_Bett_Resume.pdf file
    - Update pubspec.yaml assets section to include assets/resume/
    - _Requirements: 10.3, 10.5_

- [x] 9. Implement responsive layout preservation
  - [x] 9.1 Verify responsive layouts use LayoutBuilder
    - Review Home.dart and MobileHome.dart for LayoutBuilder usage
    - Ensure breakpoints: mobile (<600px), tablet (600-1200px), desktop (>1200px)
    - Verify layout adapts without page reload on viewport changes
    - _Requirements: 12.1, 12.2, 12.3, 12.4, 12.5_
  
  - [ ]* 9.2 Write property test for responsive layout selection
    - **Property 11: Responsive Layout Selection**
    - **Validates: Requirements 12.2, 12.3, 12.4**
    - Test that correct layout is selected based on viewport width
    - Generate random viewport widths and verify layout selection logic
  
  - [ ]* 9.3 Write property test for viewport change reactivity
    - **Property 12: Viewport Change Reactivity**
    - **Validates: Requirements 12.5**
    - Test that viewport changes trigger layout rebuilds without page reload
    - Simulate viewport size changes and verify reactive updates

- [x] 10. Checkpoint - Verify all features and integrations
  - Ensure all tests pass, ask the user if questions arise.

- [ ] 11. Unit testing for components and providers
  - [ ]* 11.1 Write unit tests for ThemeProvider
    - Create test/unit/providers/theme_provider_test.dart
    - Test initial theme state values
    - Test toggleTheme method switches isDarkMode
    - Test theme color updates on toggle
    - Target 100% coverage
  
  - [ ]* 11.2 Write unit tests for NavigationProvider
    - Create test/unit/providers/navigation_provider_test.dart
    - Test initial navigation state
    - Test navigateTo updates currentIndex and currentRoute
    - Test invalid index clamping
    - Target 100% coverage
  
  - [ ]* 11.3 Write unit tests for ProjectModel
    - Create test/unit/models/project_model_test.dart
    - Test constructor with all fields
    - Test copyWith method creates new instance with updated fields
    - Test equality and hashCode
    - Target 100% coverage
  
  - [ ]* 11.4 Write unit tests for ExperienceModel
    - Create test/unit/models/experience_model_test.dart
    - Test constructor with all fields
    - Test copyWith method creates new instance with updated fields
    - Test equality and hashCode
    - Target 100% coverage
  
  - [ ]* 11.5 Write unit tests for FeatureProject widget
    - Create test/unit/widgets/feature_project_test.dart
    - Test widget renders with ProjectModel data
    - Test technology tags display
    - Test error handling for missing images
    - Test semantic labels
    - Target 80% coverage
  
  - [ ]* 11.6 Write unit tests for Workbox widget
    - Create test/unit/widgets/workbox_test.dart
    - Test widget renders with ExperienceModel data
    - Test responsibilities list display
    - Test technology tags display
    - Test semantic labels
    - Target 80% coverage
  
  - [ ]* 11.7 Write unit tests for Method widget
    - Create test/unit/widgets/method_test.dart
    - Test resume download button renders
    - Test share button renders
    - Test download error handling with mocked url_launcher
    - Test share error handling with mocked share_plus
    - Target 90% coverage

- [ ] 12. Integration testing
  - [ ]* 12.1 Write integration test for full page rendering
    - Create test/integration/full_page_render_test.dart
    - Test Home page renders with mock project and experience data
    - Test MobileHome page renders with mock data
    - Verify all sections display correctly
  
  - [ ]* 12.2 Write integration test for navigation flow
    - Create test/integration/navigation_flow_test.dart
    - Test navigation through all sections
    - Verify NavigationProvider state updates
    - Test scroll-to-section functionality
  
  - [ ]* 12.3 Write integration test for theme switching
    - Create test/integration/theme_switching_test.dart
    - Test theme toggle updates all components
    - Verify theme colors propagate to UI
    - Test theme persistence across navigation

- [ ] 13. Final verification and build
  - [ ] 13.1 Run flutter analyze and fix any issues
    - Run flutter analyze
    - Fix any linting warnings or errors
    - Ensure code follows Flutter best practices
  
  - [ ] 13.2 Build web release and verify performance
    - Run flutter build web --release --web-renderer auto --tree-shake-icons
    - Verify build completes without errors
    - Test in browser for load time and rendering quality
    - _Requirements: 7.3, 7.4, 7.5_

## Notes

- Tasks marked with `*` are optional testing tasks and can be skipped for faster MVP delivery
- Each task references specific requirements for traceability
- Checkpoints ensure incremental validation at key milestones
- Property tests validate universal correctness properties from the design document
- Unit tests validate specific examples and error conditions
- The implementation follows a bottom-up approach: infrastructure → data → state → UI → optimizations
- All 12 correctness properties from the design are covered by property-based test tasks
- Resume PDF asset is a placeholder - user should replace with actual resume file
