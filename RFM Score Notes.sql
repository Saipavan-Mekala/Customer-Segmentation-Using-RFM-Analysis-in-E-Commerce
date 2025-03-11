SELECT * FROM customer_data.sales;

# NOTE 



# 1. RECENCY SCORES : 
#       R Score	     Recency (Days since Last Purchase)	     Customer Type
#          5	           0 - 10 days	                     Very Recent Buyer
#          4	           11 - 30 days	                     Recent Buyer
#          3	           31 - 60 days	                     Moderate Buyer
#          2	           61 - 90 days	                     Inactive Buyer
#          1	           91+ days	                         Lost Customer

# 2. FREQUENCY SCORES : 
#   F-Score	     Frequency(Total Orders)	Customer Type
#      5	     50+orders	                Super Loyal Customer
#      4	     21 - 49 orders	            Loyal Customer
#      3	     10 - 20 orders	            Occasional Buyer
#      2	     5 - 9 orders	            Infrequent Buyer
#      1	     1 - 4 orders	            One-time Buyer 

# MONETARY SCORES
#    M Score	   Monetary (Total Spend $)	   Customer Type
#      5	         $10,000+	               VIP Customer
#      4	         $5,001 - $9,999	       High-Spender
#      3	         $1,000 - $5,000	       Medium-Spender
#      2	         $500 - $999	           Low-Spender
#      1	         $1 - $499	               Small Buyer