# Rootify/Bloom

## Table of Contents
1. [Overview](#Overview)
1. [Product Spec](#Product-Spec)
1. [Wireframes](#Wireframes)
2. [Schema](#Schema)

## Overview
### Description
An app that identifies indoor plants and tracks their watering, potting, and sunlight cycles.

### App Evaluation
- **Category:** Home & Garden
- **Mobile:** OCR API (Camera), Real time reminders. This app would be primarily developed for mobile usage, but is viable for usage with limited functionality on a computer. 
- **Story:** The app analyzes users' plant needs and routine. Users can add their plants through a OCR API that recognizes the type of plant to add to their library. It keep tracks of watering schedules and reminds users of care cycles to maximize plant life.
- **Market:** This app is open for use by any individual as a plant identifier, but the app's full functionality is specifically targeted towards plant owners.
- **Habit:** This app could be used as often or unoften as the user wants depending on the plant collection the user has and how often it is updated.
- **Scope:** The app will identify a plant through an OCR API, then it will be added to the users database of plants. The user can view their plant collection and each plant will have a profile of maintenance info. The app can make reminders according to the plant's maintenance requirements.

## Product Spec

### 1. User Stories (Required and Optional)

**Required Must-have Stories**

* User will be able to create a rootify account
* User will be able to login
* User will be able to see detailed plant pages with information on the plant
* User will be able to logout
* User will be able to manually upload plants to their plant collection 
* User will get notifications reminding them to water plants in their plant collection
* User will be able to use their camera to automatically add a plant to their plant collection
* User will be able to add plant watering reminders

**Optional Nice-to-have Stories**

* Reminder Section that allows users to add their own plant reminders
* Social Media aspect where users can meet other users (friend requests) and view Plant Diaries and share plant statistics (?)


### 2. Screen Archetypes

* Login/Register
   * The first screen after launch will be the Login/Register
* Stream
   * The second screen after launch will be the Stream
   * Here, the user sees a list view of the current date, a reminder list for the next watering cycles, a preview of the user's plant collection, and a tab navigation for Home, Add Plant, and Plant Diary
* Profile
    * The Plant Diary will act as the Profile screen for Rootify.
    * Users will be able to view and edit their plants from a UICollection View.
* Creation
    * The Add Plant in the tab navigation bar will act as the creation screen.
    * This screen will either utilize the API to allow the user to use their camera as an input field, or add a plant manually.
* Detail
    * Within the Plant Diary, the user can open up a detail screen of each plant.

### 3. Navigation

**Tab Navigation** (Tab to Screen)

* Home: Front page with "Today's" plant watering schedule, optional reminder notepad
* Add Plant: Access to camera (OCR API) that allows users to take a picture of their plant or add their own plant details
* Plant Diary: Collection of all plant data and inputs as a gallery

**Flow Navigation** (Screen to Screen)

* Launch screen with logo
   * Main screen with upcoming watering dates and reminders
   * Add Plant Screen
       * Add your own plant or scan a plant
       * Manually add the name of plant
       * Camera view screen
   * Plant Diary Screen
       * Collection view of user's plants
           * Plant detail page 


## Wireframes
<img src="https://i.ibb.co/sVNnR7Y/IMG-0191.png" width=600>

### [BONUS] Digital Wireframes & Mockups

### [BONUS] Interactive Prototype

## Schema 
[This section will be completed in Unit 9]
### Models
[Add table of models]
### Networking
- [Add list of network requests by screen ]
- [Create basic snippets for each Parse network request]
- [OPTIONAL: List endpoints if using existing API such as Yelp]
