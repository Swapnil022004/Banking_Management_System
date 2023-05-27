declare 
    table_name_v varchar(50); 
	choice_v varchar(10); 
 
	branch_id_v int; 
	plot_no_v int; 
	state_v varchar(20); 
    city_v varchar(20); 
    locality_v varchar(20); 
	v_bid Branch.B_id%TYPE; 
    v_plot_no Branch.Plot_no%TYPE; 
    v_locality Branch.Locality%TYPE; 
    v_city Branch.City%TYPE; 
    v_state Branch.State%TYPE; 
	cursor branch_cursor is 
        select * from Branch; 
 
	emp_id_v int; 
	f_name_v varchar(20); 
	l_name_v varchar(20); 
	gender_v varchar(1); 
	dob_v date; 
	post_v varchar(20); 
	house_no_v int; 
	v_emp_id Employee.Emp_id%TYPE; 
    v_house_no Employee.House_no%TYPE; 
	v_f_name Employee.F_name%TYPE; 
	v_l_name Employee.L_name%TYPE; 
	v_post Employee.Post%TYPE; 
    v_gender Employee.Gender%TYPE; 
    v_dob Employee.DOB%TYPE; 
	cursor employee_cursor is 
        select * from Employee; 
 
	customerid_v number; 
	v_customerid Customer.CustomerID%TYPE; 
	cursor customer_cursor is 
        select * from Customer; 
 
	account_no_v number; 
	balance_v number; 
	account_type_v varchar(10); 
	v_account_no Account.Account_no%TYPE; 
	v_balance Account.Balance%TYPE; 
	v_account_type Account.Account_type%TYPE; 
	cursor  account_cursor is 
        select * from Account; 
 
	interest_rate_v int; 
	v_interest_rate Savings.interest_rate%TYPE; 
	cursor  savings_cursor is 
        select * from Savings; 
 
	overdraft_amt_v number; 
	v_overdraft_amt Current1.overdraft_amt%TYPE; 
	cursor  current_cursor is 
        select * from Current1; 
 
 
	transaction_id_v number; 
	v_transaction_id Transactions1.transaction_id%TYPE; 
	cursor  transaction_cursor is 
        select * from Transactions1; 
 
 
	Trans_amt_v number; 
	Trans_type_v char(1); 
	Trans_time_v timestamp; 
	 
    v_Trans_type Transaction2nf.Trans_type%TYPE; 
	v_Trans_time Transaction2nf.Trans_time%TYPE; 
	v_Trans_amt Transaction2nf.Trans_amt%TYPE; 
	cursor  transaction2nf_cursor is 
        select * from Transaction2nf; 

	
	loan_no_v loan.loan_no%TYPE;			
    amount_v loan.amount%TYPE;	
    duration_v loan.duration%TYPE;	
	cursor loan_cursor is
        select * from loan;

	v_loan_no loan.loan_no%TYPE;	
    v_amount loan.amount%TYPE;	
    v_duration loan.duration%TYPE;

	payment_no_v number;
	pay_date_v timestamp;
	cursor payment_cursor is
        select * from payment;

	cursor payment2nf_cursor is 
        select * from payment2nf;

	v_payment_no payment2nf.payment_no%TYPE;
    v_pay_date payment2nf.pay_date%TYPE;
	 
     
