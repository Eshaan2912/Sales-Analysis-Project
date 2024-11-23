import pandas as pd

# Load the Excel dataset
file_path = '"C:\Users\Eshaan Srivastava\Desktop\Sales Analysis Project\sales_data.xlsx"'
df = pd.read_excel(file_path)

# Display the first few rows of the dataset
print("First 5 rows of the dataset:")
print(df.head())

# Total Sales by Region
total_sales_by_region = df.groupby('Region')['Total Amount'].sum()
print("\nTotal Sales by Region:")
print(total_sales_by_region)

# Total Sales Quantity by Product
total_sales_by_product = df.groupby('Product Name')['Quantity'].sum()
print("\nTotal Sales Quantity by Product:")
print(total_sales_by_product)

# Average Sale Price per Product
df['Sale Price'] = df['Total Amount'] / df['Quantity']
avg_sale_price = df.groupby('Product Name')['Sale Price'].mean()
print("\nAverage Sale Price by Product:")
print(avg_sale_price)
