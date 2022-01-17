//
//  GlobalConstants.swift
//  PopMovies
//
//  Created by Raúl Pavón on 12/01/22.
//

import Foundation

struct GlobalConstants {
    enum TheMovieDatabase {
        static let apiKey = "0d7994a757b0db5b35b543bce7921a3a"
        static let posterImageURL = "https://image.tmdb.org/t/p/w185"
        static let youTube = "https://www.youtube.com/watch?v="
    }
    
    enum MovieList {
        static let title = "Pop Movies"
    }
    
    enum Localize {
        static let orderBy = "ORDER_BY"
        static let topRated = "TOP_RATED"
        static let popular = "POPULAR"
        static let cancel = "CANCEL"
        static let detailTitle = "DETAIL_TITLE"
        static let favoriteButtonTitle = "FAVORITE_BUTTON_TITLE"
        static let urlLanguage = "URL_LANGUAGE"
    }
    
    enum Colors {
        static let greenSea = "16a085"
        static let concrete = "7f8c8d"
        static let turquoise = "1abc9c"
    }
    
    enum Images {
        static let slider = "slider.horizontal.3"
        static let back = "chevron.backward"
    }
}
