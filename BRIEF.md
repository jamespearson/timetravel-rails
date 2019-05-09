# Travel Time Challenge

## Our problem

We regularly need to send negotiators out into the streets of London from our office in Shoreditch to meet landlords and tenants. All our negotiators always use public transport (or their own two feet!) to get where they're going.

We currently know where we want to send our negotiators, but we'd like a more accurate way of predicting their arrival time at each of the locations they have to visit.

## The solution

Citymapper has a handy API (https://citymapper.3scale.net/) that allows us to predict travel times between two points using public transport - we'd like you to use this API and to build us a simple web interface that allows us to:

* Set addresses or plot points on a map where our negotiators need to visit (the negotiator should always start at our office at 65 Leonard Street, EC2A 4QS)
* Set the start time and date the negotiator will be leaving on their journey
* See the arrival time of the negotiator at each of the points along the route
* BONUS FEATURE: Allow us to set how long the negotiator will be at each location for, before setting off for their next location
* BONUS FEATURE: Specifically limit addresses/plot points to London

## Notes

Our negotiators only cover London, so we don't need anything that supports locations outside of London.

## Finally

The specification is intentionally open-ended to let you build this how you see fit, but please email us with any questions or if you think anything is unclear.

This project should be built using Ruby on Rails, and you can use any gems that you think will be handy. A readme in the git repository also wouldn't go amiss, so we know how to use your project.