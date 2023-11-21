
import UIKit

final class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource  {
    
    private let tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.register(SettingPhoneCell.self, forCellReuseIdentifier: SettingPhoneCell.identifier)
        return tableView
    }()
    
    private var models = [Section]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI(){
        title = "Настройки"
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.frame = view.bounds
        configureData()
    }
    
    private func configureData() {
        models.append(Section(title: "", option: [
            SettingOption(title: "Авиарежим", icon: UIImage(systemName: "airplane"), iconBackgroundColor: .systemOrange),
            SettingOption(title: "Wi-Fi", icon: UIImage(systemName: "wifi"), iconBackgroundColor: .systemBlue),
            SettingOption(title: "Bluetooth", icon: UIImage(systemName: "scribble"), iconBackgroundColor: .systemBlue),
            SettingOption(title: "Сотовая связь", icon: UIImage(systemName: "antenna.radiowaves.left.and.right"), iconBackgroundColor: .systemGreen)
            ,SettingOption(title: "Режим модема", icon: UIImage(systemName: "phone"), iconBackgroundColor: .systemGreen)]))
        models.append(Section(title: "", option: [
            SettingOption(title: "Уведомления", icon: UIImage(systemName: "app.badge"), iconBackgroundColor: .systemRed),
            SettingOption(title: "Звуки, тактильные сигналы", icon: UIImage(systemName: "volume.3.fill"), iconBackgroundColor: .systemPink),
            SettingOption(title: "Не беспокоить", icon: UIImage(systemName: "moon.fill"), iconBackgroundColor: .systemPurple),
            SettingOption(title: "Экранное время", icon: UIImage(systemName: "hourglass"), iconBackgroundColor: .systemPurple)]))
        models.append(Section(title: "", option: [
            SettingOption(title: "Основные", icon: UIImage(systemName: "gear"), iconBackgroundColor: .systemGray),
            SettingOption(title: "Пункт управления", icon: UIImage(systemName: "square.topthird.inset.filled"), iconBackgroundColor: .systemGray),
            SettingOption(title: "Экран и яркость", icon: UIImage(systemName: "textformat.size"), iconBackgroundColor: .systemBlue)]))
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return models.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return models[section].option.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let model = models[indexPath.section].option[indexPath.row]
        guard let cell = tableView.dequeueReusableCell(withIdentifier: SettingPhoneCell.identifier, for: indexPath) as? SettingPhoneCell else {
            return UITableViewCell()
        }
        cell.configure(with: model)
        return cell
    }
}


