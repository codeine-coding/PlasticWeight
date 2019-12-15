//
//  UniversalView.swift
//  PlasticWeight
//
//  Created by Allen Whearry on 11/4/18.
//  Copyright © 2018 Codeine Technologies LLC. All rights reserved.
//

import UIKit

class UniversalView: UIView {
    
    // MARK: - Properties
    private var dimensionLabels: [DimensionLabel]!
    private var textFieldStacks = [TextFieldStackView]()
    
    private var plasticManager = PlasticManager()
    
    var materialType: MaterialType
    var dimensionFields = Form()
    weak var delegate: UniversalViewDelegate?
    
    var selectedMaterial: String?
    var selectedMaterialDensityMeasure: Double?
    var materialTypeImage: UIImageView!
    
    // NSConstraints
    private var sharedConstraints: [NSLayoutConstraint] = []
    private var SEConstraints: [NSLayoutConstraint] = []
    private var greaterThanSEConstraints: [NSLayoutConstraint] = []
    
    let calculatorChangeNotification = NotificationCenter.default
    
    // Material Choice Stack
    var materialTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.textColor = .primary
        textField.textAlignment = .center
        textField.font = UIFont.systemFont(ofSize: 22, weight: .semibold)
        textField.placeholder = ControlStrings.selectMaterial
        textField.accessibilityIdentifier = ControlStrings.selectMaterial
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
    private var textFieldEditingToolBar: UIToolbar = {
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
        label.font = UIFont.systemFont(ofSize: 32, weight: .bold)
        label.numberOfLines = 0
        label.adjustsFontSizeToFitWidth = true
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
        btn.setTitle(ControlStrings.calculate, for: .normal)
        btn.setTitleColor(.white, for: .normal)
        btn.backgroundColor = .secondary
        btn.accessibilityLabel = ControlStrings.calculate
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 22, weight: .semibold)
        return btn
    }()
    
    var clearFieldsBtn: RadiusButton = {
        let btn = RadiusButton()
        btn.setTitle(ControlStrings.clearFields, for: .normal)
        btn.setTitleColor(.primary, for: .normal)
        btn.backgroundColor = .clear
        btn.layer.borderColor = UIColor.primary.cgColor
        btn.layer.borderWidth = 3
        btn.accessibilityLabel = ControlStrings.clearFields
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 22, weight: .semibold)
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
    
    // MARK: - Methods
    init(dimensionFields: [DimensionTextField], calculation materialType: MaterialType, delegate: UniversalViewDelegate) {
        self.dimensionFields.controls = dimensionFields
        self.materialType = materialType
        self.delegate = delegate
        super.init(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        calculatorChangeNotification.addObserver(self, selector: #selector(receiveNotification(notification:)), name: NSNotification.Name(CalculatorNotificationName), object: nil)
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
        weightPoundStackView.addArrangedSubview(weightLabel)
        
        
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
                let dimensionTextField = dimensionFields.controls?[index] as? DimensionTextField,
                let labelTitle = dimensionFields.controls?[index].inputType?.title
                else { return }
            
            
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
        materialPicker.accessibilityLabel = "Material Picker"
        materialTextField.inputView = materialPicker
        materialPicker.translatesAutoresizingMaskIntoConstraints = false
        materialPicker.backgroundColor = .white
    }
    
    private func setupEditingToolBar() {
        let doneBtn = UIBarButtonItem(title: ControlStrings.done, style: .plain, target: self, action: #selector(dismissKeyboard))
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
    
    func showWeightLabel(weight: String) {
        clearFieldsBtn.alpha = 1
        clearFieldsBtn.isEnabled = true
        materialTypeImage.isHidden = true
        weightLabel.isHidden = false
        
        weightLabel.text = weight
    }
    
    // MARK: Action Methods
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
        selectedMaterialDensityMeasure = nil
        materialTextField.text = nil
        dimensionFields.clear()
        weightLabel.isHidden = true
        clearFieldsBtn.alpha = 0
        materialTypeImage.isHidden = false
    }
    
    @objc func receiveNotification(notification: Notification) {
        selectedMaterial = nil
        materialPicker.selectRow(0, inComponent: 0, animated: false)
        assert(materialPicker.selectedRow(inComponent: 0) == 0)
        selectedMaterialDensityMeasure = nil
        materialTextField.text = nil
        dimensionFields.clear()
        weightLabel.isHidden = true
        clearFieldsBtn.alpha = 0
        materialTypeImage.isHidden = false
        
        if let dimensionTextField = dimensionFields.controls as? [DimensionTextField] {
            for field in dimensionTextField {
                field.changeMeasuringIcon()
            }
        }
    }
    
}


// MARK: - Constraints
extension UniversalView {
    
    private func displayConstraints() {
        let safeArea = safeAreaLayoutGuide
        let imageWidth = UIScreen.main.bounds.width - 32
        let screenWdith = imageWidth + 32
        
        sharedConstraints.append(contentsOf: [
            materialChoiceStackView.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: 16),
            materialChoiceStackView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 16),
            materialChoiceStackView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -16),
            
            dimensionsStackView.topAnchor.constraint(equalTo: materialChoiceStackView.bottomAnchor, constant: 16),
            dimensionsStackView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 16),
            dimensionsStackView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -16),
            
            materialTypeImage.centerXAnchor.constraint(equalTo: safeArea.centerXAnchor),
            
            weightPoundStackView.centerXAnchor.constraint(equalTo: materialTypeImage.centerXAnchor),
            weightPoundStackView.widthAnchor.constraint(equalToConstant: imageWidth),
            ])
        
        greaterThanSEConstraints.append(contentsOf: [
            materialTypeImage.topAnchor.constraint(equalTo: dimensionsStackView.topAnchor, constant: 32),
            materialTypeImage.widthAnchor.constraint(equalTo: safeArea.widthAnchor, multiplier: 0.80),
            
            weightPoundStackView.centerYAnchor.constraint(equalTo: materialTypeImage.centerYAnchor),
            
            buttonStackView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 16),
            buttonStackView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -16),
            buttonStackView.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor, constant: -16),
            buttonStackView.heightAnchor.constraint(equalToConstant: 120),
            ])
        
        SEConstraints.append(contentsOf: [
            materialTypeImage.topAnchor.constraint(equalTo: dimensionsStackView.topAnchor, constant: 8),
            materialTypeImage.widthAnchor.constraint(equalTo: safeArea.widthAnchor, multiplier: 0.60),
            
            weightPoundStackView.centerYAnchor.constraint(equalTo: materialTypeImage.centerYAnchor, constant: -24),
            
            buttonStackView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 16),
            buttonStackView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -16),
            buttonStackView.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor, constant: -16),
            buttonStackView.heightAnchor.constraint(equalToConstant: 96),
            ])
        
        NSLayoutConstraint.activate(sharedConstraints)
        
        if screenWdith <= 320 {
            NSLayoutConstraint.activate(SEConstraints)
            clearFieldsBtn.titleLabel?.font = UIFont.systemFont(ofSize: 17, weight: .semibold)
            calculateBtn.titleLabel?.font = UIFont.systemFont(ofSize: 17, weight: .semibold)
            materialTextField.font = UIFont.systemFont(ofSize: 17, weight: .semibold)
            
            guard let fields = dimensionFields.controls as? [DimensionTextField] else { return }
            for field in fields {
                field.font = UIFont.systemFont(ofSize: 15, weight: .semibold)
            }
        } else {
            NSLayoutConstraint.activate(greaterThanSEConstraints)
        }
    }
}


// MARK: - PickerView Delegate & DataSource
extension UniversalView: UIPickerViewDataSource, UIPickerViewDelegate {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return plasticManager.materials.count
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let material = plasticManager.materials[row]
        selectedMaterial = material.title
        if delegate?.calculator is ImperialWeightCalculator {
            selectedMaterialDensityMeasure = material.factor
        } else {
            selectedMaterialDensityMeasure = material.specificGravity
        }
        materialTextField.text = selectedMaterial
    }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        var label: UILabel
        
        if let view = view as? UILabel {
            label = view
        } else {
            label = UILabel()
        }
        
        label.textAlignment = .center
        label.text = plasticManager.materials[row].title
        label.textColor = .primary
        label.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        
        return label
    }
}
