# Mini Food Delivery Tracking App

## 📱 Overview
A lightweight food delivery tracking app built with SwiftUI and MVVM. It displays orders and tracks real-time updates via WebSocket.


## Architecture

1. SwiftUI + MVVM
2. Combine for state
3. REST + WebSocket via URLSession
4. Manual Dependency Injection

## 🔧 Setup Instructions

1. Clone the repo
2. setup mocked api using "Mockoon Application" drag FoodDeliveryMockApi.json from Application files to Mockoon and run local server 
3. Run the app


## 🚀 Mock Server

http://localhost:3000

### Endpoints:

- POST /register (for user registration)
- POST /login (for user authentication)
- GET /orders (list all orders)
- GET /order/{id} (get details for a specific order)
- POST /orders (create a new order)
- GET /profile (get user profile)
- PUT /profile (update user profile)
- WS: ws://localhost:8080/orders/updates

## 📱 Screenshots
![Onboarding](Screenshots/onboarding1.png)
![Onboarding](Screenshots/onboarding2.png)
![Onboarding](Screenshots/onboarding3.png)
![Start](Screenshots/start.png)
![login](Screenshots/login.png)
![Register](Screenshots/register.png)
![Forget Password](Screenshots/forgetPassword.png)
![New Password](Screenshots/newPassword.png)
![Dashboard](Screenshots/dashboard.png)
![Order List](Screenshots/orderList.png)
![Order Details](Screenshots/orderDetails.png)
![Add Order](Screenshots/addOrder.png)
![Settings](Screenshots/settings.png)
![Profile](Screenshots/Profile.png)
