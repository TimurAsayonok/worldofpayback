//
//  FilterType.swift
//  WorldOfPayback
//
//  Created by Tsimur Asayonak on 12/22/23.
//

import Foundation

public enum FilterType: Equatable {
    case byDate(DateFilter)
    case category(Int)
    
    public enum DateFilter: Int, Equatable {
        case descending = 0
        case ascending = 1
    }
}
