CREATE DATABASE smart_university_db;
USE smart_university_db;

CREATE TABLE students (
  id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(100),
  roll_no VARCHAR(50),
  email VARCHAR(100),
  department VARCHAR(100),
  semester VARCHAR(50)
);

CREATE TABLE attendance (
  id INT AUTO_INCREMENT PRIMARY KEY,
  student_id INT,
  course_code VARCHAR(50),
  course_title VARCHAR(150),
  total_classes INT,
  attended_classes INT,
  percentage DECIMAL(5,2),
  FOREIGN KEY (student_id) REFERENCES students(id)
);

CREATE TABLE timetable (
  id INT AUTO_INCREMENT PRIMARY KEY,
  student_id INT,
  day_name VARCHAR(20),
  course_title VARCHAR(150),
  start_time VARCHAR(20),
  end_time VARCHAR(20),
  room_no VARCHAR(50),
  teacher_name VARCHAR(100),
  FOREIGN KEY (student_id) REFERENCES students(id)
);

CREATE TABLE assignments (
  id INT AUTO_INCREMENT PRIMARY KEY,
  student_id INT,
  course_title VARCHAR(150),
  title VARCHAR(255),
  description TEXT,
  due_date DATE,
  status VARCHAR(50),
  FOREIGN KEY (student_id) REFERENCES students(id)
);

CREATE TABLE events (
  id INT AUTO_INCREMENT PRIMARY KEY,
  title VARCHAR(255),
  description TEXT,
  event_date DATE,
  venue VARCHAR(150)
);

CREATE TABLE cafeteria_menu (
  id INT AUTO_INCREMENT PRIMARY KEY,
  item_name VARCHAR(150),
  category VARCHAR(100),
  price DECIMAL(10,2),
  available BOOLEAN DEFAULT TRUE
);

CREATE TABLE cafeteria_orders (
  id INT AUTO_INCREMENT PRIMARY KEY,
  student_id INT,
  item_name VARCHAR(150),
  quantity INT,
  total_price DECIMAL(10,2),
  order_status VARCHAR(50) DEFAULT 'Pending',
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (student_id) REFERENCES students(id)
);

CREATE TABLE announcements (
  id INT AUTO_INCREMENT PRIMARY KEY,
  student_id INT,
  teacher_name VARCHAR(100),
  course_title VARCHAR(150),
  message TEXT,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (student_id) REFERENCES students(id)
);

CREATE TABLE learning_resources (
  id INT AUTO_INCREMENT PRIMARY KEY,
  topic VARCHAR(255),
  category VARCHAR(100),
  answer_text TEXT,
  image_url VARCHAR(500),
  pdf_url VARCHAR(500),
  word_url VARCHAR(500),
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Sample Data
INSERT INTO students (name, roll_no, email, department, semester) VALUES ('Ali Khan', 'BSSE-001', 'ali@student.edu', 'Software Engineering', '5th');
INSERT INTO attendance (student_id, course_code, course_title, total_classes, attended_classes, percentage) VALUES (1, 'MAD-401', 'Mobile App Development', 30, 25, 83.33);
INSERT INTO timetable (student_id, day_name, course_title, start_time, end_time, room_no, teacher_name) VALUES (1, 'Monday', 'Mobile App Development', '09:00 AM', '10:30 AM', 'Lab-2', 'Sir Ahmed');
INSERT INTO assignments (student_id, course_title, title, description, due_date, status) VALUES (1, 'Mobile App Development', 'Flutter Fragments Lab', 'Create university app fragments', '2026-05-14', 'Pending');
INSERT INTO events (title, description, event_date, venue) VALUES ('AI in Software Development Seminar', 'A seminar about AI tools for developers', '2026-05-16', 'Main Auditorium');
INSERT INTO cafeteria_menu (item_name, category, price) VALUES ('Chicken Burger', 'Fast Food', 450), ('Tea', 'Drinks', 80), ('Sandwich', 'Fast Food', 250);
INSERT INTO announcements (student_id, teacher_name, course_title, message) VALUES (1, 'Sir Ahmed', 'Mobile App Development', 'Submit Flutter fragments lab by Thursday.');
INSERT INTO learning_resources (topic, category, answer_text, image_url, pdf_url, word_url) VALUES ('mobile app development worth', 'Mobile Development', 'Mobile app development is highly valuable because businesses, universities and startups need mobile-first services.', 'http://localhost:3000/uploads/images/mobile-dev.png', 'http://localhost:3000/uploads/documents/mobile-dev-guide.pdf', 'http://localhost:3000/uploads/documents/mobile-dev-guide.docx');
