-- 1. Cleanup (so you can run this script multiple times)
DROP TABLE IF EXISTS tasks;
DROP TABLE IF EXISTS projects;

-- 2. Create a Projects table
CREATE TABLE projects (
    project_id INTEGER PRIMARY KEY AUTOINCREMENT,
    title TEXT NOT NULL,
    language TEXT,
    difficulty_level INTEGER CHECK (difficulty_level BETWEEN 1 AND 5),
    is_completed BOOLEAN DEFAULT 0
);

-- 3. Create a Tasks table (linked to projects)
CREATE TABLE tasks (
    task_id INTEGER PRIMARY KEY AUTOINCREMENT,
    project_id INTEGER,
    description TEXT,
    priority TEXT DEFAULT 'Medium',
    FOREIGN KEY (project_id) REFERENCES projects(project_id)
);

-- 4. Insert some sample data
INSERT INTO projects (title, language, difficulty_level, is_completed) VALUES 
('Riptide BitTorrent Client', 'C#', 5, 0),
('Audio Streaming App', 'Kotlin', 4, 0),
('Physics Simulations', 'Python', 2, 1),
('Operating Systems Lab', 'C', 3, 1);

INSERT INTO tasks (project_id, description, priority) VALUES 
(1, 'Implement PeerID generation', 'High'),
(1, 'Setup handshake protocol', 'High'),
(2, 'Integrate ExoPlayer for audio', 'Medium'),
(2, 'Test Azure TTS API', 'Low'),
(4, 'Fix chmod permissions script', 'High');

-- 5. Run some interesting queries
-- Query A: See everything
SELECT * FROM projects;

-- Query B: Find all "High" priority tasks and which project they belong to
SELECT 
    p.title AS Project, 
    t.description AS Task, 
    t.priority
FROM projects p
JOIN tasks t ON p.project_id = t.project_id
WHERE t.priority = 'High';

-- Query C: Get a count of projects per language
SELECT language, COUNT(*) as total_projects 
FROM projects 
GROUP BY language;