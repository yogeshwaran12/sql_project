LOAN MANAGEMENT SYSTEM

Data set
1. customer income status
2. loan status
3. customer info
4. country state
5. region info

Sheet 1
•	Import table from sheet 1- customer income status
•	set customer criteria based on applicant income

Criteria
•	Applicant income >15,000 = grade a
•	Applicant income >9,000 = grade b
•	Applicant income >5000 = middle class customer
•	Otherwise low class
(Create this as new table)
Monthly interest percentage 
Criteria
•	Applicant income <5000 rural=3%
•	Applicant income <5000 semi rural=3.5%
•	Applicant income <5000 urban=5%
•	Applicant income <5000 semi urban= 2.5%
•	Otherwise =7%

New field creation based on interest
•	Calculate monthly interest amt and annual interest amt based on loan amt
•	Create all the above fields as a table 
•	Table name - customer interest analysis
(create this into a new table and connect with sheet 2 (loan status) bring the output)
____________________________________________________________________________
Sheet 2 - loan status
•	Create row level trigger for loan amt 
Criteria
•	Loan amt null = loan still processing
•	Create statement level trigger for cibil score
Criteria 
•	Cibil score >900 high cibil score
•	Cibil score >750 no penalty
•	Cibil score >0 penalty customers
•	Cibil score <=0 reject customers (loan cannot apply)
*Then delete the reject and loan still processing customers
*Update loan as integers
*Create all the above fields as a table 
*Table name - loan cibil score status details

_______________________________________________________________________
Sheet 3 - customer info
*Import the table
*Update gender and age based on customer id 
______________________________________________________________________
Sheet 4 and 5- country state and region
*Import the table 
*Join all the 5 tables without repeating the fields - output 1 *find the mismatch details using joins - output 2
Filtering information using inner join
* Filter high cibil score - output 3
* Filter home office and corporate - output 4
*Store all the outputs as procedure.
  

