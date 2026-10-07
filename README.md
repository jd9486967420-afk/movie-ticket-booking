# Theater Ticket Booking System

A runnable full-stack cinema booking application using HTML/CSS/Vanilla JS, Java 17, Maven, JDBC and MySQL 8+.

## Features
- Customer registration/login with PBKDF2 password hashing
- Movie catalogue and show schedules
- Live seat availability from MySQL
- Transactional booking with `(show_id, seat_id)` uniqueness protection
- Booking history and cancellation
- Admin dashboard with users/movies/shows/bookings/revenue statistics
- Responsive cinema-style UI

## Requirements
- JDK 17+
- Maven 3.9+
- MySQL 8+
- Windows/Linux/macOS

## 1. Database
Open MySQL Workbench or the mysql client:
```sql
SOURCE database/schema.sql;
SOURCE database/seed.sql;
```

## 2. MySQL password
This project is configured to use environment variables. For the requested local setup, the password is `Win@12345`.

Windows CMD:
```bat
set DB_HOST=localhost
set DB_PORT=3306
set DB_NAME=theater_booking
set DB_USER=root
set DB_PASSWORD=Win@12345
```
PowerShell:
```powershell
$env:DB_HOST="localhost"
$env:DB_PORT="3306"
$env:DB_NAME="theater_booking"
$env:DB_USER="root"
$env:DB_PASSWORD="Win@12345"
```
Do not commit real credentials to GitHub. `.env.example` documents the variables.

## 3. Build
```bash
mvn clean package
```

## 4. Run
Because the app uses the JDK HTTP server and serves files from `src/main/webapp`, run from the project root:
```bash
mvn exec:java -Dexec.mainClass=com.example.theater.Main
```
If your Maven setup does not have the exec plugin, run:
```bash
java -cp "target/classes;target/dependency/*" com.example.theater.Main
```
On Linux/macOS replace `;` with `:`.

## 5. Open
http://localhost:8080

## Demo accounts
Admin: `admin@theater.local` / `admin123`
Customer: `customer@theater.local` / `customer123`

## Important
- The database password is never sent to browser JavaScript.
- Change demo credentials before any real deployment.
- The sample poster URLs require internet access; the application logic itself runs locally.
- For production, use HTTPS, a managed session store, CSRF protection, rate limiting, secrets management and a production servlet/container.

## Project structure
`src/main/java` contains configuration, utility and HTTP controller code; `src/main/webapp` contains the frontend; `database` contains schema/seed SQL; `docs` contains architecture notes. A Windows launcher is included as `run-windows.bat`.
