//
//  ViewController Extension.swift
//  Calmy
//
//  Created by Никита Олтян on 30.04.2021.
//

import Foundation
import UIKit

extension UIViewController {
     
    /// - warning: actions should be added manualy.
    func prepareAlert(withTitle title: String, andSubtitle subtitle: String) -> UIAlertController {
        Vibration.soft()
        let alert = UIAlertController(title: title,
                                      message: subtitle,
                                      preferredStyle: .actionSheet)
        
        alert.addAction(UIAlertAction(title: NSLocalizedString("close_alert",
                                                               comment: ""),
                                      style: .cancel,
                                      handler: { (_) in }))

        return alert
    }
    
    func customPresent(_ vc: UIViewController, from direction: CATransitionSubtype, withDuration dur: Double) {
        Vibration.medium()
        let transition = CATransition()
        transition.duration = dur
        transition.type = .push
        transition.subtype = direction
        self.view.window!.backgroundColor = Colors.pink
        self.view.window!.layer.add(transition, forKey: kCATransition)
        present(vc, animated: false, completion: nil)
    }
    
    func customDismiss(to direction: CATransitionSubtype, withDuration dur: Double){
        Vibration.medium()
        let transition = CATransition()
        transition.duration = dur
        transition.type = .push
        transition.subtype = direction
        self.view.window!.layer.add(transition, forKey: kCATransition)
        dismiss(animated: false, completion: nil)
    }
}
