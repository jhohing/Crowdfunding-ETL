-- Challenge Bonus queries.
-- 1. (2.5 pts)
-- Retrieve all the number of backer_counts in descending order for each `cf_id` for the "live" campaigns. 
SELECT COUNT(b.cf_id) AS backer_counts, b.cf_id
FROM backers b
INNER JOIN campaign c
ON c.cf_id = b.cf_id
WHERE c.outcome = 'live'
GROUP BY b.cf_id
ORDER BY backer_counts DESC


-- 2. (2.5 pts)
-- Using the "backers" table confirm the results in the first query.
SELECT COUNT(b.cf_id) AS backer_counts, b.cf_id
FROM backers b
GROUP BY b.cf_id
ORDER BY backer_counts DESC


-- 3. (5 pts)
-- Create a table that has the first and last name, and email address of each contact.
-- and the amount left to reach the goal for all "live" projects in descending order. 
SELECT con.first_name, con.last_name, con.email, cam.goal - cam.pledged as "Remaining Goal Amount"
INTO email_contacts_remaining_goal_amount
FROM contacts con
INNER JOIN campaign cam
ON cam.contact_id = con.contact_id
WHERE cam.outcome = 'live'
ORDER By "Remaining Goal Amount" DESC



-- Check the table
select * from email_contacts_remaining_goal_amount

-- 4. (5 pts)
-- Create a table, "email_backers_remaining_goal_amount" that contains the email address of each backer in descending order, 
-- and has the first and last name of each backer, the cf_id, company name, description, 
-- end date of the campaign, and the remaining amount of the campaign goal as "Left of Goal". 
SELECT DISTINCT con.email, con.first_name, con.last_name, ba.cf_id, cam.company_name, cam.description, 
cam.goal - cam.pledged as "Left of Goal"
INTO email_backers_remaining_goal_amount
FROM backers ba
INNER JOIN campaign cam
ON cam.cf_id = ba.cf_id
INNER JOIN contacts con
ON con.contact_id = cam.contact_id
WHERE cam.outcome = 'live'


-- Check the table
select * from email_backers_remaining_goal_amount

