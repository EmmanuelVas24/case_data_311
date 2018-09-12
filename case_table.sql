use case_data;

/*    Viewing wrong/missing data values in the date fields  */
select Opened from cases_table where ((Opened like '%AM') or (Opened like '%PM')) and ((Closed like '%AM') or (Closed like '%PM'));


/*     Deleting wrong/missing data  */
delete from cases_table where ((Opened not like '%AM') and (Opened not like '%PM')) or ((Closed not like '%AM') and (Closed not like '%PM'));


/*     CREATING NEW COLUMNS FOR CASE OPENED AND CLOSED DATES  */

ALTER TABLE `case_data`.`cases_table` 
ADD COLUMN `case_open_date` VARCHAR(45) NULL AFTER `Media_URL`;

ALTER TABLE `case_data`.`cases_table` 
ADD COLUMN `case_close_date` VARCHAR(45) NULL AFTER `case_open_date`;


/*    Populating data in new columns  */

SET SQL_SAFE_UPDATES = 0;
update case_data.cases_table set case_open_date = substring(Opened,1,10);
update case_data.cases_table set case_close_date = substring(Closed,1,10);


/*    Manipulating the date data so it can be converted into the Date datatype  */
SET SQL_SAFE_UPDATES = 0;
update case_data.cases_table set case_open_date = left((concat(substring(case_open_date,7,4),'/',case_open_date)),10);
update case_data.cases_table set case_close_date = left((concat(substring(case_close_date,7,4),'/',case_close_date)),10);

alter table cases_table modify column case_open_date date;
alter table cases_table modify column case_close_date date;



/*     Found that most cases take from 0-11 days to resolve  */

SELECT DATEDIFF(case_close_date,case_open_date) as Days, count(DATEDIFF(case_close_date,case_open_date)) as number_of_Cases from cases_table group by DATEDIFF(case_close_date,case_open_date) order by count(*) desc;


/*         Displays cases that took either a short or lond time to resolve  */
select CaseID,Status_Notes,Responsible_Agency,Category,Request_Type,Request_Details from cases_table where DATEDIFF(case_close_date,case_open_date) < 12;
select CaseID,Status_Notes,Responsible_Agency,Category,Request_Type,Request_Details from cases_table where DATEDIFF(case_close_date,case_open_date) > 12;





