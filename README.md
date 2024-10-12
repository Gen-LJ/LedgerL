# LedgerL

A Wallet(aim for a crypto wallet)

#### Features
 - Authentication
 - Wallet
 - Balance Transfer
 - Transaction guard
 - Transaction History
 - Offline
 - Notification
 - Responsive UI

## Feature Details

Authentication:
Login, profile and user list screen

Wallet:
When the new account is created, that account will have automatically 10000 USD and 20000 SGD.

Balance:
User can transfer the balance to other account.

Transaction guard:
balance transfer method is guarded with fireStore runTransaction guard build-in .
(This  method MUST be more atomic, sensitive and secure in production apps)

Transaction History:
Users can view their history and view detail. Transaction have two filter(in/out).

Notification
The users get the notification when the other user transfer balance(In/Out).

Transaction History:
Users can view their history and view detail. Transaction will have two filter(in/out).

Offline:
When the app is offline, the balance and transaction information are available to be viewed.
But balance transfer are not allowed.

Responsive UI:
Centralize Design System for Responsive UI.

## Technology Used

 - Architecture : Clean Architecture
 - State Management : Bloc
 - Other Dependency : Google Login, Push Notification, Firebase, SqfLite , Go_router , Injectable