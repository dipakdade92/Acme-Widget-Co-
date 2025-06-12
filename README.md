This basket system calculates the total cost of an order by following a clear, step-by-step process that includes product lookup, discount application, and delivery fee calculation. Here’s how it works:

System Initialization The system starts by setting up:

A catalog of products with their codes, names, and prices.

A set of delivery rules that define how much shipping costs based on the total order amount.

A list of offers (discount rules), such as “buy one red widget, get the second at half price.”

Adding Products Products are added to the basket using their product code (e.g., "R01" for Red Widget). For each product code:

The system looks up the full product details (name and price) from the catalog.

The product is stored in the basket's list of items.

Subtotal Calculation Once all items are added, the system calculates the subtotal by summing the prices of all products in the basket.

Applying Offers The system then checks which offers or promotions can be applied. For example, if there are two or more red widgets, every second one receives a 50% discount. The total discount amount is calculated and subtracted from the subtotal.

Calculating Delivery Fee After applying discounts, the system checks the adjusted total to determine the appropriate delivery charge based on the defined thresholds:

Orders under $50 have a higher delivery fee.

Orders between $50 and $90 have a reduced fee.

Orders over $90 get free delivery.

Final Total Calculation The final total is the result of:

Subtotal

Minus any discounts

Plus the applicable delivery fee This total is then rounded and formatted as a currency amount (e.g., "$98.27").
