-- Índice para búsquedas por student_id en enrollments
-- Optimiza queries que buscan inscripciones de un estudiante específico
CREATE INDEX "idx_enrollments_student"
ON "enrollments"("student_id");

-- Índice para búsquedas por course_id en enrollments
-- Optimiza JOINs entre enrollments y courses
CREATE INDEX "idx_enrollments_course"
ON "enrollments"("course_id");

-- Índice compuesto para búsquedas en courses por semester, department y number
-- Optimiza queries que filtran por semestre, departamento y/o número de curso
CREATE INDEX "idx_courses_semester_dept_num"
ON "courses"("semester", "department", "number");

-- Índice compuesto para búsquedas por semester y title
-- Optimiza búsquedas LIKE con prefijo y filtro por semestre
CREATE INDEX "idx_courses_semester_title"
ON "courses"("semester", "title");

-- Índice para búsquedas por course_id en satisfies
-- Optimiza JOINs entre satisfies y courses/enrollments
CREATE INDEX "idx_satisfies_course"
ON "satisfies"("course_id");
