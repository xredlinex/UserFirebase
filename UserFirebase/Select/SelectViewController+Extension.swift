//
//  SelectViewController+Extension.swift
//  UserFirebase
//
//  Created by alexey sorochan on 18.02.2020.
//  Copyright © 2020 alexey sorochan. All rights reserved.
//

import UIKit

extension SelectViewController {
    
    func uiSetup() {
        
        screenSetupBackground(addBlur: false, 0.4)
        userListView.customSetupView(effectStyle: .systemMaterialDark, radius: 12, alpha: 0.8)
        newUserView.customSetupView(effectStyle: .systemMaterialDark, radius: 12, alpha: 0.8)
        addInfoView.customSetupView(effectStyle: .systemMaterialDark, radius: 12, alpha: 0.8)
//                userListView.mainSreenSetupButtons()
//                newUserView.mainSreenSetupButtons()
//                addInfoView.mainSreenSetupButtons()
    }
}
