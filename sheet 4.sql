use sql_project;

select * from customer_income;
select * from loan_status;
select * from country_state;
select * from customer_det;
select * from region_info;

/*
laon_id,cus_id,appincome,coappincome,area,loan_Status
loan_amount,loan_amount_term,cibil_Score,
customername,region_id,postal_code,segment,state,
gender,age,maried,education,self_employmentloan*/
-- output 1
Create table full_Details 
SELECT 
    a.*, 
    l.loanAmount, l.loan_Amount_term, l.`cibil score`, 
    s.Customer_name,d.Gender,d.Age,d.Married,d.Education,s.Region_id,s.Postal_Code,s.State
    ,d.Self_Employed
    ,R.REGION
FROM customer_income a 
INNER JOIN loan_Status l ON a.loan_id = l.loan_Id
INNER JOIN country_state s ON a.`customer id` = s.customer_id
INNER JOIN customer_det d ON a.`customer id` = d.`customer id`
INNER JOIN REGION_INFO R ON R.REGION_ID = S.REGION_ID;
select * From full_details;
-- ----------------------------------------------------------

/*SELECT 
    a.*, 
    l.loanAmount, l.loan_Amount_term, l.`cibil score`, 
    s.Customer_name,d.Gender,d.Age,d.Married,d.Education,s.Region_id,s.Postal_Code,s.State
    ,d.Self_Employed
    ,R.REGION
FROM customer_income a 
LEFT JOIN loan_Status l ON a.loan_id = l.loan_Id 
LEFT JOIN country_state s ON a.`customer id` = s.customer_id 
left JOIN customer_det d ON a.`customer id` = d.`customer id` 
left JOIN REGION_INFO R ON R.REGION_ID = S.REGION_ID 
where s.region_id is null or l.LOAN_ID is null or s.customer_id is null or s.customer_id is null or d.`customer id` is null or r.region_id is null;
*/
select * from customer_income;
select * from loan_status;
select * from country_state;
select * from customer_det;
select * from region_info;
select a.*,b.loanamount,b.loan_amount_term,b.`cibil score` from customer_income a 
left join loan_status b on a.`Customer ID` = b.Customer_id where b.customer_id = null;
-- output 3 
Create table high_Cibil 
SELECT 
    a.*, 
    l.loanAmount, l.loan_Amount_term, l.`cibil score`, 
    s.Customer_name,d.Gender,d.Age,d.Married,d.Education,s.Region_id,s.Postal_Code,s.State
    ,d.Self_Employed
    ,R.REGION,cs.ciblil_status
FROM customer_income a 
INNER JOIN loan_Status l ON a.loan_id = l.loan_Id
INNER JOIN country_state s ON a.`customer id` = s.customer_id
INNER JOIN customer_det d ON a.`customer id` = d.`customer id`
INNER JOIN REGION_INFO R ON R.REGION_ID = S.REGION_ID
inner join loan__cibil_score_status cs on a.loan_id = cs.loan_id
where cs.ciblil_status= "high cibil score";
show tables;
select * from high_cibil;
select * from loan__cibil_score_status;
select count(*) from high_Cibil;
-- output 4 

create table home_Corp
SELECT 
    a.*, 
    l.loanAmount, l.loan_Amount_term, l.`cibil score`, 
    s.Customer_name,d.Gender,d.Age,d.Married,d.Education,s.Region_id,s.Postal_Code,s.Segment,s.State
    ,d.Self_Employed
    ,R.REGION
FROM customer_income a 
INNER JOIN loan_Status l ON a.loan_id = l.loan_Id
INNER JOIN country_state s ON a.`customer id` = s.customer_id
INNER JOIN customer_det d ON a.`customer id` = d.`customer id`
INNER JOIN REGION_INFO R ON R.REGION_ID = S.REGION_ID where s.Segment = "home office" or s.Segment = "Corporate";
select * From home_corp;


