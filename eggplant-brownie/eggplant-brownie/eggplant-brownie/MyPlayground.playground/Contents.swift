import UIKit

var name = "Márcio"
var project = "Eggplant brownie"

name = "Mello"
print(name)


func helloCalories() {
    let product = "brownie"
    print("Hello Calories \(product)")
}

helloCalories()

func add(name:String, calories:Double) {
    print("adding \(name) with \(calories)")
}

add(name: "Brownie", calories: 30.5)
add(name: "Feijoada", calories: 106.5)

let calories = [40.8, 87.3, 49.1]

for i in 0...calories.count - 1 {
    print(calories[i])
}

func allCalories(calories:Array<Double>) -> Double {
    var total:Double = 0
    for c in calories {
        total += c
    }
    return total
}

allCalories(calories: [9.0, 32.89, 43.8773])

func calculaSoma(valores:Array<Double>) -> Double {
    var soma:Double = 0
    for valor in valores {
        soma += valor
    }
    return soma
}

class Meal {
    var happiness:Int = 5
    var name:String?
}

let brownie = Meal()
print(brownie.happiness)
//print(brownie.name!)

brownie.name = "Chocolate"

if (brownie.name != nil) {
    print(brownie.name!.uppercased())
}

if let name = brownie.name {
    print(name)
}

let numero:Int = Int(5)

let happiness = Int("5")
if let happy = happiness {
    print("Happiness: \(happy)")
}


class Meal2 {
    var happiness:Int
    var name:String
    var items:Array<Item> = []
    
    init(happiness:Int, name:String) {
        self.happiness = happiness
        self.name = name
    }
    
    func calc() -> Double {
        var total:Double = 0.0
        for i in items {
            total += i.calories
        }
        return total
    }
}

class Item {
    var name:String
    var calories:Double
    
    init(name:String, calories:Double) {
        self.name = name
        self.calories = calories
    }
}

var item1 = Item(name: "Ovo", calories: 10)
var item2 = Item(name: "Maça", calories: 13)

let brownie2 = Meal2(happiness:5, name:"Morango")

brownie2.items.append(item1)
brownie2.items.append(item2)

print(brownie2.items.count)
print(brownie2.calc())


