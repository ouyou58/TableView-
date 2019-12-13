//
//  ViewController.swift
//  TableView Methods
//
//  Created by ouyou on 2019/12/10.
//  Copyright © 2019 ouyou. All rights reserved.
//

   //⑫⑬⑭⑮⑯⑰⑱⑲⑳

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    enum SectionType: Int,CaseIterable {
        case language
        case animal
        case person
    }
    
    var languageDataSource: [LanguageData] = []
    var animalDataSource: [AnimalData] = []
    var personDataSource: [PersonData] = []

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        languageDataSource = [LanguageData(languageIcon: "LanguageIcon1", languageTitle: "Jave", languageContent: "Java是一门面向对象编程语言，不仅吸收了C++语言的各种优点，还摒弃了C++里难以理解的多继承、指针等概念，因此Java语言具有功能强大和简单易用两个特征。Java语言作为静态面向对象编程语言的代表，极好地实现了面向对象理论，允许程序员以优雅的思维方式进行复杂的编"),
                              LanguageData(languageIcon: "LanguageIcon2", languageTitle: "Html5", languageContent: "Html5とは？"),
                              LanguageData(languageIcon: "LanguageIcon3", languageTitle: "CSS", languageContent: "CSSとは？"),
                              LanguageData(languageIcon: "LanguageIcon4", languageTitle: "MySQL", languageContent: "MySQLとは？"),
                              LanguageData(languageIcon: "LanguageIcon5", languageTitle: "JavaScript", languageContent: "JavaScripとは？"),
                              LanguageData(languageIcon: "LanguageIcon6", languageTitle: "C", languageContent: "Cとは？"),
                              LanguageData(languageIcon: "LanguageIcon7", languageTitle: "C#", languageContent: "C#とは？"),
                              LanguageData(languageIcon: "LanguageIcon8", languageTitle: "C++", languageContent: "C++とは？"),
                              LanguageData(languageIcon: "LanguageIcon9", languageTitle: "Swift", languageContent: "Swiftとは？"),
                              LanguageData(languageIcon: "LanguageIcon10", languageTitle: "Kotlin", languageContent: "Kotlinとは？")]
        
        animalDataSource = [AnimalData(icon: "AnimalIcon1", title: "熊猫", content:"熊猫特征:熊猫的外貌:大熊猫(英文名称:Giantpanda),属于食肉目、熊科、大熊猫亚科和大熊猫属唯一的哺乳动物,体色为黑白两色,它有着圆圆的脸颊,大大的黑眼圈,胖嘟嘟的身体,标志性的内八字的行走方式,也有解剖刀般锋利的爪子。是世界上最可爱的动物之(英文名称:Giantpanda),属于食肉目、熊科、大熊猫亚科和大熊猫属唯一的哺乳动物,体色为黑白两色,它有着圆圆的脸颊,大大的黑眼圈,胖嘟嘟的身体,标志性的内八字的行走方式,也有解剖刀般锋利的爪子。是世界上最可爱的动物之一。"),
                            AnimalData(icon: "AnimalIcon2", title: "北极熊", content:"北极熊特征"),
                            AnimalData(icon: "AnimalIcon3", title: "鹰", content:"鹰特征"),
                            AnimalData(icon: "AnimalIcon4", title: "企鹅", content:"企鹅特征"),
                            AnimalData(icon: "AnimalIcon5", title: "豹子", content:"豹子特征")]
        
        personDataSource = [PersonData(name: "田中", connectionWay: ""),
                            PersonData(name: "中村", connectionWay: ""),
                            PersonData(name: "石井", connectionWay: ""),
                            PersonData(name: "脇田", connectionWay: "")]
        
        
        
        tableView.delegate = self
        tableView.dataSource = self

        tableView.tableHeaderView = UIView(frame: CGRect(x: 0, y: 0, width: 0, height: 50))
        tableView.tableHeaderView?.backgroundColor = UIColor.red
        tableView.tableFooterView = UIView(frame: CGRect(x: 0, y: 0, width: 0, height: 100))
        tableView.tableFooterView?.backgroundColor = UIColor.blue
        tableView.register(UINib(nibName: "LanguageCell", bundle: nil), forCellReuseIdentifier: "LanguageCell")
        tableView.register(UINib(nibName: "AnimalCell", bundle: nil), forCellReuseIdentifier: "AnimalCell")
        tableView.register(UINib(nibName: "PersonCell", bundle: nil), forCellReuseIdentifier: "PersonCell")
        

    }
    
    func didTapBtn(sender: UIButton) {
        print("hahaha")
    }
    
}

