# Personal Finance Dashboard (Power BI)

A simple, reusable Power BI dashboard to track your personal income, expenses, savings, and spending trends — built using Excel and Power BI. 
Ideal for personal use.

# What’s Included

- `Personal_Finance_Dashboard.pbix` — The Power BI dashboard file
- `Finance_Data_Template.xlsx` — Sample Excel data (replace the data values with your own — see the **"Note"** sheet inside the file for guidance)

# How to Use

1. **Download both files** and place them in the **same folder** on your computer.

2. **Open** `Personal_Finance_Dashboard.pbix` in Power BI Desktop.

3. **Update the Excel file path**:
   - Go to the **Home** tab → click **Transform Data**
   - In the Power Query Editor, locate the **`Excel_file_path`** parameter on the left
   - In the parameter window that appears, paste the **full folder path** (where your Excel file is saved) into the "Current Value" field  
     Example:  
     `C:\Users\YourName\Documents\FinanceDashboard`
   - Click **OK**, then click **Close & Apply** in the top menu

4. **Replace the sample data**:
   - Open `Finance_Data_Template.xlsx`
   - Replace the example records with your own financial data
   - Make sure to keep the same column structure and **do not delete the table format** (you can add rows freely)

5. **Refresh the dashboard**:
   - In Power BI, click **Refresh**
   - The visuals will update to reflect your own financial data

# Dashboard Features

- **Summary Cards**: Total income, total expenses, and net savings
- **Monthly Trend Line**: Compare income vs. expenses over time
- **Category Breakdown**: Bar chart of spending by category
- **Detailed Table**: See all transactions with filters
- **Interactive Slicers**: Filter by month, year, category, and account

# Having Trouble?

If Power BI can’t find the file or shows a "file not found" error:
- Double-check the folder path you entered in the `Excel_file_path` parameter
- Make sure the Excel file and the PBIX file are in the **same folder**
