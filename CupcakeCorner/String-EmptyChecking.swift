//
//  String-EmptyChecking.swift
//  CupcakeCorner
//
//  Created by Oliver Hu on 4/23/24.
//

import Foundation

extension String {
    var isReallyEmpty: Bool {
        self.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
    }
}