/*
 ①~⑪为UITableViewDataSource协议中的函数
 1~40为UITableViewDelegate协议中的函数
 */
extension ViewController: UITableViewDataSource,UITableViewDelegate {

    //① 设置列表中，每一个section中有多少个cell
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let section = SectionType(rawValue: section)
        switch section {
        case .language:
            return languageDataSource.count
        case .animal:
            return animalDataSource.count
        case .person:
            return personDataSource.count
        default:
            return 0
        }
    }
    
    //② 把注册到列表中的cell设置里面显示的内容
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let section = SectionType(rawValue: indexPath.section)
       
        switch section {
        case .language:
            let languageCell = tableView.dequeueReusableCell(withIdentifier: "LanguageCell") as! LanguageCell
            languageCell.selectionStyle = UITableViewCell.SelectionStyle.none
            languageCell.isSelected = false
            languageCell.iconImageView.image = UIImage(named: languageDataSource[indexPath.row].languageIcon)
            languageCell.titleLabel.text = languageDataSource[indexPath.row].languageTitle
            languageCell.contentLabel.text = languageDataSource[indexPath.row].languageContent
            return languageCell
        case .animal:
            let animalCell = tableView.dequeueReusableCell(withIdentifier: "AnimalCell") as! AnimalCell
            animalCell.selectionStyle = UITableViewCell.SelectionStyle.none
            animalCell.isSelected = false
            animalCell.iconImageView.image = UIImage(named:animalDataSource[indexPath.row].icon)
            animalCell.titleLabel.text = animalDataSource[indexPath.row].title
            animalCell.contentLabel.text = animalDataSource[indexPath.row].content
            return animalCell
        case .person:
            let personCell = tableView.dequeueReusableCell(withIdentifier: "PersonCell") as! PersonCell
            personCell.selectionStyle = UITableViewCell.SelectionStyle.none
            personCell.isSelected = false
            
            return personCell
        default:
            return UITableViewCell()
        }
    }
    
    //③ 设置列表中有多少个section
    func numberOfSections(in tableView: UITableView) -> Int {
        return SectionType.allCases.count
    }
    
    //④ 设置每个section的header的title
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let section = SectionType(rawValue: section)
        switch section {
        case .language:
            return "IT言語"
        case .animal:
            return "動物"
        case .person:
            return "会員"
        default:
            return ""
        }
    }
    
    //⑤ 设置每个section的footer的title
    func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
         let section = SectionType(rawValue: section)
        switch section {
        case .language:
            return "IT言語紹介完了"
        case .animal:
            return "動物紹介完了"
        case .person:
            return "会員紹介完了"
        default:
            return ""
        }
    }
    
    //⑥ 返回true代表cell可编辑，如果返回false代表cell不可编辑，即⑦方法不会被调用
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    //⑦ 返回trued代表cell可以通过拖动的方式改变cell的位置
    func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    //⑧ 类似于电话簿右边小的索引一样的东西
    func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        var titles = ["a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z","#"]
        return titles
    }
    
    //⑨ 点击右边小字后tableview会自动跳转，跳转到哪一个section？跳转到这个函数的返回值的section，同时点击后也可以进行一些操作
    func tableView(_ tableView: UITableView, sectionForSectionIndexTitle title: String, at index: Int) -> Int {
        print(title)
        print("\(index)")
        return index + 1
    }
    
    //⑩ 方法⑥设置为true之后，点击右边菜单后调用这个方法
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        let section = SectionType(rawValue: indexPath.section)
        switch section {
        case .language:
            languageDataSource.remove(at: indexPath.row)
            tableView.reloadData()
        case .animal:
            animalDataSource.remove(at: indexPath.row)
            tableView.reloadData()
        case.person:
            personDataSource.remove(at: indexPath.row)
            tableView.reloadData()
        case .none:
            return
        }
    }
    
    //⑪ 当cell从一个位置拖动到另一个位置时调用此方法。???????????????????
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        
    }
    
    
    
    
    //1  cell在即将显示到界面时，要进行说明操作写在函数里
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "LanguageCell") as! LanguageCell
        print("\(indexPath),\(cell.contentLabel.text)")
        
    }

    //2 HeaderView在即将显示到界面的时候进行哪些操作
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        print(section)
    }

    //3 FooterView在即将显示到界面的时候进行哪些操
    func tableView(_ tableView: UITableView, willDisplayFooterView view: UIView, forSection section: Int) {
        print(section)
    }

    //4 cell显示到界面后进行哪些操作
    func tableView(_ tableView: UITableView, didEndDisplaying cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let cell = tableView.dequeueReusableCell(withIdentifier: "LanguageCell") as! LanguageCell
        print("didEndDisplaying:\(cell.titleLabel.text)")
    }

    //5 HeaderView显示到界面后进行哪些操作
    func tableView(_ tableView: UITableView, didEndDisplayingHeaderView view: UIView, forSection section: Int) {
        
    }

    //6 HeaderView显示到界面后进行哪些操作
    func tableView(_ tableView: UITableView, didEndDisplayingFooterView view: UIView, forSection section: Int) {
        
    }

    //7 cell的高度
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
         return 100
    }

    //8 HeaderView的高度
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 80

    }

    //9 FooterView的高度
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 40
    }

    //10 在cell显示前，给出cell估计高度，以便tableview计算滚动条的大小，增加用户体验
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return tableView.estimatedRowHeight
    }

    //11 在headerview显示前，给出headerview的估计高度，以便于tableview计算滚动条的高度，增加用户体验
    func tableView(_ tableView: UITableView, estimatedHeightForHeaderInSection section: Int) -> CGFloat {

        return 40
    }

    //12 在footerview显示前，给出footerview的估计高度，以便于tableview计算滚动条的高度，增加用户体验
    func tableView(_ tableView: UITableView, estimatedHeightForFooterInSection section: Int) -> CGFloat {

        return 40
    }

    //13 自定义headerview
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return UIView()
    }

    //14 自定义的footerview
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {

        return UIView()
    }

    //15　　?????????????
    func tableView(_ tableView: UITableView, accessoryButtonTappedForRowWith indexPath: IndexPath) {

        performSegue(withIdentifier: "toDetail", sender: nil)
    }

    //16
    func tableView(_ tableView: UITableView, shouldHighlightRowAt indexPath: IndexPath) -> Bool {

        return true
    }
    
    /*
    * 各indexPathのcellがハイライトされた際に呼ばれます．
    * あるcellがタップされた際は，didHighlight → didUnhighlight → willSelect → didSelectの順に呼び出されます．
    * さらにその状態で別のcellがタップされた際は，didHighlight → didUnhighlight → willSelect → willDeselect → didDeselect → didSelectの順に呼び出されます．
    */

    //17 cell被点击后，变为有背景色状态，当有了背景色以后执行什么，写在这个方法里
    func tableView(_ tableView: UITableView, didHighlightRowAt indexPath: IndexPath) {

    }

    //18 当cell被点击后，背景色消失了以后，执行什么，写在这个方法里
    func tableView(_ tableView: UITableView, didUnhighlightRowAt indexPath: IndexPath) {

    }

    //19 当cell被选中后，不执行这个方法的话就是点击哪个cell就是哪个cell被选中了，执行这个方法的话，可以在return后面指定哪个cell被选择
    func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {

        return [0,1]
    }

    //20 cell变为非选择的状态下之后，return后面的indexPath可指定哪一个cell变为非选中的状态
    func tableView(_ tableView: UITableView, willDeselectRowAt indexPath: IndexPath) -> IndexPath? {

        return indexPath
    }

    //21 点击cell后执行什么操作写在函数中
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

         let section = SectionType(rawValue: indexPath.section)
         switch section {
         case .language:
            tableView.deselectRow(at: indexPath, animated: true)
             performSegue(withIdentifier: "toDetail", sender: nil)
         case .animal:
             performSegue(withIdentifier: "toDetail2", sender: nil)
         case .person:
              performSegue(withIdentifier: "toDetail2", sender: nil)
         default:
             return
         }

    }

    //22 cell变为非选择状态下，执行什么命令，写在这个方法中
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        

    }

    //23  （函数25）如果实现了这个方法，从右向左滑动时就不执行tableview的自带方法，而如果想执行这个方法中的命令，首先要求tableview.isEditting = true,返回delete时左侧【-】，返回insert时左侧是【+】右侧是编辑按钮
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        tableView.isEditing = true

        return .insert
    }

    //24 从右向左滑动时，有的按钮系统默认显示为Deletem，如果想改变按钮的文字，就用这个方法，return后面返回你希望修改的文字
    func tableView(_ tableView: UITableView, titleForDeleteConfirmationButtonForRowAt indexPath: IndexPath) -> String? {

        return "削除"
    }

    //25 cell从o右向左滑动时，右侧默认为一个【Delete】按钮，用了这个方法，编辑右侧按钮，并对各按钮按下后的动作命令编写
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {

        let action1 = UITableViewRowAction(style: .normal, title: "标记已读"){ (x, y) in
            print("action1")
        }
        let action2 = UITableViewRowAction(style: .default, title: "削除"){ (x, y) in
            print("action2")
        }
        let action3 = UITableViewRowAction(style: .destructive, title: "增加") { (x, y) in
            print("action3")
        }
        
        return[action1,action2,action3]
    }

    //26 cell从左到右滑动，左边可编辑菜单的样式在这个方法里定义，可以自定义菜单的文字，背景色，背景图片等
    func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let contextualAction = UIContextualAction(style: .normal, title: "おはよう") { (x, y, z) in
            print("leadingSwipeActionsConfigurationForRowAt:")
        }
        let contextualAction1 = UIContextualAction(style: .normal, title: "こんばんは") { (x, y, z) in
            print("leadingSwipeActionsConfigurationForRowAt:")
        }
        let swipeActions = UISwipeActionsConfiguration(actions: [contextualAction,contextualAction1])
        return swipeActions

    }

    //27 cell从右到左滑动，左边可编辑菜单的样式在这个方法里定义，可以自定义菜单的文字，背景色，背景图片等
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let contextualAction = UIContextualAction(style: .normal, title: "おはよう") { (x, y, z) in
            print("trailingSwipeActionsConfigurationForRowAt:")
        }
        let contextualAction1 = UIContextualAction(style: .normal, title: "こんばんは") { (x, y, z) in
            print("trailingSwipeActionsConfigurationForRowAt:")
        }
        let swipeActions = UISwipeActionsConfiguration(actions: [contextualAction,contextualAction1])
        return swipeActions


    }

    //28 设置在编辑状态下，cell是否会缩进，true为不缩进，false为缩进
    func tableView(_ tableView: UITableView, shouldIndentWhileEditingRowAt indexPath: IndexPath) -> Bool {

        return true
    }

    //29 当cell从左到右滑动后，cell为编辑状态z时，执行这个方法
    func tableView(_ tableView: UITableView, willBeginEditingRowAt indexPath: IndexPath) {

        print("hello")
    }

    //30 当cell的编辑状态关闭后执行这个方法
    func tableView(_ tableView: UITableView, didEndEditingRowAt indexPath: IndexPath?) {
        print("world")
    }

    //31 cell移动的时候，如果不执行这个方法，cell可以随便移动，写了这个方法以后就可以a根据条件限制cell移动的位置
    func tableView(_ tableView: UITableView, targetIndexPathForMoveFromRowAt sourceIndexPath: IndexPath, toProposedIndexPath proposedDestinationIndexPath: IndexPath) -> IndexPath {
        switch (sourceIndexPath.section, proposedDestinationIndexPath.section) {
        case (let from, let to) where from != to:
            return sourceIndexPath  // 如果移动的位置section不一致，就返回原始位置，即cell位置不变
        default:
            return proposedDestinationIndexPath  // 如果移动后section一样，那就返回移动后的位置，即cell的位置在手移动后的位置
        }

    }

    //32 设置缩进的大小
    func tableView(_ tableView: UITableView, indentationLevelForRowAt indexPath: IndexPath) -> Int {

        return 5
    }

    //33  ????????????已弃用
    func tableView(_ tableView: UITableView, shouldShowMenuForRowAt indexPath: IndexPath) -> Bool {

        return true
    }

    //34  ????????已弃用
    func tableView(_ tableView: UITableView, canPerformAction action: Selector, forRowAt indexPath: IndexPath, withSender sender: Any?) -> Bool {

        return true
    }

    //35 ?????已弃用
    func tableView(_ tableView: UITableView, performAction action: Selector, forRowAt indexPath: IndexPath, withSender sender: Any?) {

    }

    //36 单元cell是否可聚焦
    func tableView(_ tableView: UITableView, canFocusRowAt indexPath: IndexPath) -> Bool {

        return true
    }

    //37 是否允许上下文指定的焦点更新
    func tableView(_ tableView: UITableView, shouldUpdateFocusIn context: UITableViewFocusUpdateContext) -> Bool {

        return true
    }

    //38 上下文指定焦点更新后
    func tableView(_ tableView: UITableView, didUpdateFocusIn context: UITableViewFocusUpdateContext, with coordinator: UIFocusAnimationCoordinator) {


    }

    //39 最初 把焦点给哪一个cell
    func indexPathForPreferredFocusedView(in tableView: UITableView) -> IndexPath? {

        return [1,1]
    }

    //40 ?????
    func tableView(_ tableView: UITableView, shouldSpringLoadRowAt indexPath: IndexPath, with context: UISpringLoadedInteractionContext) -> Bool {

        return true
    }
}
    
    

    


    






