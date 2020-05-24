# T2A2, Marketplace Project

## Links

guy-norkunas.herokuapp.com/
https://github.com/Guy-Norkunas/Parking

## What problem does this marketplace solve?

#### The problem:

Parking in Australia is among the highest in the world, this problem is only expected to get worse unless there is some intervention. 

#### The solution:

This marketplace app seeks to solve this problem. A lot of people living in the city purchase or rent their parking spaces over a long period. This could often come out cheaper than paying for parking in the city, however quite often the owner of the space won't be occupying the space. This app gives a way for those owners to lease their parking space to people looking for a parking space in the city. This competitive marketplace will help in driving down the cost of marking in Australias cities.

## Description

### Purpose:

The purpose of this app is to provide a marketplace for owners of car spaces to rent that space out to people looking to park.

### Features:

#### Image uploading:

This marketplace app uses Amazon S3 buckets to store images attached to the listings made. This is can be used to demonstrate the location of the parking space.

#### Google maps:

Google maps api is used in combination with a geocoding gem in order to demonstrate to the user all of the different locations where parking spaces are available. The markers on the maps also link to their respective listing.

#### Google location autocomplete:

Another google api utilised is the location autocomplete api. This allows for the user to begin typing their address and the form will have many autocomplete options. This makes it significantly easier for the user to make a listing.

#### Reviews and ratings:

Every listing allows for users to leave reviews and an accompanying rating. These allow for other users to make an informed decision about whether or not they wish to rent a space.

#### Authentification:

This marketplace app uses devise in order to authenticate the user. You can see listings in your area or even search for listings elsewhere, however in order to make a booking or leave a review you must be logged in.

#### Geocoding:

All listings on the website are geocoded by their latitiude and longitude, this allows for distance calculation making it possible to filter through the database and only show the user listings close to them (or close to where they search).

#### Stripe: 

Stripe api is used as the payment system allowing users to pay for their booking using their card. 

#### Search functionality:

The search functionality works by utilising google autocomplete and geocoding's distance_to() function. The user types in an address, a maximum distance from that address and a minimal rating. They will then be taken to a page that shows them all the results that match their query.

### Sitemap

### Screenshots

### Target audience

This marketplace targets 2 different audiences. First, it targets people who own a parking space and find themselves not using the space all the time. People who wish to make money from their unused parking space. And secondly, the app also targets people who are looking for competitively priced parking spaces, who don't mind being confined to a time limited parking space.

### Tech stack

Ruby on rails  
Heroku  
Javascript  
HTML
CSS

## User stories

As a seller, I want to lease out my parking space after work hours day, so that I can make money from my parking space while I don't use it.

As a seller, I have invested heavily in parking spaces and wish to be able to manage my listings easily, so that I can make changes where necessary.

As a buyer, I'm interested in renting a parking space near me for the afternoon, so that I don't have to pay normal parking fees.

As a buyer, I'm planning to travel to another city and want to check out the parking prices in advance, so that I can better budget for that expense.

## Wireframes

## ERD

## Describe your projects models in terms of the relationships (active record associations) they have with each other

## Discuss the database relations to be implemented in your application

## Provide your database schema design

## Explain the different high-level components (abstractions) in your app

## Detail any third party services that your app will use

## Describe the way tasks are allocated and tracked in your project