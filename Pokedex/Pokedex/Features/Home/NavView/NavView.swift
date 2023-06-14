//
//  NavView.swift
//  NavViewPersonalizada
//
//  Created by Felipe Augusto Correia on 28/03/23.
//

import UIKit

class NavView: UIView {
    
    lazy var viewBackground: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .lightGray
        view.layer.cornerRadius = 50
        view.layer.maskedCorners = [.layerMinXMaxYCorner]
        return view
    }()
    
    lazy var navBar: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var stackView: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.distribution = .fillEqually
        stack.axis = .horizontal
        stack.spacing = 5
        return stack
    }()
    
    lazy var searchTextField: UITextField = {
        let tf = UITextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.placeholder = "Procure por um Pokemon"
        tf.backgroundColor = .white
        tf.clipsToBounds = true
        tf.layer.cornerRadius = 20
        tf.borderStyle = .roundedRect
        tf.autocorrectionType = .no
        tf.autocapitalizationType = .none
        return tf
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addElements()
        self.configConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func configTextFieldDelegate(delegate: UITextFieldDelegate) {
        self.searchTextField.delegate = delegate
    }
    
    private func addElements() {
        self.addSubview(self.viewBackground)
        self.viewBackground.addSubview(self.navBar)
        self.navBar.addSubview(self.searchTextField)
        self.navBar.addSubview(self.stackView)
    }
    
    private func configConstraints() {
        NSLayoutConstraint.activate([
            self.viewBackground.topAnchor.constraint(equalTo: self.topAnchor),
            self.viewBackground.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.viewBackground.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            self.viewBackground.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            
            self.navBar.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            self.navBar.leadingAnchor.constraint(equalTo: self.viewBackground.leadingAnchor),
            self.navBar.trailingAnchor.constraint(equalTo: self.viewBackground.trailingAnchor),
            self.navBar.heightAnchor.constraint(equalToConstant: 50),
            
            self.searchTextField.centerYAnchor.constraint(equalTo: self.navBar.centerYAnchor),
            self.searchTextField.leadingAnchor.constraint(equalTo: self.navBar.leadingAnchor, constant: 25),
            self.searchTextField.widthAnchor.constraint(equalToConstant: 250),
            self.searchTextField.heightAnchor.constraint(equalToConstant: 40),
            
            self.stackView.trailingAnchor.constraint(equalTo: self.navBar.trailingAnchor, constant: -30),
            self.stackView.centerYAnchor.constraint(equalTo: self.navBar.centerYAnchor),
            self.stackView.widthAnchor.constraint(equalToConstant: 70),
            self.stackView.heightAnchor.constraint(equalToConstant: 30),
            
        ])
    }
}
