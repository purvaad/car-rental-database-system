-- Drop the tables in reverse order of dependency
DROP TABLE Fall24_S003_T1_Transaction_For_By CASCADE CONSTRAINTS;
DROP TABLE Fall24_S003_T1_Loc_Has_Car CASCADE CONSTRAINTS;
DROP TABLE Fall24_S003_T1_Feedback_by_Customer CASCADE CONSTRAINTS;
DROP TABLE Fall24_S003_T1_Feedback_about_Car CASCADE CONSTRAINTS;
DROP TABLE Fall24_S003_T1_Feedback_about_Employee CASCADE CONSTRAINTS;
DROP TABLE Fall24_S003_T1_Customer CASCADE CONSTRAINTS;
DROP TABLE Fall24_S003_T1_Maintenance CASCADE CONSTRAINTS;
DROP TABLE Fall24_S003_T1_Employee CASCADE CONSTRAINTS;
DROP TABLE Fall24_S003_T1_Cars CASCADE CONSTRAINTS;
DROP TABLE Fall24_S003_T1_Rental_Location CASCADE CONSTRAINTS;