show triggers;
drop trigger loan_null_Checker;

create table loan_status_backup select * from loan_status;
select * from loan_status_backup;
select * from loan_status;
truncate loan_status_backup;

delimiter ||
create trigger loan_null_checker before insert on loan_status_backup for each row
begin
if new.loanamount is null then set new.loanamount = "Loan still processing";
end if;
end ||
delimiter ;
insert into loan_status_backup select * from loan_status;
desc loan_status;

create table loan__cibil_Score_status
(
loan_id text,
loan_amount text,
cibile_Score int,
ciblil_status text
);
drop table loan__cibil_score_status;

truncate loan_status_backup;

select * from loan__cibil_Score_Status;
select * from loan_status_backup;
delimiter ::
cREATE TRIGGER cibil_score_checker
AFTER INSERT ON loan_status_backup
FOR EACH row
BEGIN
if new.`cibil score` > 900 then 
insert into loan__cibil_score_status values
(new.loan_Id,new.loanamount,new.`cibil score`,"high cibil score");
elseif new.`cibil score` >750 then
insert into loan__cibil_score_status values
(new.loan_Id,new.loanamount,new.`cibil score`,"NO PENALTY");
elseif new.`cibil score` > 0 then
insert into loan__cibil_score_status values
(new.loan_Id,new.loanamount,new.`cibil score`,"PENALTY Customers");
elseif new.`cibil score` <= 0 then
insert into loan__cibil_score_status values
(new.loan_Id,new.loanamount,new.`cibil score`,"Loan can't apply");
END if;
END ::
delimiter ;
insert into loan_status_backup select * from loan_status;
select * from loan_status_backup;
select * from loan__cibil_Score_status;


delete from loan__cibil_score_status where loan_amount = "loan still processing" or ciblil_status ="Loan can't apply"; 
alter table loan__cibil_score_status modify loan_amount int;

desc loan__cibil_score_status;
show tables;

