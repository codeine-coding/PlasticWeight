//
//  UniversalView.swift
//  PlasticWeight
//
//  Created by Allen Whearry on 11/4/18.
//  Copyright © 2018 Codeine Technologies LLC. All rights reserved.
//

import UIKit

class UniversalView: UIView {
    // private variables
    var dimensionFields = Form()
    weak var delegate: MainVCDelegate?
    var materialType: MaterialType
    var dimensionLabels = [DimensionLabel]()
    var textFieldStacks = [TextFieldStackView]()

    var plasticManager = PlasticManager()

    var selectedMaterial: String?
    var selectedMaterialFactor: Double?
    var materialTypeImage: UIImageView!
    
    // NSConstraints
    var sharedConstraints: [NSLayoutConstraint] = []
    var SEConstraints: [NSLayoutConstraint] = []
    var greaterThanSEConstraints: [NSLayoutConstraint] = []


    //
    // VIEW INIT CLOSURES
    //

    // material Choice Stack
    var materialTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.textColor = .primary
        textField.textAlignment = .center
        textField.font = UIFont.systemFont(ofSize: 22, weight: .semibold)
        textField.placeholder = "Select Material"
        return textField
    }()
    
    var materialUnderlineView: UIView = {
        let underline = UIView()
        underline.translatesAutoresizingMaskIntoConstraints = false
        underline.heightAnchor.constraint(equalToConstant: 2).isActive = true
        underline.backgroundColor = .secondary
        return underline
    }()
    
    var materialChoiceStackView: UIStackView = {
        let sv = UIStackView()
        sv.translatesAutoresizingMaskIntoConstraints = false
        sv.axis = .vertical
        sv.distribution = .fill
        return sv
    }()
    
    // Picker
    var materialPicker: UIPickerView = UIPickerView()
    
    // Keyboard & Picker Toolbar
    var textFieldEditingToolBar: UIToolbar = {
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        toolbar.tintColor = .primary
        toolbar.backgroundColor = .primary
        toolbar.isUserInteractionEnabled = true
        return toolbar
    }()
    
    // Dimensions Stack
    var dimensionsStackView: UIStackView = {
        let sv = UIStackView()
        sv.translatesAutoresizingMaskIntoConstraints = false
        sv.axis = .horizontal
        sv.alignment = .fill
        sv.distribution = .fillEqually
        sv.spacing = 10
        return sv
    }()
    
    // Weight Pound Stack
    var weightLabel: UILabel = {
        let label = UILabel()
        label.text = "Label"
        label.textColor = .secondary
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 36, weight: .bold)
        label.numberOfLines = 0
        label.adjustsFontSizeToFitWidth = true
        return label
    }()
    
    var poundsLabel: UILabel = {
        let label = UILabel()
        label.text = "Pounds"
        label.textColor = .primary
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        return label
    }()
    
    var weightPoundStackView: UIStackView = {
        let sv = UIStackView()
        sv.translatesAutoresizingMaskIntoConstraints = false
        sv.axis = .vertical
        sv.distribution = .fillEqually
        sv.spacing = 0
        sv.sizeToFit()
        return sv
    }()
    
    // Calc & Clear Button Stack
    var calculateBtn:  RadiusButton = {
        let btn = RadiusButton()
        btn.setTitle("Calculate", for: .normal)
        btn.setTitleColor(.white, for: .normal)
        btn.backgroundColor = .secondary
        return btn
    }()
    
    var clearFieldsBtn: RadiusButton = {
        let btn = RadiusButton()
        btn.setTitle("Clear Fields", for: .normal)
        btn.setTitleColor(.primary, for: .normal)
        btn.backgroundColor = .clear
        btn.layer.borderColor = UIColor.primary.cgColor
        btn.layer.borderWidth = 3
        return btn
    }()
    
    var buttonStackView: UIStackView = {
        let sv = UIStackView()
        sv.translatesAutoresizingMaskIntoConstraints = false
        sv.axis = .vertical
        sv.distribution = .fillEqually
        sv.spacing = 8
        return sv
    }()
    
    //
    // METHODS
    //
    init(dimensionFields: [DimensionTextField], calculation materialType: MaterialType, delegate: MainVCDelegate) {
        self.dimensionFields.controls = dimensionFields
        self.materialType = materialType
        self.delegate = delegate
        super.init(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        setupView()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupView(){
        backgroundColor = .white
        addSubview(materialChoiceStackView)
        materialChoiceStackView.addArrangedSubview(materialTextField)
        materialChoiceStackView.addArrangedSubview(materialUnderlineView)
        
        addSubview(dimensionsStackView)
        
        setMaterialTypeImage()
        addSubview(materialTypeImage)
        addSubview(weightPoundStackView)
        weightLabel.isHidden = true
        poundsLabel.isHidden = true
        weightPoundStackView.addArrangedSubview(weightLabel)
        weightPoundStackView.addArrangedSubview(poundsLabel)
        
        
        addSubview(buttonStackView)
        clearFieldsBtn.alpha = 0
        buttonStackView.addArrangedSubview(clearFieldsBtn)
        buttonStackView.addArrangedSubview(calculateBtn)
        
        // connect buttons to actions
        calculateBtn.addTarget(self, action: #selector(calculateBtnPressed(_:)), for: .touchUpInside)
        clearFieldsBtn.addTarget(self, action: #selector(clearFieldsBtnPressed(_:)), for: .touchUpInside)
        
        setupDimensionsInputStack()
        setupDimensionStackView()
        setupMaterialPicker()
        setupEditingToolBar()
        displayConstraints()
    }
    
    private func setupDimensionsInputStack() {
        guard let dimensionsFieldsCount = dimensionFields.controls?.count else { return }

        textFieldStacks = [TextFieldStackView](repeating: TextFieldStackView() , count: dimensionsFieldsCount)
        dimensionLabels = Array(repeating: DimensionLabel(), count: dimensionsFieldsCount)
        
        for index in 0..<dimensionsFieldsCount {
            dimensionLabels[index] = DimensionLabel()
            textFieldStacks[index] = TextFieldStackView()

            guard
                let field = dimensionFields.controls?[index] as? DimensionTextField,
                let labelTitle = dimensionFields.controls?[index].inputType?.title
            else { return }

            let dimensionTextField = field
            
            let label = dimensionLabels[index]
            label.text = labelTitle
            
            let textFieldStack = textFieldStacks[index]
            
            textFieldStack.addArrangedSubview(label)
            textFieldStack.addArrangedSubview(dimensionTextField)
        }
    }
    
    private func setupDimensionStackView() {
        textFieldStacks.forEach { dimensionsStackView.addArrangedSubview($0) }
    }
    
    private func setupMaterialPicker() {
        materialPicker.delegate = self
        materialTextField.inputView = materialPicker
        materialPicker.translatesAutoresizingMaskIntoConstraints = false
        materialPicker.backgroundColor = .white
    }
    
    private func setupEditingToolBar() {
        let doneBtn = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(dismissKeyboard))
        textFieldEditingToolBar.setItems([doneBtn], animated: false)
        
        materialTextField.inputAccessoryView = textFieldEditingToolBar
        guard let dimensionFields = dimensionFields.controls as? [DimensionTextField] else { return }
        dimensionFields.forEach { $0.inputAccessoryView = textFieldEditingToolBar }
        
        // set up gesture recognizer on view background tap to close keyboard
        let closeKeyboardTap = UITapGestureRecognizer(target: self, action: #selector(closeKeyboard))
        addGestureRecognizer(closeKeyboardTap)
    }
    
    private func setMaterialTypeImage() {
        materialTypeImage = UIImageView()
        materialTypeImage.translatesAutoresizingMaskIntoConstraints = false
        materialTypeImage.contentMode = .scaleAspectFit
        
        switch materialType {
        case .sheetBar:
            materialTypeImage.image = UIImage(named: "sheetBar")
        case .rod:
            materialTypeImage.image = UIImage(named: "roundRod")
        case .roundTube:
            materialTypeImage.image = UIImage(named: "roundTube")
        case .squareTube:
            materialTypeImage.image = UIImage(named: "squareTube")
        }
        
    }

    private func showError(for errorMessge: String) {
        let ac = UIAlertController(title: "Error", message: errorMessge, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        okAction.setValue(UIColor.secondary, forKey: "titleTextColor")
        ac.addAction(okAction)
        UIApplication.shared.keyWindow?.rootViewController?.present(ac, animated: true, completion: nil)
    }

    func showWeightLabel(weight: String) {
        clearFieldsBtn.alpha = 1
        clearFieldsBtn.isEnabled = true
        materialTypeImage.isHidden = true
        weightLabel.isHidden = false

        weightLabel.text = weight
        poundsLabel.isHidden = false
    }

    //
    // ACTION METHODS
    //
    @objc private func closeKeyboard(_ recognizer: UITapGestureRecognizer) {
        dismissKeyboard()
    }
    
    @objc private func dismissKeyboard() {
        endEditing(true)
    }
    
    @objc private func calculateBtnPressed(_ sender: Any) {
        delegate?.calculateButtonPressed(on: self)
    }
    
    @objc private func clearFieldsBtnPressed(_ sender: Any) {
        selectedMaterial  = nil
        selectedMaterialFactor = nil
        materialTextField.text = nil
        dimensionFields.clear()
        weightLabel.isHidden = true
        poundsLabel.isHidden = true
        clearFieldsBtn.alpha = 0
        materialTypeImage.isHidden = false
    }

}
