# Lead Manager

A mobile-first Lead Management System built with Flutter, designed for bike showroom owners to efficiently track leads, manage contact history, monitor follow-ups, and generate comprehensive business reports.

## 📋 Table of Contents

- [Overview](#overview)
- [Features](#features)
- [Technology Stack](#technology-stack)
- [Prerequisites](#prerequisites)
- [Installation](#installation)
- [Configuration](#configuration)
- [Usage](#usage)
- [Project Structure](#project-structure)
- [Development](#development)
- [Testing](#testing)
- [Deployment](#deployment)
- [Documentation](#documentation)
- [License](#license)

## 🎯 Overview

Lead Manager is a cross-platform mobile application that helps business owners systematically manage their sales pipeline. The application enables users to track potential customers, maintain detailed contact history, monitor follow-up schedules, and analyze business performance through comprehensive reports.

**Key Highlights:**
- 📱 Mobile-first design (iOS/Android)
- 🖥️ Desktop support (Windows, macOS, Linux)
- 🌐 Offline-first with cloud sync
- 📊 Real-time dashboard metrics
- 📄 PDF report generation

## ✨ Features

### Lead Management
- Create and manage leads with comprehensive information
- Product name autocomplete with suggestions
- Lead status tracking (Not Contacted, Contacted, Will buy, Already bought)
- Priority rating system (0%, 20%, 50%, 80%, 100%)
- Complete rating history with timestamps
- Edit and delete leads

### Contact History
- Log phone calls and in-person visits
- Add detailed notes and summaries for each contact
- Upload attachments (photos, documents, quotes)
- Update lead rating after contact interactions
- Chronological contact history view

### Follow-up Management
- Set and track next follow-up dates
- Automatic follow-up status categorization:
  - ✅ **DONE FOLLOW UP** - Follow-up completed
  - 📅 **FOLLOW UP** - Upcoming follow-up
  - 🔄 **IN PROGRESS** - Actively being worked on
  - ⚠️ **MISSED FOLLOW UP** - Overdue follow-up
- Missed follow-up detection and reporting

### Dashboard
- Real-time metric cards showing:
  - Done Follow-up count
  - Pending Follow-up count
  - In Progress count
  - Missed Follow-up count
- Quick navigation to filtered lead lists
- One-tap lead creation

### Reporting & Analytics
- Generate reports for any time period:
  - Daily, weekly, monthly, or custom date range
- Report metrics:
  - All leads state history
  - Done follow-up count
  - Missed follow-up count
  - Conversion rate calculation
- PDF export functionality
- Share reports via standard device sharing

### Additional Features
- Offline-first functionality with automatic sync
- Local notifications for follow-up reminders
- Quick call action from lead cards
- Search and filter capabilities
- Secure local data storage

## 🛠️ Technology Stack

### Frontend
- **Framework:** Flutter 3.x
- **Language:** Dart
- **State Management:** flutter_bloc (BLoC pattern)
- **UI:** Material Design

### Backend
- **Backend as a Service:** Supabase
  - PostgreSQL Database
  - Authentication (Email/Password)
  - Realtime subscriptions
  - Storage (for attachments)

### Local Storage
- **Database:** SQLite (via sqflite/drift)
- **Offline Sync:** Custom sync logic with Supabase

### Key Dependencies
- `flutter_bloc` - State management
- `supabase_flutter` - Backend integration
- `sqflite` / `drift` - Local database
- `pdf` - PDF generation
- `flutter_local_notifications` - Local notifications
- `url_launcher` - Phone dialing
- `share_plus` - File sharing
- `file_picker` / `image_picker` - File selection
- `intl` - Date/time formatting

## 📋 Prerequisites

Before you begin, ensure you have the following installed:

- **Flutter SDK** (latest stable version 3.x)
- **Dart SDK** (latest stable version)
- **Android Studio** or **VS Code** / **Cursor IDE**
- **Android SDK** (API 21+)
- **Supabase Account** ([Sign up here](https://supabase.com))
- **Git** (for version control)

## 🚀 Installation

### 1. Clone the Repository

```bash
git clone <repository-url>
cd lead_manager
```

### 2. Install Dependencies

```bash
flutter pub get
```

### 3. Set Up Supabase

1. Create a new project on [Supabase](https://supabase.com)
2. Note down your project URL and anon key
3. Run the database schema migrations (see [Database Schema](#database-schema) section)
4. Create a storage bucket named `contact-attachments`

### 4. Configure Environment Variables

Create a `.env` file in the root directory:

```env
SUPABASE_URL=your_supabase_project_url
SUPABASE_ANON_KEY=your_supabase_anon_key
```

Or configure directly in the app (see Configuration section).

### 5. Run the Application

```bash
# For Android
flutter run

# For iOS (macOS only)
flutter run -d ios

# For Web
flutter run -d chrome

# For Desktop (Linux/macOS/Windows)
flutter run -d linux  # or macos, windows
```

## ⚙️ Configuration

### Supabase Configuration

Update `lib/core/config/supabase_config.dart` (or equivalent) with your Supabase credentials:

```dart
const supabaseUrl = 'YOUR_SUPABASE_URL';
const supabaseAnonKey = 'YOUR_SUPABASE_ANON_KEY';
```

### Database Schema

Execute the SQL schema in your Supabase SQL Editor. The schema includes:

- `leads` - Main lead information
- `rating_history` - Complete rating change history
- `contact_history` - Contact logs
- `contact_attachments` - File attachments
- `product_names` - Product autocomplete data

See `PRD-v1.md` Section 5 for complete schema definitions.

### Row Level Security (RLS)

Ensure RLS policies are enabled on all tables. Users can only access their own data based on `user_id`.

## 📱 Usage

### Getting Started

1. **Login/Register**: Create an account or login with existing credentials
2. **Dashboard**: View overview metrics on the main dashboard
3. **Create Lead**: Tap the "+" button to add a new lead
4. **Manage Leads**: View, edit, or delete leads from the lead list
5. **Add Contacts**: Log interactions with leads through contact history
6. **Track Follow-ups**: Monitor follow-up dates and statuses
7. **Generate Reports**: Create and export reports for any time period

### Key Workflows

**Creating a Lead:**
1. Navigate to Dashboard
2. Tap "ADD LEAD" FAB
3. Fill in required fields (Name, Phone, Product, etc.)
4. Set follow-up date and status
5. Tap "SUBMIT"

**Logging a Contact:**
1. Open a lead from the lead list
2. Navigate to Contact History
3. Tap "+" to add new contact
4. Select contact type and add notes
5. Optionally update rating
6. Attach files if needed
7. Save contact

**Generating a Report:**
1. Navigate to Reports screen
2. Select date range (Daily/Weekly/Monthly/Custom)
3. Tap "Generate Report"
4. Review report data
5. Export as PDF and share

## 📁 Project Structure

```
lead_manager/
├── lib/
│   ├── core/
│   │   ├── config/          # App configuration
│   │   ├── constants/       # App constants
│   │   ├── database/        # Local database setup
│   │   └── utils/           # Utility functions
│   ├── data/
│   │   ├── models/          # Data models
│   │   ├── repositories/    # Repository implementations
│   │   └── datasources/     # Local & remote data sources
│   ├── domain/
│   │   ├── entities/        # Business entities
│   │   └── repositories/    # Repository interfaces
│   ├── presentation/
│   │   ├── bloc/            # BLoC implementations
│   │   ├── pages/           # Screen widgets
│   │   ├── widgets/         # Reusable widgets
│   │   └── themes/          # App themes
│   └── main.dart            # App entry point
├── android/                 # Android platform files
├── ios/                     # iOS platform files
├── web/                     # Web platform files
├── test/                    # Unit & widget tests
├── BRD-v1.md               # Business Requirements Document
├── PRD-v1.md               # Product Requirements Document
└── README.md               # This file
```

## 💻 Development

### Architecture

The application follows the **BLoC (Business Logic Component)** pattern:

- **Presentation Layer**: UI widgets and BLoC states
- **Business Logic Layer**: BLoC handlers for events
- **Data Layer**: Repositories and data sources
- **Domain Layer**: Business entities and use cases

### Code Style

Follow Flutter/Dart style guidelines:

```bash
# Format code
flutter format .

# Analyze code
flutter analyze
```

### Running Tests

```bash
# Run all tests
flutter test

# Run tests with coverage
flutter test --coverage
```

### Building for Production

```bash
# Android APK
flutter build apk --release

# Android App Bundle (for Play Store)
flutter build appbundle --release

# iOS (macOS only)
flutter build ios --release
```

## 🧪 Testing

### Unit Tests

Critical business logic functions are unit tested:
- Follow-up status calculation
- Rating history tracking
- Report metrics calculation
- Form validation

### Manual Testing Checklist

Refer to `PRD-v1.md` Section 9.2 for the complete manual testing checklist covering:
- Authentication
- Lead Management
- Contact History
- Follow-up Management
- Reports
- Offline Functionality
- Notifications

## 📦 Deployment

### Android (Google Play Store)

1. **Build App Bundle:**
   ```bash
   flutter build appbundle --release
   ```

2. **Create App Listing:**
   - App name, description, screenshots
   - Category and content rating
   - Privacy policy (if required)

3. **Upload and Submit:**
   - Upload AAB file to Google Play Console
   - Fill store listing details
   - Submit for review

See `PRD-v1.md` Section 10 for detailed deployment instructions.

### Minimum Requirements

- **Android:** API 21 (Android 5.0) or higher
- **iOS:** iOS 12.0 or higher (for future iOS release)

## 📚 Documentation

- **[BRD-v1.md](BRD-v1.md)** - Business Requirements Document
- **[PRD-v1.md](PRD-v1.md)** - Product Requirements Document

### Additional Resources

- [Flutter Documentation](https://flutter.dev/docs)
- [Supabase Flutter Guide](https://supabase.com/docs/guides/flutter)
- [BLoC Pattern](https://bloclibrary.dev)

## 🤝 Contributing

This is a private project. For any suggestions or issues, please contact the development team.

## 📝 License

[Add your license here]

## 👥 Contributors

- **Business Analyst & Technical PM:** Mozammal Hossain
- **Developer:** Nil_Paracetamol

## 📞 Support

For support, please contact the development team or create an issue in the project repository.

---

**Version:** 1.0.0  
**Last Updated:** January 2025  
**Status:** In Development
