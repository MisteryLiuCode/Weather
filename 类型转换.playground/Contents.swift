import UIKit


let xx = 20
//Int或Double转字符串的两种方法
let yy = "\(xx)"
let zz = String(xx)

//Double转Int(去掉小数点后面的)
Int(1.9)
//Int转Double
Double(1)

//对象类型的转换
class A{ }
class B: A{ }
let a = A()
let b = B()

//as-->向上转型upcasting--用的少
//as?-->向下转型--downcasting--可能为空的情况下使用，要用iflet
//as!-->向下转型--downcasting--强制转换类型，在明确的情况下使用
b as A
a as? B
