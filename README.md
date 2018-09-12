Link to original dataset: https://catalog.data.gov/dataset/case-data-from-san-francisco-311-sf311-d42fc
(I couldn't upload it as it was too large)

I came across this dataset and thought it would be interesting to analyze some data related to legal cases. I didn't see any descriptions,
but it was easy enough to understand just by viewing it. I used mySQL Workbench and mySQL Command Line Client to do this project.


case_table.sql: 
A list of all the sql commands I used to manipulate and view the table. Each case has a date for when it was opened and closed. 
However, I noticed some values were missing. I could have examined these rows, but due to time constraints, I went ahead and deleted them.

The columns containing the dates were of type VARCHAR, and it wasn't formatted correctly, so I wasn't able to directly convert it into 
the date datatype. So, I created new columns where I could apply the correct format. I could have made changes to the same column, but I
just didn't want to risk it.


Case_Duration.csv:
I compared the days it took to close a case, with the number of cases that were closed in that time. Most cases were closed within a week
to 11 days. So, it made sense to divide the cases which were closed in this timeframe, and the ones that took longer.

Cases_Short.csv:
These are the cases that were closed quickly. The offenses were mainly dirty sidewalks, abandoned vehicles, graffiti, loose garbage, or
sewer issues.

Cases_Long.csv:
Almost all of these cases were related to tree maintainence. I assumed it was because these cases would involve real estate laws.

final_table.csv:
This is the table I got after all the manipulations. It has the new columns that were created.


