const express = require('express');
const cors = require('cors');
require('dotenv').config();
const db = require('./db');

const app = express();

// Middleware
app.use(cors());
app.use(express.json());
app.use(express.urlencoded({ extended: true }));
app.use('/uploads', express.static('uploads'));

// ============================================
// ROOT ENDPOINT
// ============================================
app.get('/', (req, res) => {
  res.json({
    message: '🚀 Smart University Backend is Running',
    port: process.env.PORT,
    database: process.env.DB_NAME,
    timestamp: new Date()
  });
});

// ============================================
// STUDENT ENDPOINTS
// ============================================
app.get('/api/student/:studentId', (req, res) => {
  const { studentId } = req.params;
  db.query('SELECT * FROM students WHERE id = ?', [studentId], (err, rows) => {
    if (err) return res.status(500).json({ error: err.message });
    res.json(rows[0] || { message: 'Student not found' });
  });
});

// ============================================
// ATTENDANCE ENDPOINTS
// ============================================
app.get('/api/attendance/:studentId', (req, res) => {
  const { studentId } = req.params;
  db.query('SELECT * FROM attendance WHERE student_id = ?', [studentId], (err, rows) => {
    if (err) return res.status(500).json({ error: err.message });
    res.json(rows || []);
  });
});

// ============================================
// TIMETABLE ENDPOINTS
// ============================================
app.get('/api/timetable/:studentId', (req, res) => {
  const { studentId } = req.params;
  const days = ['Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday'];
  db.query(
    'SELECT * FROM timetable WHERE student_id = ? ORDER BY FIELD(day_name, "Monday", "Tuesday", "Wednesday", "Thursday", "Friday"), start_time',
    [studentId],
    (err, rows) => {
      if (err) return res.status(500).json({ error: err.message });
      res.json(rows || []);
    }
  );
});

// ============================================
// ASSIGNMENTS ENDPOINTS
// ============================================
app.get('/api/assignments/:studentId', (req, res) => {
  const { studentId } = req.params;
  db.query('SELECT * FROM assignments WHERE student_id = ? ORDER BY due_date', [studentId], (err, rows) => {
    if (err) return res.status(500).json({ error: err.message });
    res.json(rows || []);
  });
});

app.post('/api/assignments/update-status', (req, res) => {
  const { assignmentId, status } = req.body;
  db.query('UPDATE assignments SET status = ? WHERE id = ?', [status, assignmentId], (err, result) => {
    if (err) return res.status(500).json({ error: err.message });
    res.json({ message: 'Assignment status updated', result });
  });
});

// ============================================
// EVENTS ENDPOINTS
// ============================================
app.get('/api/events', (req, res) => {
  db.query('SELECT * FROM events ORDER BY event_date DESC', (err, rows) => {
    if (err) return res.status(500).json({ error: err.message });
    res.json(rows || []);
  });
});

app.post('/api/events/register', (req, res) => {
  const { eventId, studentId } = req.body;
  // You can add event_registrations table if needed
  res.json({ message: 'Registered for event successfully', eventId, studentId });
});

// ============================================
// CAFETERIA ENDPOINTS
// ============================================
app.get('/api/cafeteria/menu', (req, res) => {
  db.query('SELECT * FROM cafeteria_menu WHERE available = 1', (err, rows) => {
    if (err) return res.status(500).json({ error: err.message });
    res.json(rows || []);
  });
});

app.post('/api/cafeteria/order', (req, res) => {
  const { student_id, item_name, quantity, total_price } = req.body;
  
  if (!student_id || !item_name || !quantity || !total_price) {
    return res.status(400).json({ message: 'Missing required fields' });
  }
  
  const sql = 'INSERT INTO cafeteria_orders (student_id, item_name, quantity, total_price) VALUES (?, ?, ?, ?)';
  db.query(sql, [student_id, item_name, quantity, total_price], (err, result) => {
    if (err) return res.status(500).json({ error: err.message });
    res.status(201).json({ 
      message: 'Order placed successfully', 
      orderId: result.insertId,
      timestamp: new Date()
    });
  });
});

app.get('/api/cafeteria/orders/:studentId', (req, res) => {
  const { studentId } = req.params;
  db.query('SELECT * FROM cafeteria_orders WHERE student_id = ? ORDER BY created_at DESC', [studentId], (err, rows) => {
    if (err) return res.status(500).json({ error: err.message });
    res.json(rows || []);
  });
});

// ============================================
// ANNOUNCEMENTS ENDPOINTS
// ============================================
app.get('/api/announcements/:studentId', (req, res) => {
  const { studentId } = req.params;
  db.query('SELECT * FROM announcements WHERE student_id = ? ORDER BY created_at DESC', [studentId], (err, rows) => {
    if (err) return res.status(500).json({ error: err.message });
    res.json(rows || []);
  });
});

app.get('/api/announcements/all/public', (req, res) => {
  db.query('SELECT * FROM announcements ORDER BY created_at DESC LIMIT 20', (err, rows) => {
    if (err) return res.status(500).json({ error: err.message });
    res.json(rows || []);
  });
});

// ============================================
// CHATBOT ENDPOINTS
// ============================================
app.post('/api/chatbot/ask', (req, res) => {
  const { question } = req.body;
  
  if (!question) {
    return res.status(400).json({ message: 'Question is required' });
  }
  
  const allowed = ['software', 'web', 'mobile', 'flutter', 'node', 'database', 'api', 'programming', 'development', 'university', 'attendance', 'timetable', 'assignment', 'event'];
  const isAllowed = allowed.some(keyword => question.toLowerCase().includes(keyword));
  
  if (!isAllowed) {
    return res.json({ 
      answer: '📚 I can answer questions about: Software Development, Web Development, Mobile Development (Flutter), Node.js, Databases, APIs, University Services, Attendance, Timetable, Assignments, and Events.',
      imageUrl: null,
      pdfUrl: null,
      wordUrl: null
    });
  }
  
  db.query('SELECT * FROM learning_resources WHERE topic LIKE ? LIMIT 1', [`%${question}%`], (err, rows) => {
    if (err) return res.status(500).json({ error: err.message });
    
    const resource = rows && rows[0];
    const fallback = 'Software development, web development and mobile app development are popular skills because organizations need digital products, automation, APIs and mobile-first services. Flutter is excellent for cross-platform mobile development!';
    
    res.json({
      answer: resource ? resource.answer_text : fallback,
      imageUrl: resource?.image_url || null,
      pdfUrl: resource?.pdf_url || null,
      wordUrl: resource?.word_url || null,
      timestamp: new Date()
    });
  });
});

// ============================================
// ERROR HANDLING
// ============================================
app.use((err, req, res, next) => {
  console.error('Error:', err);
  res.status(500).json({ 
    message: 'Server Error', 
    error: err.message 
  });
});

// ============================================
// SERVER START
// ============================================
const PORT = process.env.PORT || 3000;
app.listen(PORT, () => {
  console.log('\n' + '='.repeat(50));
  console.log('🚀 Smart University Backend Started!');
  console.log('='.repeat(50));
  console.log(`📍 Server: http://localhost:${PORT}`);
  console.log(`📍 API Base: http://localhost:${PORT}/api`);
  console.log(`📍 Database: ${process.env.DB_NAME}`);
  console.log(`📞 Status: ✅ Running`);
  console.log('='.repeat(50) + '\n');
});