begin 
	DBMS_OUTPUT.PUT_LINE('Which table do you want to access? branch, employee, customer, loan, payment, account, transaction'); 
	-- table_name_v:='payment2nf'; 
	table_name_v:='&table_name_v'; 
 
	if table_name_v='branch' then 
        DBMS_OUTPUT.PUT_LINE('Do you want to insert, update, delete or display data?'); 
		-- choice_v:='display'; 
		choice_v:='&choice_v'; 
 
		if choice_v='insert' then 
       		 DBMS_OUTPUT.PUT_LINE('Enter branch_id, plot_no, state, city, locality to insert'); 
      --       branch_id_v:='1'; 
   			-- plot_no_v:='19'; 
      --       state_v:='Delhi'; 
      --   	city_v:='Delhi'; 
      --       locality_v:='Paschim Vihar'; 
			branch_id_v:='&branch_id_v';
            plot_no_v:='&plot_no_v';
            state_v:='&state_v';
            city_v:='&city_v';
            locality_v:='&locality_v';
 
			insert into Branch(B_id, Plot_no, Locality, City, State) values(branch_id_v,plot_no_v,locality_v,city_v,state_v); 
			DBMS_OUTPUT.PUT_LINE('New data has been inserted into the table.'); 
 
		elsif choice_v='update' then 
            DBMS_OUTPUT.PUT_LINE('Enter branch_id, plot_no, state, city, locality to update'); 
      --       branch_id_v:='1'; 
   			-- plot_no_v:='20'; 
      --       state_v:='Uttar Pradesh'; 
      --   	city_v:='Kanpur'; 
      --       locality_v:='Azad Nagar'; 
			branch_id_v:='&branch_id_v';
            plot_no_v:='&plot_no_v';
            state_v:='&state_v';
            city_v:='&city_v';
            locality_v:='&locality_v';
 
			update Branch set  
                B_id=branch_id_v, 
            	Plot_no=plot_no_v, 
                Locality=locality_v, 
                City=city_v, 
                State=state_v 
                where B_id=branch_id_v; 
			DBMS_OUTPUT.PUT_LINE('Data has been updated in the table.'); 
 
		elsif choice_v='delete' then 
            DBMS_OUTPUT.PUT_LINE('Enter branch_id to delete'); 
			-- branch_id_v:='1'; 
			branch_id_v:='&branch_id_v';
            delete from branch where B_id= branch_id_v; 
			DBMS_OUTPUT.PUT_LINE('Data has been deleted from the table.'); 
 
		elsif choice_v='display' then 
			open branch_cursor; 
			loop  
                fetch branch_cursor into v_bid, v_plot_no, v_locality, v_city, v_state; 
				exit when branch_cursor%NOTFOUND; 
				DBMS_OUTPUT.PUT_LINE(v_bid || ' ' || v_plot_no || ' ' || v_locality || ' ' || v_city || ' ' || v_state); 
			end loop; 
			close branch_cursor; 
             
        ELSE 
        	DBMS_OUTPUT.PUT_LINE('Invalid choice. Please enter "insert", "update", "delete",or "display"'); 
    	END IF; 
 
 
	elsif table_name_v='employee' then 
        DBMS_OUTPUT.PUT_LINE('Do you want to insert, update, delete or display data?'); 
		-- choice_v:='display'; 
		choice_v:='&choice_v'; 
 
 
		if choice_v='insert' then 
             DBMS_OUTPUT.PUT_LINE('Enter emp_id, f_name, l_name, gender, dob, post, branch_id, house_no, state, city, locality to insert'); 
   --          emp_id_v:='101'; 
   --          f_name_v:='Rushil'; 
   --          l_name_v:='Agarwal'; 
   --          gender_v:='m'; 
   --          dob_v:='08-feb-2003'; 
			-- post_v:='Manager'; 
   --     		branch_id_v:='1'; 
   --          house_no_v:='19'; 
   --          state_v:='Uttar Pradesh'; 
   --          city_v:='Kanpur'; 
   --          locality_v:='Azad Nagar'; 
			emp_id_v:='&emp_id_v';
            f_name_v:='&f_name_v';
            l_name_v:='&l_name_v';
            gender_v:='&gender_v';
            dob_v:='&dob_v';
            post_v:='&post_v'
       		branch_id_v:='&branch_id_v';
            house_no_v:='&house_no_v';
            state_v:='&state_v';
            city_v:='&city_v';
            locality_v:='&locality_v';
 
			insert into Employee (Emp_id, B_id, F_name, l_name, Gender, DOB, Post, House_no, Locality, City, State) values(emp_id_v,branch_id_v,f_name_v,l_name_v,gender_v,dob_v,post_v,house_no_v,locality_v,city_v,state_v); 
			DBMS_OUTPUT.PUT_LINE('New data has been inserted into the table.'); 
 
		elsif choice_v='update' then 
            DBMS_OUTPUT.PUT_LINE('Enter emp_id, f_name, l_name, gender, dob, post, branch_id, house_no, state, city, locality to update'); 
   --          emp_id_v:='101'; 
   --          f_name_v:='Rushil'; 
   --          l_name_v:='Agarwal'; 
   --          gender_v:='m'; 
   --          dob_v:='08-feb-2003'; 
			-- post_v:='Manager'; 
   --     		branch_id_v:='1'; 
   --          house_no_v:='21'; 
   --          state_v:='Uttar Pradesh'; 
   --          city_v:='Kanpur'; 
   --          locality_v:='Vishnupuri';
			emp_id_v:='&emp_id_v';
            f_name_v:='&f_name_v';
            l_name_v:='&l_name_v';
            gender_v:='&gender_v';
            dob_v:='&dob_v';
            post_v:='&post_v'
       		branch_id_v:='&branch_id_v';
            house_no_v:='&house_no_v';
            state_v:='&state_v';
            city_v:='&city_v';
            locality_v:='&locality_v';
 
			update Employee set  
                Emp_id=emp_id_v, 
                B_id=branch_id_v, 
                F_name=f_name_v, 
                l_name=l_name_v, 
                Gender=gender_v, 
                DOB=dob_v, 
                Post=post_v, 
            	House_no=house_no_v, 
                Locality=locality_v, 
                City=city_v, 
                State=state_v 
                where Emp_id=emp_id_v; 
			DBMS_OUTPUT.PUT_LINE('Data has been updated in the table.'); 
 
		elsif choice_v='delete' then 
            DBMS_OUTPUT.PUT_LINE('Enter emp_id to delete.'); 
			-- emp_id_v:='101'; 
			emp_id_v:='&emp_id_v'; 
            delete from employee where Emp_id= emp_id_v; 
			DBMS_OUTPUT.PUT_LINE('Data has been deleted from the table.'); 
 
		elsif choice_v='display' then 
			open employee_cursor; 
			loop  
                fetch employee_cursor into v_emp_id, v_bid, v_f_name,v_l_name,v_gender,v_dob,v_post,v_house_no, v_locality, v_city, v_state; 
				exit when employee_cursor%NOTFOUND; 
				DBMS_OUTPUT.PUT_LINE(v_emp_id || ' ' || v_bid || ' ' || v_f_name || ' ' || v_l_name || ' ' || v_gender || ' ' || v_dob || ' ' || v_post || ' ' || v_house_no || ' ' || v_locality || ' ' || v_city || ' ' || v_state); 
			end loop; 
			close employee_cursor; 
             
        ELSE 
        	DBMS_OUTPUT.PUT_LINE('Invalid choice. Please enter "insert", "update", "delete",or "display"'); 
    	END IF; 
 
 
	elsif table_name_v='customer' then 
        DBMS_OUTPUT.PUT_LINE('Do you want to insert, update, delete or display data?'); 
		-- choice_v:='display'; 
		choice_v:='&choice_v'; 
		 
 
		if choice_v='insert' then 
             DBMS_OUTPUT.PUT_LINE('Enter customer_id, emp_id, f_name, l_name, gender, dob, post, branch_id, house_no, state, city, locality to insert'); 
   --          CustomerID_v:='8796543210'; 
			-- emp_id_v:='101'; 
   --          f_name_v:='Swapnil'; 
   --          l_name_v:='Chhabra'; 
   --          gender_v:='m'; 
   --          dob_v:='22-feb-2004'; 
   --     		branch_id_v:='1'; 
   --          house_no_v:='386'; 
   --          state_v:='New Delhi'; 
   --          city_v:='New Delhi'; 
   --          locality_v:='Janakpuri'; 
			customer_id_v:='&customer_id_v';
            emp_id_v:='&emp_id_v';
            f_name_v:='&f_name_v';
            l_name_v:='&l_name_v';
            gender_v:='&gender_v';
            dob_v:='&dob_v';
       		branch_id_v:='&branch_id_v';
            house_no_v:='&house_no_v';
            state_v:='&state_v';
            city_v:='&city_v';
            locality_v:='&locality_v';
	
			insert into Customer (CustomerID,Emp_id, B_id, F_name, l_name, Gender, DOB, House_no, Locality, City, State) values(CustomerID_v,emp_id_v,branch_id_v,f_name_v,l_name_v,gender_v,dob_v,house_no_v,locality_v,city_v,state_v); 
			DBMS_OUTPUT.PUT_LINE('New data has been inserted into the table.'); 
 
		elsif choice_v='update' then 
          DBMS_OUTPUT.PUT_LINE('Enter customer_id, emp_id, f_name, l_name, gender, dob, post, branch_id, house_no, state, city, locality to update'); 
         --    CustomerID_v:='8796543210'; 
         --    emp_id_v:='101'; 
         --    f_name_v:='Swapnil'; 
         --    l_name_v:='Chhabra'; 
         --    gender_v:='m'; 
         --    dob_v:='22-feb-2004'; 
       		-- branch_id_v:='1'; 
         --    house_no_v:='350'; 
         --    state_v:='New Delhi'; 
         --    city_v:='New Delhi'; 
         --    locality_v:='Janakpuri'; 
			customer_id_v:='&customer_id_v';
            emp_id_v:='&emp_id_v';
            f_name_v:='&f_name_v';
            l_name_v:='&l_name_v';
            gender_v:='&gender_v';
            dob_v:='&dob_v';
       		branch_id_v:='&branch_id_v';
            house_no_v:='&house_no_v';
            state_v:='&state_v';
            city_v:='&city_v';
            locality_v:='&locality_v';
 
			update Customer set  
                CustomerID=CustomerID_v, 
                Emp_id=emp_id_v, 
                B_id=branch_id_v, 
                F_name=f_name_v, 
                l_name=l_name_v, 
                Gender=gender_v, 
                DOB=dob_v, 
            	House_no=house_no_v, 
                Locality=locality_v, 
                City=city_v, 
                State=state_v 
                where CustomerID=CustomerID_v; 
			DBMS_OUTPUT.PUT_LINE('Data has been updated in the table.'); 
 
		elsif choice_v='delete' then 
 			DBMS_OUTPUT.PUT_LINE('Enter customer_id to delete.'); 
			-- CustomerID_v:='8796543210'; 
			CustomerID_v:='&CustomerID_v';
            delete from customer where CustomerID= CustomerID_v; 
			DBMS_OUTPUT.PUT_LINE('Data has been deleted from the table.'); 
 
		elsif choice_v='display' then 
			open customer_cursor; 
			loop  
                fetch customer_cursor into v_CustomerID,v_emp_id, v_bid, v_f_name,v_l_name,v_gender,v_dob,v_house_no, v_locality, v_city, v_state; 
				exit when customer_cursor%NOTFOUND; 
				DBMS_OUTPUT.PUT_LINE(v_CustomerID || ' ' ||v_emp_id || ' ' || v_bid || ' ' || v_f_name || ' ' || v_l_name || ' ' || v_gender || ' ' || v_dob || ' ' || ' ' || v_house_no || ' ' || v_locality || ' ' || v_city || ' ' || v_state); 
			end loop; 
			close employee_cursor; 
             
        ELSE 
        	DBMS_OUTPUT.PUT_LINE('Invalid choice. Please enter "insert", "update", "delete",or "display"'); 
    	END IF; 
 
	elsif table_name_v='account' then 
        DBMS_OUTPUT.PUT_LINE('Do you want to 1) Insert new account  2) Delete an account  3) See account details  4) Display all customer account details'); 

        -- choice_v:='insert'; 
		choice_v:='&choice_v'; 
		if choice_v='insert' then 
           
            CustomerID_v:='8796543210'; 
			account_no_v:='120783645982'; 
			balance_v:='10000'; 
			account_type_v:='savings'; 
 
			insert into CustomerHasAccounts (CustomerID,Account_no) values(CustomerID_v,account_no_v); 
			insert into Account (Account_no,Balance,Account_type ) values (account_no_v,balance_v,account_type_v);  
			if account_type_v='savings' then 
                interest_rate_v:='8'; 
				insert into Savings (Account_no,Interest_rate ) values (account_no_v,interest_rate_v);  
			elsif account_type_v='current' then 
 
                overdraft_amt_v:='100000'; 
				insert into Current1 (Account_no,Overdraft_amt ) values (account_no_v,overdraft_amt_v); 
			DBMS_OUTPUT.PUT_LINE('New data has been inserted into the table.'); 
 			end if;
		 
		elsif choice_v='delete' then 
 
			account_no_v:='120783645982'; 
            delete from Account where Account_no = account_no_v; 
			delete from CustomerHasAccounts where Account_no=account_no_v; 
			delete from Savings where Account_no=account_no_v; 
			delete from Current1 where Account_no=account_no_v; 
			DBMS_OUTPUT.PUT_LINE('Data has been deleted from the table.'); 
 
		elsif choice_v='display' then 
     
			account_no_v:='120783645982'; 
			open account_cursor; 
			open savings_cursor; 
			open current_cursor; 
			loop  
                fetch account_cursor into v_account_no,v_balance,v_account_type ; 
				exit when account_cursor%NOTFOUND; 
				select interest_rate into v_interest_rate from Savings where account_no=v_account_no; 
				select overdraft_amt into v_overdraft_amt from Current1 where account_no=v_account_no;  
				DBMS_OUTPUT.PUT_LINE(v_account_no|| ' ' ||v_balance || ' ' || v_account_type || ' ' || v_interest_rate || ' ' || v_overdraft_amt); 
			end loop; 
			close account_cursor; 
			close savings_cursor; 
			close current_cursor; 
 
		elsif choice_v='display_all' then 
			open account_cursor; 
			open savings_cursor; 
			open current_cursor; 
			loop  
                fetch account_cursor into v_account_no,v_balance,v_account_type ; 
				exit when account_cursor%NOTFOUND; 
				select interest_rate into v_interest_rate from Savings where account_no=v_account_no; 
				select overdraft_amt into v_overdraft_amt from Current1 where account_no=v_account_no;  
				DBMS_OUTPUT.PUT_LINE(v_account_no|| ' ' ||v_balance || ' ' || v_account_type || ' ' || v_interest_rate || ' ' || v_overdraft_amt); 
			end loop; 
			close account_cursor; 
			close savings_cursor; 
			close current_cursor; 
		 ELSE 
        	DBMS_OUTPUT.PUT_LINE('Invalid choice. Please enter "insert","delete","display",or "display_all"'); 			 
    	 END IF; 
	 
 
	elsif table_name_v='Transaction' then 
        DBMS_OUTPUT.PUT_LINE('What would you like to do: 1) Withdraw Cash 
        												 2) Deposit Cash 
        												 3) See Transaction History'); 
         
        -- choice_v:='deposit'; 
		choice_v:='&choice_v'; 
 
		if choice_v='withdraw' then 
             
            account_no_v:='120783645982'; 
			transaction_id_v:=TO_CHAR(DBMS_RANDOM.VALUE(1000000, 9999999)); 
			Trans_amt_v:='1000'; 
 
			UPDATE Account 
  			SET Balance = Balance - Trans_amt_v 
  			WHERE account_no = account_no_v; 
   
  			INSERT INTO transactions1 (Transaction_id,Account_no) VALUES (transaction_id_v, account_no_v); 
			INSERT INTO transaction2nf (Transaction_id,Trans_type,Trans_amt,Trans_time) VALUES (transaction_id_v,'Withdraw',Trans_amt_v,SYSDATE); 
   
  			COMMIT; 
 
		elsif choice_v='deposit' then 
             
            account_no_v:='120783645982'; 
			transaction_id_v:=TO_CHAR(DBMS_RANDOM.VALUE(1000000, 9999999)); 
			Trans_amt_v:='2000'; 
 
			UPDATE Account 
  			SET Balance = Balance + Trans_amt_v 
  			WHERE account_no = account_no_v; 
   
  			INSERT INTO transactions1 (Transaction_id,Account_no) VALUES (transaction_id_v, account_no_v); 
			INSERT INTO transaction2nf (Transaction_id,Trans_type,Trans_amt,Trans_time) VALUES (transaction_id_v,'Deposit',Trans_amt_v,SYSDATE); 
   
  			COMMIT; 
 
		elsif choice_v='history' then 
            account_no_v:='120783645982'; 
 
			FOR txn IN (SELECT Trans_amt,trans_time,Trans_type FROM Transactions1,Transaction2nf WHERE Transactions1.account_no = account_no_v and Transactions1.Transaction_id=Transaction2nf.Transaction_id ORDER BY trans_time DESC) 
  			LOOP 
 
		    DBMS_OUTPUT.PUT_LINE( ', Amount: ' || txn.Trans_amt || ', Date: ' || txn.Trans_time || ', Type:' || txn.Trans_type); 
  			END LOOP; 
 
		ELSE 
        	DBMS_OUTPUT.PUT_LINE('Invalid choice. Please enter "withdraw","deposit","history"'); 
			 
    	end if; 


	elsif table_name_v='loan' then 
        DBMS_OUTPUT.PUT_LINE('Do you want to insert, update, delete or display data?'); 
		-- choice_v:='display'; 
		choice_v:='&choice_v'; 
 
		if choice_v='insert' then 
			DBMS_OUTPUT.PUT_LINE('Enter loan_no, CustomerID, interest_rate, amount, duration to insert.');
   --          loan_no_v:='12345';
			-- CustomerID_v:='8796543210';
   --          interest_rate_v:='5';  
   --          amount_v:='100000';
   --          duration_v:='1';
			loan_no_v:='&loan_no_v';
			CustomerID_v:='&CustomerID_v';
            interest_rate_v:='&interest_rate_v';  
            amount_v:='&amount_v';
            duration_v:='&duration_v';
 
			insert into Loan values(loan_no_v,CustomerID_v,interest_rate_v ,amount_v, duration_v); 
			DBMS_OUTPUT.PUT_LINE('New data has been inserted into the table.'); 
 
		elsif choice_v='update' then 
            DBMS_OUTPUT.PUT_LINE('Enter loan_no, CustomerID, interest_rate, amount, duration to update.');
       		--          loan_no_v:='12345';
        	-- CustomerID_v:='8796543210';
   			--          interest_rate_v:='5';  
   			--          amount_v:='100000';
   			--          duration_v:='1';
			loan_no_v:='&loan_no_v';
			CustomerID_v:='&CustomerID_v';
            interest_rate_v:='&interest_rate_v';  
            amount_v:='&amount_v';
            duration_v:='&duration_v';
 
			update Loan set  
                Loan_no=loan_no_v, 
            	CustomerID=CustomerID_v, 
                Interest_rate=interest_rate_v, 
                Amount=amount_v, 
                Duration=duration_v 
                where Loan_no=loan_no_v; 
			DBMS_OUTPUT.PUT_LINE('Data has been updated in the table.'); 
 
		elsif choice_v='delete' then
            DBMS_OUTPUT.PUT_LINE('Enter loan_no to delete.');
			-- loan_no_v:='12345'; 
			loan_no_v:='&loan_no_v'; 
            delete from loan where Loan_no= loan_no_v; 
			DBMS_OUTPUT.PUT_LINE('Data has been deleted from the table.'); 
 
		elsif choice_v='display' then 
			open loan_cursor; 
			loop  
                fetch loan_cursor into v_loan_no, v_CustomerID, v_interest_rate, v_amount, v_duration; 
				exit when loan_cursor%NOTFOUND; 
				DBMS_OUTPUT.PUT_LINE(v_loan_no || ' ' || v_CustomerID || ' ' || v_interest_rate || ' ' || v_amount || ' ' || v_duration); 
			end loop; 
			close loan_cursor; 
             
        ELSE 
        	DBMS_OUTPUT.PUT_LINE('Invalid choice. Please enter "insert", "update", "delete",or "display"'); 
    	END IF; 


	elsif table_name_v='payment' then 
        DBMS_OUTPUT.PUT_LINE('Do you want to insert, update, delete or display data?'); 
		-- choice_v:='display'; 
		choice_v:='&choice_v'; 
 
		if choice_v='insert' then 
			DBMS_OUTPUT.PUT_LINE('Enter loan_no and payment_no to insert.'); 
   --          loan_no_v:='12345';
			-- payment_no_v:='67890';
			loan_no_v:='&loan_no_v';
			payment_no_v:='&payment_no_v';
			
 
			insert into payment values(loan_no_v,payment_no_v); 
			insert into payment2nf values(payment_no_v,amount_v,pay_date_v);
			DBMS_OUTPUT.PUT_LINE('New data has been inserted into the table.'); 
 
		elsif choice_v='update' then
            DBMS_OUTPUT.PUT_LINE('Enter loan_no and payment_no to update.'); 
   --          loan_no_v:='12345';
			-- payment_no_v:='67890';
			loan_no_v:='&loan_no_v';
			payment_no_v:='&payment_no_v';

			update payment set  
                Loan_no=loan_no_v, 
            	Payment_no=payment_no_v
                where Loan_no=loan_no_v and Payment_no=payment_no_v;

			DBMS_OUTPUT.PUT_LINE('Data has been updated in the table.'); 
 
		elsif choice_v='delete' then 
            DBMS_OUTPUT.PUT_LINE('Enter loan_no and payment_no to delete.'); 
			-- loan_no_v:='12345'; 
			-- payment_no_v:='67890';
			loan_no_v:='&loan_no_v'; 
			payment_no_v:='&payment_no_v';
            delete from payment where Loan_no= loan_no_v and Payment_no=payment_no_v; 
			-- delete from payment2nf where Payment_no=payment_no_v; 
			DBMS_OUTPUT.PUT_LINE('Data has been deleted from the table.'); 
 
		elsif choice_v='display' then 
			open payment_cursor; 
			loop  
                fetch payment_cursor into v_loan_no, v_payment_no; 
				exit when loan_cursor%NOTFOUND; 
				DBMS_OUTPUT.PUT_LINE(v_loan_no || ' ' || v_payment_no); 
			end loop; 
			close payment_cursor; 
             
        ELSE 
        	DBMS_OUTPUT.PUT_LINE('Invalid choice. Please enter "insert", "update", "delete",or "display"'); 
    	END IF; 


	elsif table_name_v='payment2nf' then 
        DBMS_OUTPUT.PUT_LINE('Do you want to insert, update, delete or display data?'); 
		-- choice_v:='display'; 
		choice_v:='&choice_v'; 
 
		if choice_v='insert' then 
			DBMS_OUTPUT.PUT_LINE('Enter payment_no, amount, pay_date to insert.');
			-- payment_no_v:='67890';
			-- amount_v:='10000';
			-- pay_date_v:='01-May-2023';
			payment_no_v:='&payment_no_v';
			amount_v:='&amount_v';
			pay_date_v:='&pay_date_v';
 
			insert into payment2nf values(payment_no_v,amount_v,pay_date_v); 
			DBMS_OUTPUT.PUT_LINE('New data has been inserted into the table.'); 
 
		elsif choice_v='update' then 
            DBMS_OUTPUT.PUT_LINE('Enter payment_no, amount, pay_date to update.');
   --          payment_no_v:='67890';
			-- amount_v:='10000';
			-- pay_date_v:='01-May-2023';
			payment_no_v:='&payment_no_v';
			amount_v:='&amount_v';
			pay_date_v:='&pay_date_v';
 
			update payment2nf set   
            	Payment_no=payment_no_v,
                amount=amount_v,
                pay_date=pay_date_v
                where Payment_no=payment_no_v;
			DBMS_OUTPUT.PUT_LINE('Data has been updated in the table.'); 
 
		elsif choice_v='delete' then 
            DBMS_OUTPUT.PUT_LINE('Enter payment_no to delete.');
			-- payment_no_v:='67890';
			payment_no_v:='&payment_no_v';
            delete from payment2nf where Payment_no=payment_no_v; 
			DBMS_OUTPUT.PUT_LINE('Data has been deleted from the table.'); 
 
		elsif choice_v='display' then 
			open payment2nf_cursor; 
			loop  
                fetch payment2nf_cursor into v_payment_no,v_amount,v_pay_date; 
				exit when payment2nf_cursor%NOTFOUND; 
				DBMS_OUTPUT.PUT_LINE(v_loan_no || ' ' || v_amount || ' ' || v_pay_date); 
			end loop; 
			close payment2nf_cursor; 
             
        ELSE 
        	DBMS_OUTPUT.PUT_LINE('Invalid choice. Please enter "insert", "update", "delete",or "display"'); 
    	END IF; 

end if;
end;
