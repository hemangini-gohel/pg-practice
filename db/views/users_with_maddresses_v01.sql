SELECT
  u.id AS user_id,
  u.firstname AS user_name,
  a.street AS address_street,
  a.city AS address_city,
  a.state AS address_state,
  a.zip_code AS address_zip_code
FROM
  users u
LEFT JOIN
  addresses a ON u.id = a.user_id;