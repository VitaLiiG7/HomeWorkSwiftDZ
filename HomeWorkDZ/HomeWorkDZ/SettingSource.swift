
import Foundation
import UIKit

struct Section {
    let title: String
    let option: [SettingOption]
}
struct SettingOption {
    let title: String
    let icon: UIImage?
    let iconBackgroundColor: UIColor
}
