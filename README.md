Original App Design Project - README Template
===

# EaseScore

## Table of Contents

1. [Overview](#Overview)
2. [Product Spec](#Product-Spec)
3. [Wireframes](#Wireframes)
4. [Schema](#Schema)

## Overview

### Description

An app that allows judges to rate or score participants at events in an easy and streamlined manner. Once all judges' marks are recorded, partipants are ranked based on the average of judge scores.

### App Evaluation

[Evaluation of your app across the following attributes]
- **Category:** Sports/Business/Utility/Events
- **Mobile:** Only exists on mobile for the end user. Allows a quick and easy way for judges to submit scores to the server.
- **Story:** At competitive events or business pitches, allows people to rate and rank entrants in order of what pertains to their criteria most. 
- **Market:** Events with competitions, such as sports or dance competitions. Could also be used for things like Shark Tank. Anything that would require a comparison of competitors.
- **Habit:** Only necessary to use when there is ongoing event that needs to be judged or ranked. Not meant to be used repeatedly unless there is an event with multiple consecutive rounds.
- **Scope:** Planned to be a mobile only app. Scoring marks to be sent to a server over the internet—so online only. The app could be expanded to have different uses based on the account type of the user: 'judge' or 'competitor'. In addition to collecting scores, rankings could be publicized to competitors alongside analytics and an option to export more detailed results (things like knowing which judge ranked what).

## Product Spec

### 1. User Stories (Required and Optional)

**Required Must-have Stories**

* As a judge, I should be able to log into my judging account so that only authorized users can access the judging features.
* I want to be able to select the event that I am judging so that I can input scores for the correct event.
* I want to enter scores for participants so that my evaluation is recorded and counted for calculation.

* As an event organizer, I want to be able to log into my own portal to view live aggregate scores so that I can monitor the event.
* I want to be able to lock scoring once the event has passed so that changes can't be made afterwar.

* As a user, I should be able to log in and see my scoring results.
* I should be able to export my scores as a PDF to keep record.

**Optional Nice-to-have Stories**

* [fill in your required user stories here]
* ...

### 2. Screen Archetypes

- [ ] Login Screen
* As a judge, I want to be able to log in securely so that only I can access my scoring dashboard.

- [ ] Event Selection Screen
* As a judge, I want to select the event I am scoring so that I can score the correct participants.

- [ ] Scoring Dashboard
* As a judge, I want to see a list of all participants and their identifier. A box next to each of their names, when tapped, will allow me to input their score.

### 3. Navigation

**Tab Navigation** (Tab to Screen)

* Home -> Event Selection
* Score -> Participant list and scoring interface
* Results -> Live leaderboard results
* Settings -> Account details and logging out

**Flow Navigation** (Screen to Screen)

- [ ] Login Screen
* -> Event Selection (after successful login)

- [ ] Event Selection
* -> Participant list and scoring fashboard (once an event is selected)

- [ ] Scoring Dashboard
* -> Score entry screen (after selecing participant)
* -> Score confirmation screen (after score submission)
* -> Back to participant list (to choose another participant to score)

- [ ] Results
* -> Live leaderboard updates

- [ ] Settings
* -> Log out
* -> Profile update

## Wireframes

[Add picture of your hand sketched wireframes in this section]
<img src="YOUR_WIREFRAME_IMAGE_URL" width=600>

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
