//
//  EuiJinViewController.swift
//  HousLab_iOS
//
//  Created by 김지현 on 2022/07/04.
//

import UIKit
import SwiftUI


class EuiJinBaseViewController : UIViewController {
    
    //MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUp()
        configureUI()
        setConstraints()
    }
    
    
    //MARK: Methods
    
    func setUp(){
      
    }
    
    func configureUI(){
    
    }
    
    func setConstraints(){
      
    }

}

#if DEBUG
extension EuiJinBaseViewController {
    private struct Preview: UIViewControllerRepresentable {
            let viewController: UIViewController

            func makeUIViewController(context: Context) -> UIViewController {
                return viewController
            }

            func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
            }
        }

        func toPreview() -> some View {
            Preview(viewController: self)
        }
}
#endif
