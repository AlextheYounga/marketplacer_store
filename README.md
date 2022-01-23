# Example Ecommerce Website

Runs price and coupon calculations and allows anonymous orders. Be aware orders do everything except fully submit. All orders are saved as draft orders.

### How it works
This application simulates an ecommerce storefront. On loading the application, you will arrive at the storefront displaying an array of products.


You can click on each product to see the details of that product and add that item to the cart from that page. 


On clicking add to cart, you will automatically be forwarded to the cart where you can see your items. You can enter a coupon code in the coupon input and click the Check Code button to see if your cart qualifies for the discount.


No database seeding is necessary, the database will automatically be populated on application load. 



### Getting Started

Run migrations
```rake db:migrate```


Build Tailwind CSS
```rails tailwindcss:build```


Start Server
```rails server```

Then you're good to go.

### Available Coupon Codes
TENOFF - 10% off on total greater than $20

FIFTEENOFF - 15% off on total greater than $50

TWENTYOFF - 20% off on total greater than $100

