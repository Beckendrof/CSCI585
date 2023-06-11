Here's how this query works:

- This query first selects projects where step 0 is completed, and then it ensures that the same PID has at least one row where step > 0. After this, it filters out any project that has any step greater than 0 that is also completed. The final result would be projects where only step 0 is completed, all other steps are waiting, and there is at least one step greater than 0.

If both conditions are true, the project ID is included in the result.

The final output :  
![Q3](Q3.png)