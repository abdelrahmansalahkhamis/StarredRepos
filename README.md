# StarredRepos

* In this project I have implemented all features using pure swift and did not include any thrid party liberaries

* I have implement the MVVM Architecture pattern, and binding using cloures
* I implemented Coordinators as design pattern to launch root view controller and manage navigation 
* The project hierarchy consists of grouped files such as Views, View Controllers, Models, View Models, Coordinators, etc
* I have removed sceneDelegate from project and implemented appDelegate instead

* For views, I have uesd both storyboard for viewController and Xib for Cells

* For Web Service, I have Created protocol called RepoServiceProtocol contains one function to implement generic api request using URLSession 

* The protocol RepoServiceProtocol is implemented in WebService class and MockWebService class for unit testing

* For the endpoint API, I created a function called getLast30DaysDate to return the date of 30 days age from current date and inject in the url

* Another feature is that this app support dark theme as well as light theme

### Screenshots

![Screenshot](https://github.com/abdelrahmansalahkhamis/StarredRepos/blob/main/Screenshots/IMG_6130.PNG?raw=true)

![Screenshot](https://github.com/abdelrahmansalahkhamis/StarredRepos/blob/main/Screenshots/IMG_6131.PNG?raw=true)

![Screenshot](https://github.com/abdelrahmansalahkhamis/StarredRepos/blob/main/Screenshots/IMG_6133.PNG?raw=true)

![Screenshot](https://github.com/abdelrahmansalahkhamis/StarredRepos/blob/main/Screenshots/IMG_6134.PNG?raw=true)

