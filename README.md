# WorkTracker

# Used:MVC/UIKit/SwiftUI/Lottie/CoreData/UserDefault/Firebase/CoreML/CoreBluetooth/FaceID/Notification

---

## Working with data:
-using the remote Firebase RealtimeDataBase database
-saving user information in SQLite (using the CoreData framework)
-using the local UserDefault database to save small amounts of data

---

## How is the working time determined:
After certain regular intervals, a scan is performed, during which all available Bluetooth signals are detected. If there is a network in this list that was deliberately added as a “working network”, then this time period is counted as a “working” one
-time is added to the employee (the total time is fixed + the specific time for the current day)
-the chart changes automatically, thanks to which you can estimate how much time is working / left to work

Registration in the application is performed by mail and password, if the account already exists, then you should select the “login" mode. Authentication data is stored in a remote FireBase database (unique uid, mail and password)

---

## Additional functionality of our application:

1)Director's mode:
-each director has the opportunity to fill in information about himself, which will later be stored in his personal account.
-the ability to view the entire list of employees (including their data: mail, name, etc.), to see the statistics of the hours/days worked for each employee
-you can add an individual task to each employee, which will be sent to him (in the status “unfulfilled”)
-in addition to the task to other employees, the director can add the task directly to himself (a page with notes)
-due to the large number of employees, it is difficult to control their working hours, which is why the “Divide into departments" function has been added to the application. The director can form an individual team of employees, see their total time worked (in relation to the required time for work)
-The director has the opportunity to personally install “working” Bluetooth networks (and also remove them from the list)
-Notifications have been added that notify the user about upcoming tasks with a certain frequency

-Confirmation of stay at the workplace by biometrics, namely by FaceID (if the identity is not confirmed, the working period is not counted)

Author's functionality:
-people do not always work directly in the office, where the Bluetooth networks are located. Now the practice of working remotely is widespread, a person only needs a laptop / computer. A neural network has been implemented that recognizes objects around the user. If a laptop/computer comes into view, a notification comes that the working period has been confirmed.

2)Working mode:

-viewing information about directors
-viewing tasks that come from directors (there are several task states: “completed" / “not completed")

-personal data (similar to that of the directors)

-view visualization of working hours 

-FaceID and notifications are similar
