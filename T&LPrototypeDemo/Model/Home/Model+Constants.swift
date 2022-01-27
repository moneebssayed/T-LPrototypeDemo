//
//  Model+Constants.swift
//  T&LPrototype
//
//  Created by Moneeb S. Sayed on 1/6/22.
//

enum Duration: String, Codable {
    case the18Days = "18 days"
    case the5Days = "5 DAYS"
    case the6Days = "6 DAYS"
    case the7Days = "7 DAYS"
}

enum Headline: String, Codable {
    case curatedExperience = "CURATED EXPERIENCE"
}

enum Tag: String, Codable {
    case experienceTypeAdventure = "experience-type:adventure"
    case experienceTypeBeaches = "experience-type:beaches"
    case experienceTypeCity = "experience-type:city"
    case experienceTypeCulture = "experience-type:culture"
    case experienceTypeDestinationOfTheYear = "experience-type:destination-of-the-year"
    case experienceTypeGiftOfTravel = "experience-type:gift-of-travel"
    case experienceTypeWorldSBest = "experience-type:world's-best"
}
