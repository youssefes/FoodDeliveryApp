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
2. Open in Xcode
3. Run the app


## 🚀 Mock Server

https://app.beeceptor.com/console/fooddeliveryapp

### Endpoints:

- GET /orders
- GET /orders/{id}
- WS: ws://localhost:8080/orders/updates

## 📱 Screenshots

### 🧾 Order List

![Order List](Screenshots/orderList.png)

### 🚚 Order Details

![Order Details](Screenshots/orderDetails.png)
