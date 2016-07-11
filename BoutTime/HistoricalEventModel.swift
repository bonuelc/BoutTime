//
//  HistoricalEventModel.swift
//  BoutTime
//
//  Created by Christopher Bonuel on 7/6/16.
//  Copyright © 2016 Christopher Bonuel. All rights reserved.
//

import GameKit

protocol Equatable {}
protocol Comparable {}

func ==(lhs: Event, rhs: Event) -> Bool {
    return lhs.year == rhs.year && lhs.month == rhs.month
}

func <(lhs: Event, rhs: Event) -> Bool {
    return lhs.year < rhs.year || (lhs.year == rhs.year && lhs.month < rhs.month)
}

struct Event: Equatable, Comparable {
    
    let description: String
    let year: Int
    let month: Int
}

struct HistoricalEventModel {
    let eventCollection: [Event] = [
        // https://en.wikipedia.org/wiki/History_of_Python
        Event(description: "Python 1.0 release", year: 1994, month: 1),
        // https://en.wikipedia.org/wiki/Swift_(programming_language)
        Event(description: "Swift 1.0 release", year: 2014, month: 9),
        // https://en.wikipedia.org/wiki/Michael_Jordan
        Event(description: "Michael Jordan wins his first NBA championship", year: 1991, month: 6),
        // https://en.wikipedia.org/wiki/Moon_landing
        Event(description: "Neil Armstrong walks on the moon", year: 1969, month: 7),
        // https://en.wikipedia.org/wiki/Cheers
        Event(description: "Cheers sitcom first aires", year: 1982, month: 9),
        // https://en.wikipedia.org/wiki/Post-it_note
        Event(description: "Post-it's are first sold across the US", year: 1980, month: 4),
        // https://en.wikipedia.org/wiki/World_War_I
        Event(description: "World War I starts", year: 1914, month: 7),
        // https://en.wikipedia.org/wiki/World_War_II
        Event(description: "World War II starts", year: 1939, month: 9),
        // https://en.wikipedia.org/wiki/Kleenex
        Event(description: "Kleenex facial tissue appears on market", year: 1924, month: 1),
        // https://en.wikipedia.org/wiki/To_Kill_a_Mockingbird
        Event(description: "To Kill a Mockingbird published", year: 1960, month: 7),
        // https://en.wikipedia.org/wiki/The_Beatles
        Event(description: "The Beatles are formed", year: 1960, month: 1),
        // https://en.wikipedia.org/wiki/Color_television
        Event(description: "First national TV broadcast in color", year: 1954, month: 1),
        // https://en.wikipedia.org/wiki/John_F._Kennedy
        Event(description: "JFK becomes president", year: 1961, month: 1),
        // https://en.wikipedia.org/wiki/Wall_Street_Crash_of_1929
        Event(description: "Black Tuesday", year: 1929, month: 10),
        // https://en.wikipedia.org/wiki/Rose_Bowl_Game
        Event(description: "First Rose Bowl game played", year: 1902, month: 1),
        // https://en.wikipedia.org/wiki/Ford_Model_T
        Event(description: "Ford Model T appears on market", year: 1908, month: 10),
        // https://en.wikipedia.org/wiki/Girl_Scouts_of_the_USA
        Event(description: "Girl Scouts are formed", year: 1912, month: 3),
        // https://en.wikipedia.org/wiki/Mickey_Mouse
        Event(description: "Mickey Mouse's first appearance", year: 1928, month: 11),
        // https://en.wikipedia.org/wiki/Golden_Gate_Bridge
        Event(description: "Golden Gate Bridge completed in San Francisco", year: 1937, month: 4),
        // https://en.wikipedia.org/wiki/Iron_Curtain
        Event(description: "Winston Churchill's Iron Curtain speech", year: 1946, month: 3),
        // https://en.wikipedia.org/wiki/Peanuts
        Event(description: "The comic strip Peanuts is first published", year: 1950, month: 10),
        // https://en.wikipedia.org/wiki/Today_(U.S._TV_program)
        Event(description: "The debut of the Today show on NBC", year: 1952, month: 1),
        // https://en.wikipedia.org/wiki/Disneyland
        Event(description: "Disneyland opens in California", year: 1955, month: 7),
        // https://en.wikipedia.org/wiki/Sesame_Street
        Event(description: "Sesame Street premieres on TV", year: 1969, month: 11),
        // https://en.wikipedia.org/wiki/Earth_Day
        Event(description: "The first Earth Day is observed", year: 1970, month: 4)
    ]
    
    var events: [Event] = []
    
    init() {
        getNewEvents()
    }
    
    subscript(index: Int) -> Event {
        return events[index]
    }
    
    mutating func rearrangeEvents(indexA: Int, indexB: Int) {
        let temp: Event = events[indexA]
        events[indexA] = events[indexB]
        events[indexB] = temp
    }
    
    mutating func getNewEvents() {
        var indices: [Int] = []
        indices.append(GKRandomSource.sharedRandom().nextIntWithUpperBound(eventCollection.count))
        while indices.count < 4 {
            let newIndex = GKRandomSource.sharedRandom().nextIntWithUpperBound(eventCollection.count)
            if !(indices.contains(newIndex)) { // ensure no duplicates
                indices.append(newIndex)
            }
        }

        events = (0..<4).map({eventCollection[indices[$0]]})
    }
    
    func inOrder() -> Bool {
        return events[0] < events[1] && events[1] < events[2] && events[2] < events[3]
    }
}