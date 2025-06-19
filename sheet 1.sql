create database sql_project;
use sql_project;
show tables;
select * from customer_income;
select * from loan_status;
select * from country_state;
select * from customer_det;
select * from region_info;

-- sheet 1 
-- criteria 1 
create table applicant_grade select applicantincome,
case 
when applicantincome >15000 then "Grade A"
when applicantincome >9000 then "Grade B"
when applicantincome > 5000 then "Middle class"
else "low class"
end as customer_grade from customer_income;
select * From applicant_grade;

-- criteria 2 
select * from customer_income;
create table monthly_intrest_criteria 
select applicantincome,property_area,
case 
when applicantincome < 5000 and property_area = "semiUrban"
then 2.5
when applicantincome < 5000 and property_area = "semirural"
then 3.5
when applicantincome < 5000 and property_area = "rural"
then 3
when applicantincome < 5000 and property_area = "Urban"
then 5
else 7
end as intrest from customer_income;
select * from monthly_intrest_criteria;
show tables;
select * from loan_status;
create table laon_app_status select loan_id,customer_id,loanamount,loan_amount_term, `cibil score` from loan_status;
select * from laon_app_status;
drop table loan_status;
rename table laon_app_status to loan_status;
select * from loan_status;
select * from customer_Det;
select * from customer_income;
select * from monthly_intrest_criteria;
create table customer_intrest_Analysis 
select l.loanamount, m.intrest*l.loanamount/100 as monthly_amount,m.intrest*l.loanamount*12/100 as yearly_Amount from loan_status l, monthly_intrest_criteria m;
select * from customer_intrest_analysis;
drop table customer_intrest_analysis;

-- sheet 1 end 


