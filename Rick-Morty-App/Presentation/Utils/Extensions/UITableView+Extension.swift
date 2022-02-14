//
//  UITableView+Extension.swift
//  Rick-Morty-App
//
//  Created by SyedAbdulBasit on 05/02/2022.
//
import UIKit
extension UITableView {
    func register<T: UITableViewCell>(_: T.Type) where T: ReusableView & NibLoadableView {
        let nib = UINib(nibName: T.nibName, bundle: nil)
        register(nib, forCellReuseIdentifier: T.reuseIdentifier)
    }

    func dequeueReusableCell<T: UITableViewCell>(for indexPath: IndexPath) -> T where T: ReusableView {
        guard let cell = dequeueReusableCell(withIdentifier: T.reuseIdentifier, for: indexPath) as? T else {
            fatalError("Couldn't cast cell in \(T.reuseIdentifier)")
        }
        return cell
    }
    func setEmptyMessage(_ message: String) {
           let messageLabel = UILabel(frame: CGRect(x: 0, y: 0,
                                                    width: self.bounds.size.width,
                                                    height: self.bounds.size.height))
           messageLabel.text = message
           messageLabel.textColor = .black
           messageLabel.numberOfLines = 0
           messageLabel.textAlignment = .center
        //   messageLabel.font = UIFont(name: "TrebuchetMS", size: 15)
           messageLabel.sizeToFit()

           self.backgroundView = messageLabel
           self.separatorStyle = .none
       }

       func restore() {
           self.backgroundView = nil
           self.separatorStyle = .singleLine
       }
}
