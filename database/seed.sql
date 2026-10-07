USE theater_booking;
INSERT INTO users(full_name,email,password_hash,phone,role) VALUES
('Admin','admin@theater.local','PBKDF2$120000$YWRtaW5zYWx0$BM1Me+lWoN3OQeEu+RFmqA98qe9XTYpzAVxhDeJzGPw=','9999999999','ADMIN'),
('Demo Customer','customer@theater.local','PBKDF2$120000$Y3VzdG9tZXJzYWx0$Lh2THehjUIti1AlTbfdNldlxxACebj2nVXiq3vw5ClI=','8888888888','CUSTOMER');
INSERT INTO movies(title,description,duration_minutes,genre,language,certificate,poster_url,trailer_url,release_date)
VALUES
('The Last Signal','A science-fiction mystery about a final transmission.',128,'Sci-Fi','English','U/A','https://images.unsplash.com/photo-1489599849927-2ee91cede3ba?w=700','https://www.youtube.com/','2026-09-01'),
('Chase Point','A fast-paced action thriller.',142,'Action','Tamil','U/A','https://images.unsplash.com/photo-1485846234645-a62644f84728?w=700','https://www.youtube.com/','2026-08-15'),
('Moonlight Stories','An uplifting collection of connected stories.',118,'Drama','Malayalam','U','https://images.unsplash.com/photo-1517604931442-7e0c8ed2963c?w=700','https://www.youtube.com/','2026-07-20');
INSERT INTO theaters(name,location) VALUES('Grand Cineplex','Salem'),('City Screens','Chennai');
INSERT INTO screens(theater_id,name,total_rows,total_columns) VALUES(1,'Screen 1',5,8),(1,'Screen 2',5,8),(2,'Screen 1',4,6);
INSERT INTO seats(screen_id,seat_row,seat_number,seat_type)
SELECT 1, CHAR(64+r.n), c.n, CASE WHEN r.n=1 THEN 'VIP' WHEN r.n=2 THEN 'PREMIUM' ELSE 'REGULAR' END
FROM (SELECT 1 n UNION ALL SELECT 2 UNION ALL SELECT 3 UNION ALL SELECT 4 UNION ALL SELECT 5) r
CROSS JOIN (SELECT 1 n UNION ALL SELECT 2 UNION ALL SELECT 3 UNION ALL SELECT 4 UNION ALL SELECT 5 UNION ALL SELECT 6 UNION ALL SELECT 7 UNION ALL SELECT 8) c;
INSERT INTO seats(screen_id,seat_row,seat_number,seat_type)
SELECT 2, CHAR(64+r.n), c.n, CASE WHEN r.n=1 THEN 'VIP' WHEN r.n=2 THEN 'PREMIUM' ELSE 'REGULAR' END
FROM (SELECT 1 n UNION ALL SELECT 2 UNION ALL SELECT 3 UNION ALL SELECT 4 UNION ALL SELECT 5) r
CROSS JOIN (SELECT 1 n UNION ALL SELECT 2 UNION ALL SELECT 3 UNION ALL SELECT 4 UNION ALL SELECT 5 UNION ALL SELECT 6 UNION ALL SELECT 7 UNION ALL SELECT 8) c;
INSERT INTO seats(screen_id,seat_row,seat_number,seat_type)
SELECT 3, CHAR(64+r.n), c.n, 'REGULAR'
FROM (SELECT 1 n UNION ALL SELECT 2 UNION ALL SELECT 3 UNION ALL SELECT 4) r
CROSS JOIN (SELECT 1 n UNION ALL SELECT 2 UNION ALL SELECT 3 UNION ALL SELECT 4 UNION ALL SELECT 5 UNION ALL SELECT 6) c;
INSERT INTO shows(movie_id,screen_id,show_date,start_time,end_time,regular_price,premium_price,vip_price)
VALUES
(1,1,DATE_ADD(CURDATE(),INTERVAL 1 DAY),'10:00:00','12:08:00',150,200,250),
(1,1,DATE_ADD(CURDATE(),INTERVAL 1 DAY),'18:00:00','20:08:00',180,230,280),
(2,2,DATE_ADD(CURDATE(),INTERVAL 2 DAY),'14:00:00','16:22:00',140,190,240),
(3,3,DATE_ADD(CURDATE(),INTERVAL 1 DAY),'19:00:00','20:58:00',120,160,210);
