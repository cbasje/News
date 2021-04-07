//
//  NewsResponse.swift
//  News
//
//  Created by benjamiin on 07/04/2021.
//

import Foundation

// MARK: - NewsResponse
struct NewsResponse: Codable {
    var status, copyright, section: String
    var lastUpdated: Date
    var numResults: Int
    var results: [Article]

    enum CodingKeys: String, CodingKey {
        case status, copyright, section
        case lastUpdated = "last_updated"
        case numResults = "num_results"
        case results
    }
}

// MARK: - Article
struct Article: Identifiable, Codable, Equatable {
    static func == (lhs: Article, rhs: Article) -> Bool {
        lhs.id == rhs.id
    }
    
    var id = UUID()
    var section, subsection, title, abstract: String?
    var url: String?
    var uri, byline: String?
    var itemType: ItemType?
    var updatedDate, createdDate, publishedDate: Date?
    var materialTypeFacet, kicker: String?
    var desFacet, orgFacet, perFacet, geoFacet: [String]
    var multimedia: [Multimedia]
    var shortURL: String?

    enum CodingKeys: String, CodingKey {
        case section, subsection, title, abstract, url, uri, byline
        case itemType = "item_type"
        case updatedDate = "updated_date"
        case createdDate = "created_date"
        case publishedDate = "published_date"
        case materialTypeFacet = "material_type_facet"
        case kicker
        case desFacet = "des_facet"
        case orgFacet = "org_facet"
        case perFacet = "per_facet"
        case geoFacet = "geo_facet"
        case multimedia
        case shortURL = "short_url"
    }
}

enum ItemType: String, Codable {
    case article = "Article"
    case interactive = "Interactive"
}

// MARK: - Multimedia
struct Multimedia: Codable {
    var url: String
    var format: Format
    var height, width: Int
    var type: TypeEnum
    var subtype: Subtype
    var caption, copyright: String
}

enum Format: String, Codable {
    case mediumThreeByTwo210 = "mediumThreeByTwo210"
    case normal = "Normal"
    case standardThumbnail = "Standard Thumbnail"
    case superJumbo = "superJumbo"
    case thumbLarge = "thumbLarge"
}

enum Subtype: String, Codable {
    case photo = "photo"
}

enum TypeEnum: String, Codable {
    case image = "image"
}

extension Article {
//    "section": "us",
//    "subsection": "politics",
//    "title": "Likely Legal, â€˜Vaccine Passportsâ€™ Emerge as the Next Coronavirus Divide",
//    "abstract": "Businesses and universities want fast, easy ways to see if students and customers are vaccinated, but conservative politicians have turned â€œvaccine passportsâ€ into a cultural flash point.",
//    "url": "https://www.nytimes.com/2021/04/06/us/politics/vaccine-passports-coronavirus.html",
//    "uri": "nyt://article/23244e08-81dd-54f0-b2f0-178369786743",
//    "byline": "By Sheryl Gay Stolberg and Adam Liptak",
//    "item_type": "Article",
//    "updated_date": "2021-04-07T08:58:59-04:00",
//    "created_date": "2021-04-06T16:17:04-04:00",
//    "published_date": "2021-04-06T16:17:04-04:00",
//    "material_type_facet": "",
//    "kicker": "",
//    "des_facet": [
//        "Vaccination and Immunization",
//        "Coronavirus (2019-nCoV)",
//        "Electronic Health Records",
//        "Mobile Applications",
//        "Workplace Hazards and Violations",
//        "United States Politics and Government"
//    ],
//    "org_facet": [],
//    "per_facet": [
//        "Biden, Joseph R Jr"
//    ],
//    "geo_facet": [],
//    "multimedia": [
//        {
//            "url": "https://static01.nyt.com/images/2021/04/05/us/politics/05dc-vaccine-passports/05dc-vaccine-passports-superJumbo-v2.jpg",
//            "format": "superJumbo",
//            "height": 1365,
//            "width": 2048,
//            "type": "image",
//            "subtype": "photo",
//            "caption": "Travelers in February at Ronald Reagan National Airport near Washington.",
//            "copyright": "Erin Schaff/The New York Times"
//        },
//        {
//            "url": "https://static01.nyt.com/images/2021/04/05/us/politics/05dc-vaccine-passports/05dc-vaccine-passports-thumbStandard-v2.jpg",
//            "format": "Standard Thumbnail",
//            "height": 75,
//            "width": 75,
//            "type": "image",
//            "subtype": "photo",
//            "caption": "Travelers in February at Ronald Reagan National Airport near Washington.",
//            "copyright": "Erin Schaff/The New York Times"
//        },
//        {
//            "url": "https://static01.nyt.com/images/2021/04/05/us/politics/05dc-vaccine-passports/05dc-vaccine-passports-thumbLarge-v2.jpg",
//            "format": "thumbLarge",
//            "height": 150,
//            "width": 150,
//            "type": "image",
//            "subtype": "photo",
//            "caption": "Travelers in February at Ronald Reagan National Airport near Washington.",
//            "copyright": "Erin Schaff/The New York Times"
//        },
//        {
//            "url": "https://static01.nyt.com/images/2021/04/05/us/politics/05dc-vaccine-passports/05dc-vaccine-passports-mediumThreeByTwo210-v2.jpg",
//            "format": "mediumThreeByTwo210",
//            "height": 140,
//            "width": 210,
//            "type": "image",
//            "subtype": "photo",
//            "caption": "Travelers in February at Ronald Reagan National Airport near Washington.",
//            "copyright": "Erin Schaff/The New York Times"
//        },
//        {
//            "url": "https://static01.nyt.com/images/2021/04/05/us/politics/05dc-vaccine-passports/05dc-vaccine-passports-articleInline-v2.jpg",
//            "format": "Normal",
//            "height": 127,
//            "width": 190,
//            "type": "image",
//            "subtype": "photo",
//            "caption": "Travelers in February at Ronald Reagan National Airport near Washington.",
//            "copyright": "Erin Schaff/The New York Times"
//        }
//    ],
//    "short_url": "https://nyti.ms/3wAkvIf"
    
