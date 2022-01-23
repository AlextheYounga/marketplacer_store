# Example Ecommerce Website

![Ecommerce example website storefront!](https://imgur.com/a/dFonc7X "Ecommerce Storefront")


Runs price and coupon calculations and allows anonymous orders. Be aware orders do everything except fully submit. All orders are saved as draft orders.

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
