-- Tìm 5 người đã like nhà hàng nhiều nhất
SELECT u.user_id, u.full_name, u.email , COUNT(lr.user_id) as total_likes 
FROM "public"."user" as u
JOIN "public".like_res as lr
ON u.user_id = lr.user_id
GROUP BY u.user_id, u.full_name, u.email
ORDER BY total_likes DESC
LIMIT 5;

-- Tìm 2 nhà hàng có lượt like nhiều nhất
SELECT res.res_id, res.res_name, COUNT(lr.res_id) as total_likes
FROM "public".restaurant as res
JOIN "public".like_res as lr
ON res.res_id = lr.res_id
GROUP BY res.res_id, res.res_name
ORDER BY total_likes DESC
LIMIT 2

-- Tìm người đã đặt hàng nhiều nhất
SELECT u.user_id, u.full_name, u.email, COUNT(od.user_id) as total_orders
FROM "public"."user" as u
JOIN "public"."order" as od
ON u.user_id = od.user_id
GROUP BY u.user_id, u.full_name, u.email
ORDER BY total_orders DESC
LIMIT 1

-- Tìm người dùng không hoạt động trong hệ thống
SELECT u.user_id, u.full_name, u.email
FROM "public"."user" as u
LEFT JOIN "public".like_res as lr
ON u.user_id = lr.user_id
LEFT JOIN "public".rate_res as rr
ON u.user_id = rr.user_id
LEFT JOIN "public"."order" as o
ON u.user_id = o.user_id
WHERE o.user_id IS NULL 
  AND lr.user_id IS NULL 
  AND rr.user_id IS NULL;