This query does the following:

- It uses a `WITH` clause to create a subquery named `RequiredSubjects`. This subquery lists the subjects that an instructor must be able to teach to be considered qualified.
- It selects the `Instructor` from the `Instructors` table where the Subject is in the list of required subjects.
- It groups the results by `Instructor`.
- It uses the HAVING clause to filter the results where the count of distinct subjects for an instructor is equal to the total count of required subjects. This ensures that the selected instructors can teach all required subjects.

The `GROUP BY` and `HAVING` clauses are necessary to count the number of different subjects each instructor can teach, and then to compare that count to the total number of required subjects. If an instructor can teach all required subjects, their count of distinct subjects will equal the total count of required subjects.

In the **'Q5_v2.sql'** file, for each instructor, I have subtracted the subjects they can teach from the required subjects. If there are no remaining subjects after the subtraction (which is achieved with the `MINUS` operator), it means the instructor can teach all required subjects.