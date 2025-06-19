show tables;
select * from customer_income;
select * from loan_status;
select * from country_state;
select * from customer_det;
select * from region_info;

-- Update gender and age based on customer id 
select * from customer_det; 

update customer_det
set Gender = case
when `Customer id` in ('IP43006', 'IP43016', 'IP43508', 'IP43577', 'IP43589', 'IP43593') then 'Female'
when `Customer id` in ('IP43018', 'IP43038') then 'Male'
else Gender
end,
Age = case 
when `Customer ID`= 'IP43007' then 45
when `Customer ID`= 'IP43009' then  32
else Age
end;
select * from customer_det;