    static var dummydata: [Article] {
        [
            .init(
                section: "us",
                subsection: "politics",
                title: "Likely Legal, 'Vaccine Passports' Emerge as the Next Coronavirus Divide",
                abstract: "Businesses and universities want fast, easy ways to see if students and customers are vaccinated, but conservative politicians have turned 'vaccine passports' into a cultural flash point.",
                url: "https://www.nytimes.com/2021/04/06/us/politics/vaccine-passports-coronavirus.html",
                uri: "nyt://article/23244e08-81dd-54f0-b2f0-178369786743",
                byline: "By Sheryl Gay Stolberg and Adam Liptak",
                itemType: .article,
                updatedDate: Date(),
                createdDate: Date(),
                publishedDate: Date(),
                materialTypeFacet: "",
                kicker: "",
                desFacet: [],
                orgFacet: [],
                perFacet: [],
                geoFacet: [],
                multimedia: [],
                shortURL: "https://nyti.ms/3wAkvIf"
            ),
            .init(
                section: "us",
                subsection: "politics",
                title: "Likely Legal, 'Vaccine Passports' Emerge as the Next Coronavirus Divide",
                abstract: "Businesses and universities want fast, easy ways to see if students and customers are vaccinated, but conservative politicians have turned 'vaccine passports' into a cultural flash point.",
                url: "https://www.nytimes.com/2021/04/06/us/politics/vaccine-passports-coronavirus.html",
                uri: "nyt://article/23244e08-81dd-54f0-b2f0-178369786743",
                byline: "By Sheryl Gay Stolberg and Adam Liptak",
                itemType: .article,
                updatedDate: Date(),
                createdDate: Date(),
                publishedDate: Date(),
                materialTypeFacet: "",
                kicker: "",
                desFacet: [],
                orgFacet: [],
                perFacet: [],
                geoFacet: [],
                multimedia: [],
                shortURL: "https://nyti.ms/3wAkvIf"
            ),
            .init(
                section: "us",
                subsection: "politics",
                title: "Likely Legal, 'Vaccine Passports' Emerge as the Next Coronavirus Divide",
                abstract: "Businesses and universities want fast, easy ways to see if students and customers are vaccinated, but conservative politicians have turned 'vaccine passports' into a cultural flash point.",
                url: "https://www.nytimes.com/2021/04/06/us/politics/vaccine-passports-coronavirus.html",
                uri: "nyt://article/23244e08-81dd-54f0-b2f0-178369786743",
                byline: "By Sheryl Gay Stolberg and Adam Liptak",
                itemType: .article,
                updatedDate: Date(),
                createdDate: Date(),
                publishedDate: Date(),
                materialTypeFacet: "",
                kicker: "",
                desFacet: [],
                orgFacet: [],
                perFacet: [],
                geoFacet: [],
                multimedia: [],
                shortURL: "https://nyti.ms/3wAkvIf"
            ),
            .init(
                section: "us",
                subsection: "politics",
                title: "Likely Legal, 'Vaccine Passports' Emerge as the Next Coronavirus Divide",
                abstract: "Businesses and universities want fast, easy ways to see if students and customers are vaccinated, but conservative politicians have turned 'vaccine passports' into a cultural flash point.",
                url: "https://www.nytimes.com/2021/04/06/us/politics/vaccine-passports-coronavirus.html",
                uri: "nyt://article/23244e08-81dd-54f0-b2f0-178369786743",
                byline: "By Sheryl Gay Stolberg and Adam Liptak",
                itemType: .article,
                updatedDate: Date(),
                createdDate: Date(),
                publishedDate: Date(),
                materialTypeFacet: "",
                kicker: "",
                desFacet: [],
                orgFacet: [],
                perFacet: [],
                geoFacet: [],
                multimedia: [],
                shortURL: "https://nyti.ms/3wAkvIf"
            )
        ]
    }
}
