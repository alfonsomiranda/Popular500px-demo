**Popular500px demo**
=================
This is a small iOS app that consumes the 500px REST API built in swift 1.2 with a VIPER architecture

Description
-----------

The app shows the 20 most popular photographs of 500px service in a list. If the user selects a picture from the list, app show another view with the details of the selected picture.
In this project we can view how develop a swift application with VIPER architecture.

Getting started
---------------

In first time, download project.
This project uses cocoapods for SDWebImage library (is used for loading images asynchronously) so you must install [cocoapods](https://cocoapods.org/).
In root folder of project running on the terminal

    pod install
    Popular500px.xcworkspace

Implementation.

1. Architecture VIPER.
VIPER is an application of Clean Architecture to iOS apps, which implement the Clean Architecture, as described by Uncle Bob. The word VIPER is a backronym for View, Interactor, Presenter, Entity and Routing. For more info: https://mutualmobile.github.io/blog/2013/12/04/viper-introduction/
In this app we can see all layers:

- View: *PopularListViewController.swift*
- Interactor: *PopularListInteractor.swift*
- Presenter: *PopularListPresenter.swift*
- Entity: Folders *Entity and Model*
- Routing: *MainWireframe.swift*

2. Core data.
Using Core Data is made to cached. if there are any connection problem with the API or connection, app shows the last info downloaded.

3. Animations.
To demonstrate the use of animations in swift, in detail the user info is loaded with delay and playing with alpha value.
