# Architecture

Browser -> Java HTTP API -> JDBC -> MySQL.

Authentication uses an HttpOnly session cookie backed by a server-side in-memory session map. Booking creation runs in a JDBC transaction and relies on the database unique constraint `booking_seats(show_id, seat_id)` to prevent double booking.

For a production deployment, replace the simple JDK HTTP server with a servlet container and persistent/centralized session store, add CSRF protection, HTTPS, rate limiting and secret management.
