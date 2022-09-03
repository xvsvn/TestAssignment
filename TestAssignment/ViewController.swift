//
//  ViewController.swift
//  TestAssignment
//
//  Created by Xasan Xasanov on 02/09/22.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let cellId = "cellId"
    let sectionTitles: [String] = ["О клинике", "Описание", "Фотогалерея"]
    
    var infoNames: [Info] = [Info]()
    
    var tex: [op] = [op]()
    
    

    let tableView = UITableView()
    
 private  let locationLogo:UIImageView = {
     let locationLogo = UIImageView()
        locationLogo.image = UIImage(named: "shox")
        locationLogo.backgroundColor = UIColor.blue
        locationLogo.heightAnchor.constraint(equalToConstant: 50.0).isActive = true
        locationLogo.widthAnchor.constraint(equalToConstant: 50.0).isActive = true
     return locationLogo
    }()
    
    
    private   let locationKind:UILabel = {
       let locationKind = UILabel()
        locationKind.text = "Многопрофилная Клиника"
        locationKind.textColor = UIColor.green
        locationKind.font = locationKind.font.withSize(15)
        locationKind.translatesAutoresizingMaskIntoConstraints = false
           return locationKind
       }()
       
    
 private   let locationName:UILabel = {
    let locationName = UILabel()
     locationName.text = "Shox International\nHospital"
     locationName.textColor = .black
     locationName.numberOfLines = 2
     locationName.font = UIFont.boldSystemFont(ofSize: 20.0)
     locationName.translatesAutoresizingMaskIntoConstraints = false
        return locationName
    }()
    

    
  private  let locationStatus:UILabel = {
     let locationStatus = UILabel()
   //     locationStatus.text = "Закрыто до завтра"
      locationStatus.addLeading(image: UIImage(systemName: "clock.fill") ?? UIImage(), text: "  Закрыто до завтра")
      locationStatus.font = locationStatus.font.withSize(12)
      locationStatus.textColor = UIColor.systemRed
        locationStatus.numberOfLines = 1
      //  locationStatus.font = UIFont.bo
        locationStatus.translatesAutoresizingMaskIntoConstraints = false
        return locationStatus
    }()
    
    private   let stackView:UIStackView = {
        
    let stackView   = UIStackView()
    stackView.axis  = NSLayoutConstraint.Axis.horizontal
    stackView.distribution  = UIStackView.Distribution.equalSpacing
    stackView.alignment = UIStackView.Alignment.center
    stackView.spacing   = 16.0
        
        return stackView
    }()

 

    override func viewDidLoad() {
        super.viewDidLoad()
       
        createInfoArray()
      
        tableView.register(InfoTableViewCell.self, forCellReuseIdentifier: InfoTableViewCell.identifier)
        tableView.register(LabelTableViewCell.self, forCellReuseIdentifier: LabelTableViewCell.identifier2)
        tableView.register(PhotoTableViewCell.self, forCellReuseIdentifier: PhotoTableViewCell.iden)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.translatesAutoresizingMaskIntoConstraints = false
        let codeSegmented = CustomSegmentedControl(frame:
        CGRect(x: 0, y: 350, width: self.view.frame.width, height: 50),
        buttonTitle: ["О клинике","Услуги","Врачи"])
        codeSegmented.backgroundColor = .clear
        view.addSubview(codeSegmented)
        
        if codeSegmented.selectedIndex == 0 {

            view.addSubview(tableView)
            tableView.isHidden = false
            print("0")
       }

         if  codeSegmented.selectedIndex == 1 {
             tableView.isHidden = true
             print("1")
           }
        
 
        
        
//   @objc
        
        
        
        
        let twoLineButton = customButtton(frame:CGRect(x: 20, y: 270, width: 150, height: 45))
        view.addSubview(twoLineButton)
        
  
        
        let iconButton = iconTextButtton(frame: CGRect(x: 220, y: 270, width: 150, height: 45))
        iconButton.configure(with: iconButtonViewModel(text: "Позвонить", image: UIImage(systemName: "phone.fill")))
        view.addSubview(iconButton)
     view.backgroundColor = .white
        view.addSubview(stackView)
       // view.addSubview(iconButton)
        view.addSubview(locationKind)
        view.addSubview(locationStatus)
        stackView.addArrangedSubview(locationLogo)
        stackView.addArrangedSubview(locationName)
        
        
        tableView.frame = CGRect(x:0, y: 410, width:view.bounds.width, height: 600)
       
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor, constant: -40).isActive = true
        stackView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor, constant: -270).isActive = true
        locationKind.topAnchor.constraint(equalTo: self.stackView.bottomAnchor, constant: 10).isActive = true
        locationKind.leftAnchor.constraint(equalTo: self.stackView.leftAnchor,constant: 70).isActive = true
        locationStatus.topAnchor.constraint(equalTo: self.locationKind.bottomAnchor, constant: 10).isActive = true
        locationStatus.leftAnchor.constraint(equalTo: self.locationKind.leftAnchor,constant: 0).isActive = true
        
       
    }
    
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return infoNames.count
        }
        else if  section == 1 {
           return 1
            
        }
        return 1
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        sectionTitles.count
        
    }
  
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
        let cell = tableView.dequeueReusableCell(withIdentifier: InfoTableViewCell.identifier, for: indexPath) as!  InfoTableViewCell
        let curretLastItem = infoNames[indexPath.row]
        cell.product = curretLastItem
        }
        else if indexPath.section == 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: LabelTableViewCell.identifier2, for: indexPath) as! LabelTableViewCell
            
           
        }
        else if indexPath.section == 2 {
            let cell = tableView.dequeueReusableCell(withIdentifier: PhotoTableViewCell.iden, for: indexPath) as! PhotoTableViewCell
            return cell
           
        }
                    
        return UITableViewCell()
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
           return sectionTitles[section]
       }
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
          guard let header = view as? UITableViewHeaderFooterView else {return}
          header.textLabel?.font = .systemFont(ofSize: 18, weight: .semibold)
          header.textLabel?.frame = CGRect(x: header.bounds.origin.x + 30, y: header.bounds.origin.y, width: 130, height: header.bounds.height)
          header.textLabel?.textColor = .black
       // header.textLabel?.text = header.textLabel?.text?.capitalizrFirstLetter()
      
      }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
        return 70
        }
        else {
            return 200
        }
    }
    
    
    
  public func createInfoArray() {
        infoNames.append(Info(image:UIImage(systemName: "mappin.and.ellipse"), infoName: "Юнусобод 8 квартал, дом 39,\nЮнусабадский район,Ташкент"))
        infoNames.append(Info(image:UIImage(systemName: "phone.fill"), infoName: "+998914454545\n+998914454545"))
        infoNames.append(Info(image:UIImage(systemName: "paperplane"), infoName: "@shoxinternational"))
        infoNames.append(Info(image:UIImage(systemName: "globe.americas.fill"), infoName: "shoxinter.uz"))
        infoNames.append(Info(image:UIImage(systemName: "clock"), infoName: "Время работы\nПн-Пт 8:30-13:00, 14:00-19:00"))
    
    }
   
    
}

extension UILabel {
    
    func addTrailing(image: UIImage, text:String) {
        let attachment = NSTextAttachment()
        attachment.image = image

        let attachmentString = NSAttributedString(attachment: attachment)
        let string = NSMutableAttributedString(string: text, attributes: [:])

        string.append(attachmentString)
        self.attributedText = string
    }
    
    func addLeading(image: UIImage, text:String) {
        let attachment = NSTextAttachment()
        attachment.image = image

        let attachmentString = NSAttributedString(attachment: attachment)
        let mutableAttributedString = NSMutableAttributedString()
        mutableAttributedString.append(attachmentString)
        
        let string = NSMutableAttributedString(string: text, attributes: [:])
        mutableAttributedString.append(string)
        self.attributedText = mutableAttributedString
    }
}
