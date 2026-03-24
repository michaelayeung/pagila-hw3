/*
 * List the first and last names of all actors who:
 * 1. have appeared in at least one movie in the "Children" category,
 * 2. but that have never appeared in any movie in the "Horror" category.
 */


SELECT first_name, last_name
FROM actor
JOIN film_actor USING (actor_id)
WHERE actor_id IN (
    SELECT actor_id
    FROM category
    JOIN film_category USING (category_id)
    JOIN film_actor USING (film_id)
    WHERE name = 'Children'
) AND actor_id  NOT IN (
    SELECT actor_id
    FROM category
    JOIN film_category USING (category_id)
    JOIN film_actor USING (film_id)
    WHERE name = 'Horror'
)
GROUP BY actor_id
ORDER BY last_name;
