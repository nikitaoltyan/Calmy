//
//  RequestReview.swift
//  Calmy
//
//  Created by Никита Олтян on 08.05.2021.
//

import StoreKit

enum AppStoreReviewManager {
    static func requestReview() {
        if (DataFunction.checkIfCount(moreThen: 3)) {
            SKStoreReviewController.requestReview()
        }
    }

}
