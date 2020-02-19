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
        
        mainScreenSetupBackground("https://media.giphy.com/media/SpoZWVAYlMCMGcLfqU/giphy.gif")
        userListView.mainSreenSetupButtons()
        newUserView.mainSreenSetupButtons()
        addInfoView.mainSreenSetupButtons()
    }
}
