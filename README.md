Smart university app
A full-stack, smart university management application designed to streamline campus life for students. Built with a Flutter frontend and a Node.js/MySQL backend, it provides a centralized platform for academic tracking, campus services, and intelligent AI assistance.

✨ Features
📊 Attendance Tracking: Monitor overall attendance percentages and view subject-wise breakdowns with color-coded progress indicators.

📅 Timetable Management: Access your daily class schedule, complete with professor details, timings, and room locations.

✏️ Assignment Dashboard: Track academic tasks with filtering options for pending, submitted, and overdue assignments.

🎉 Campus Events: Browse upcoming university events, check attendee counts, and register seamlessly.

🍽️ Cafeteria Menu & Ordering: View daily menus, check prices and ratings, and place food orders directly through the app.

📢 Announcements: Stay updated with official university news, categorized by department and priority levels.

🤖 AI Chatbot: Get instant answers regarding your schedule, attendance, assignments, and general university queries.

🛠️ Technology Stack
Frontend: Flutter, Dart, Material Design 3

Backend: Node.js, Express.js

Database: MySQL (via XAMPP)

🚀 Getting Started
Follow these steps to run the application on your local machine.

Prerequisites
Flutter SDK installed

Node.js installed

XAMPP installed (for Apache & MySQL)

1. Database Setup
Open the XAMPP Control Panel and start Apache and MySQL.

Navigate to http://localhost/phpmyadmin in your web browser.

Import the backend/setup.sql file to create the smart_university_db database and populate it with sample data.

2. Backend Setup
Open a terminal and navigate to the backend directory:

Bash
cd backend
Install the required Node.js dependencies:

Bash
npm install
Ensure your .env file in the backend folder contains the following:

Code snippet
PORT=3000
DB_HOST=localhost
DB_USER=root
DB_PASSWORD=
DB_NAME=smart_university_db
Start the development server:

Bash
npm run dev
(The API will be running on http://localhost:3000)

3. Frontend Setup
Open a new terminal and navigate to the frontend directory:

Bash
cd frontend
Install the Flutter dependencies:

Bash
flutter pub get
Run the application (ensure you have an emulator running or choose a web browser):

Bash
flutter run -d chrome
👨‍💻 Author
Ahmed Hassan (@Ahmed-hs-2005)
