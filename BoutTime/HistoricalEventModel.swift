//
//  HistoricalEventModel.swift
//  BoutTime
//
//  Created by Christopher Bonuel on 7/6/16.
//  Copyright © 2016 Christopher Bonuel. All rights reserved.
//

import GameKit

struct Event {
    let eventString: String
    let year: Int
    let month: Int
}

struct HistoricalEventModel {
    var events: [Event] = [
        // https://en.wikipedia.org/wiki/History_of_Python
        Event(eventString: "Python 1.0 release", year: 1994, month: 1),
        // https://en.wikipedia.org/wiki/Swift_(programming_language)
        Event(eventString: "Swift 1.0 release", year: 2014, month: 9),
        // https://en.wikipedia.org/wiki/Michael_Jordan
        Event(eventString: "Michael Jordan wins his first NBA championship", year: 1991, month: 6),
        // https://en.wikipedia.org/wiki/Moon_landing
        Event(eventString: "Neil Armstrong walks on the moon", year: 1969, month: 7),
        // https://en.wikipedia.org/wiki/Cheers
        Event(eventString: "Cheers sitcom first aires", year: 1982, month: 9),
        // https://en.wikipedia.org/wiki/Post-it_note
        Event(eventString: "Post-it's are first sold across the US", year: 1980, month: 4),
        // https://en.wikipedia.org/wiki/World_War_I
        Event(eventString: "World War I starts", year: 1914, month: 7),
        // https://en.wikipedia.org/wiki/World_War_II
        Event(eventString: "World War II starts", year: 1939, month: 9),
        // https://en.wikipedia.org/wiki/Kleenex
        Event(eventString: "Kleenex facial tissue appears on market", year: 1924, month: 1),
        // https://en.wikipedia.org/wiki/To_Kill_a_Mockingbird
        Event(eventString: "To Kill a Mockingbird published", year: 1960, month: 7),
        // https://en.wikipedia.org/wiki/The_Beatles
        Event(eventString: "The Beatles are formed", year: 1960, month: 1),
        // https://en.wikipedia.org/wiki/Color_television
        Event(eventString: "First national TV broadcast in color", year: 1954, month: 1),
        // https://en.wikipedia.org/wiki/John_F._Kennedy
        Event(eventString: "JFK becomes president", year: 1961, month: 1),
        // https://en.wikipedia.org/wiki/Wall_Street_Crash_of_1929
        Event(eventString: "Black Tuesday", year: 1929, month: 10),
        // https://en.wikipedia.org/wiki/Rose_Bowl_Game
        Event(eventString: "First Rose Bowl game played", year: 1902, month: 1),
        // https://en.wikipedia.org/wiki/Ford_Model_T
        Event(eventString: "Ford Model T appears on market", year: 1908, month: 10),
        // https://en.wikipedia.org/wiki/Girl_Scouts_of_the_USA
        Event(eventString: "Girl Scouts are formed", year: 1912, month: 3),
        // https://en.wikipedia.org/wiki/Mickey_Mouse
        Event(eventString: "Mickey Mouse's first appearance", year: 1928, month: 11),
        // https://en.wikipedia.org/wiki/Golden_Gate_Bridge
        Event(eventString: "Golden Gate Bridge completed in San Francisco", year: 1937, month: 4),
        // https://en.wikipedia.org/wiki/Iron_Curtain
        Event(eventString: "Winston Churchill's Iron Curtain speech", year: 1946, month: 3),
        // https://en.wikipedia.org/wiki/Peanuts
        Event(eventString: "The comic strip Peanuts is first published", year: 1950, month: 10),
        // https://en.wikipedia.org/wiki/Today_(U.S._TV_program)
        Event(eventString: "The debut of the Today show on NBC", year: 1952, month: 1),
        // https://en.wikipedia.org/wiki/Disneyland
        Event(eventString: "Disneyland opens in California", year: 1955, month: 7),
        // https://en.wikipedia.org/wiki/Sesame_Street
        Event(eventString: "Sesame Street premieres on TV", year: 1969, month: 11),
        // https://en.wikipedia.org/wiki/Earth_Day
        Event(eventString: "The first Earth Day is observed", year: 1970, month: 4)
    ]
    
    func fourRandomEvents() -> [Event] {
        var indices: [Int] = []
        indices.append(GKRandomSource.sharedRandom().nextIntWithUpperBound(events.count))
        while indices.count < 4 {
            let newIndex = GKRandomSource.sharedRandom().nextIntWithUpperBound(events.count)
            if !(indices.contains(newIndex)) { // ensure no duplicates
                indices.append(newIndex)
            }
        }
        
        return (0..<4).map({events[indices[$0]]})
    }
}