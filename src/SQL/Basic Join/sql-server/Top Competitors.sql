SELECT h.hacker_id, h.name
FROM Hackers h
INNER JOIN Submissions s ON h.hacker_id = s.hacker_id
INNER JOIN Challenges c ON s.challenge_id = c.challenge_id
INNER JOIN Difficulty d ON c.difficulty_level = d.difficulty_level
WHERE s.score = d.score AND c.difficulty_level = d.difficulty_level
GROUP BY h.hacker_id, h.name
HAVING COUNT(s.submission_id) > 1
ORDER BY COUNT(s.submission_id) DESC, hacker_id;
