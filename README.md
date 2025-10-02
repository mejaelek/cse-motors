 # CSE Motors - Vehicle Inventory Application

A Node.js/Express web application for displaying and managing vehicle inventory with dynamic routing and error handling.

## Features

- **Dynamic Vehicle Detail Views**: Single route handles all vehicle details using URL parameters
- **Responsive Design**: Mobile-first approach with breakpoints for tablets and desktops
- **Error Handling**: Comprehensive error middleware for 404 and 500 errors
- **Database Integration**: PostgreSQL for storing vehicle inventory data
- **Professional UI**: Clean, modern interface with proper formatting for prices and mileage

## Installation

1. Clone the repository:
```bash
git clone <your-repo-url>
cd cse-motors
```

2. Install dependencies:
```bash
npm install
```

3. Set up environment variables:
   - Copy `.env.example` to `.env`
   - Update database credentials and port settings

4. Set up the database:
   - Create a PostgreSQL database
   - Run necessary SQL scripts to create tables

5. Start the application:
```bash
# Development mode
npm run dev

# Production mode
npm start
```

## Project Structure

```
cse-motors/
├── controllers/
│   ├── baseController.js
│   ├── invController.js
│   └── errorController.js
├── database/
│   └── index.js
├── models/
│   └── inventory-model.js
├── routes/
│   ├── inventoryRoute.js
│   ├── errorRoute.js
│   └── static.js
├── utilities/
│   └── index.js
├── views/
│   ├── inventory/
│   │   ├── classification.ejs
│   │   └── detail.ejs
│   ├── errors/
│   │   └── error.ejs
│   ├── partials/
│   │   ├── header.ejs
│   │   ├── navigation.ejs
│   │   └── footer.ejs
│   └── layouts/
│       └── layout.ejs
├── public/
│   └── css/
│       ├── styles.css
│       ├── detail-styles.css
│       └── error-styles.css
├── server.js
├── package.json
└── .env
```

## Assignment Tasks Completed

### Task 1: Vehicle Detail View
- ✅ Dynamic route: `/inv/detail/:invId`
- ✅ Controller function in `invController.js`
- ✅ Model function to retrieve vehicle by inventory ID
- ✅ Utility function to build HTML detail view
- ✅ EJS view template with responsive design
- ✅ Proper formatting for price (US currency) and mileage (commas)
- ✅ Side-by-side layout on large screens, stacked on mobile
- ✅ Uses full-size images, not thumbnails

### Task 2: Error Handling
- ✅ Error handling middleware applied to all routes
- ✅ `handleErrors` wrapper function in utilities
- ✅ 404 error handling for non-existent routes
- ✅ Comprehensive error view

### Task 3: Intentional Error Testing
- ✅ Dedicated error route: `/error/trigger`
- ✅ Error controller to throw 500 error
- ✅ Link added to footer for testing
- ✅ Error properly caught and displayed

## Routes

- `GET /` - Home page
- `GET /inv/type/:classificationId` - View vehicles by classification
- `GET /inv/detail/:invId` - View specific vehicle details
- `GET /error/trigger` - Trigger intentional 500 error (testing)

## Database Schema

The application expects the following PostgreSQL tables:

### classification table
- `classification_id` (PRIMARY KEY)
- `classification_name`

### inventory table
- `inv_id` (PRIMARY KEY)
- `classification_id` (FOREIGN KEY)
- `inv_make`
- `inv_model`
- `inv_year`
- `inv_description`
- `inv_image` (full-size image path)
- `inv_thumbnail` (thumbnail image path)
- `inv_price`
- `inv_miles`
- `inv_color`

## Testing Checklist

- [ ] All navigation links work correctly
- [ ] Classification views display properly
- [ ] Vehicle detail links open correct detail views
- [ ] Price displays with $ and commas ($25,999)
- [ ] Mileage displays with commas (45,000 miles)
- [ ] Responsive design works on mobile, tablet, and desktop
- [ ] Images display properly and scale responsively
- [ ] HTML validation passes
- [ ] CSS validation passes
- [ ] WAVE accessibility check passes
- [ ] 404 error displays for invalid routes
- [ ] 500 error displays when footer link clicked

## Deployment

### Render.com Deployment

1. Push code to GitHub repository
2. Connect repository to Render.com
3. Set environment variables in Render dashboard
4. Deploy web service
5. Test thoroughly on production server

### Environment Variables for Render

- `NODE_ENV=production`
- `DATABASE_URL=<your-postgres-connection-string>`
- `PORT=<render-assigned-port>`

## Technologies Used

- **Backend**: Node.js, Express.js
- **View Engine**: EJS (Embedded JavaScript)
- **Database**: PostgreSQL with node-postgres (pg)
- **Styling**: Custom CSS with responsive design
- **Deployment**: Render.com

## Development Notes

- Error handling middleware wraps all route handlers
- Single detail view function handles all vehicles via URL parameters
- CSS uses mobile-first approach with media queries for larger screens
- Number formatting uses `Intl.NumberFormat` for proper currency/comma display

## Support

For issues or questions, please check:
- HTML/CSS validation at W3C validators
- WAVE accessibility checker
- Browser console for JavaScript errors
- Server logs for backend errors

## License

ISC License - Educational Project