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
Login, profile and user list screen(done)

Wallet:
When the new account is created, users will be randomly
awarded two different currencies with amounts of 10,000 and 20,000. The currencies in this project
are only used for logical operations such as transfers and are purely imaginary..(done)

Balance:
User can transfer the balance to other account.(done)

Transaction guard:
balance transfer method is guarded with fireStore runTransaction guard build-in .
(This method MUST be more atomic, sensitive and secure in production apps).(done)

Transaction History:
Users can view their history and view detail. Transaction have two filter(in/out).

Notification
The users get the notification when the other user transfer balance(In/Out).(in progress)

Transaction History:
Users can view their history and view detail. Transaction will have two filter(in/out).(half done)

Offline:
When the app is offline, the balance and transaction information are available to be viewed.
But balance transfer are not allowed.(in progress)

Responsive UI:
Centralize Design System for Responsive UI.(done)

## Technology Used

- Architecture : Clean Architecture
- State Management : Bloc
- Other Dependency : Google Login, Push Notification, Firebase, SqfLite , Go_router , Injectable
