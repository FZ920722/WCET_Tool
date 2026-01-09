#include <set>
#include <map>
#include <list>
#include <cmath>
#include <tuple>
#include <string>
#include <iostream>


int main() {
    /* 1. map */
    std::cout << "(1) map" << std::endl;
    std::map<std::string, int> mymap;
    mymap["Alice"]      = 30;
    mymap["Bob"]        = 25;
    mymap["Charlie"]    = 35;

    for (std::map<std::string, int>::iterator it = mymap.begin(); it != mymap.end(); ++it) {
        std::cout << it->first << " is " << it->second << " years old." << std::endl;
    }

    /* 2. set */
    std::cout << "(2) set" << std::endl;
    std::set<int> mySet;
    mySet.insert(10);
    mySet.insert(20);
    mySet.insert(30);
    mySet.insert(40);
    mySet.insert(40);

    for (int num : mySet) {
        std::cout << num << " ";
    }
    std::cout << std::endl;

    if (mySet.find(20) != mySet.end()) {
        std::cout << "20 is in the set." << std::endl;
    }

    for (int num : mySet)   {
        std::cout << num << " ";
    }
    std::cout << std::endl;

    if (mySet.empty()) {
        std::cout << "The set is empty." << std::endl;
    }

    std::cout << "The set contains " << mySet.size() << " elements." << std::endl;
    
    /* 3. list */
    // 声明列表：std::list<T> mylist;，其中 T 是存储在列表中的元素类型。
    std::list<int> mylist;
    std::list<int> lst1;                    // 空的list
    std::list<int> lst2(5);              // 包含5个默认初始化元素的list
    std::list<int> lst3(5, 10);     // 包含5个元素，每个元素为10
    std::list<int> lst4 = {1, 2, 3, 4};     // 使用初始化列表

    // (1) 插入元素：mylist.push_back(value);
    mylist.push_back(10);
    mylist.push_back(20);
    mylist.push_back(30);
    std::cout << "First element: " << mylist.front() << std::endl;
    std::cout << "Last element: " << mylist.back() << std::endl;

    // (2) 遍历列表：使用迭代器 for (auto it = mylist.begin(); it != mylist.end(); ++it)
    std::cout << "List elements: ";
    for (std::list<int>::iterator it = mylist.begin(); it != mylist.end(); ++it) {
        std::cout << *it << " ";
    }
    std::cout << std::endl;

    // (3) 删除元素：mylist.pop_back(); 或 mylist.erase(iterator);
    mylist.pop_back();

    // (4) 访问元素：mylist.front(); 和 mylist.back();
    std::cout << "List elements after removing the last element: ";
    for (std::list<int>::iterator it = mylist.begin(); it != mylist.end(); ++it) {
        std::cout << *it << " ";
    }
    std::cout << std::endl;

    /* 4. tuple */
    std::tuple<int, float, double, long, long long> mytuple;

    int i_third = 3;
    std::tuple<int&> mytuple_3(std::ref(i_third));

    /* 5. ceil */
    // float ceilf(float x);
    // double ceil(double x);
    // long double ceill(long double x);
    double num1 = 2.3;
    double num2 = -2.3;

    std::cout << "Ceil of " << num1 << " is " << std::ceil(num1) << std::endl;
    std::cout << "Ceil of " << num2 << " is " << std::ceil(num2) << std::endl;

    /* 6. pair */
    std::pair<std::string, double> product1;
    std::pair<std::string, double> product2("tomatoes", 2.30);
    std::pair<std::string, double> product3(product2);

    product1 = std::make_pair(std::string("lightbulbs"), 0.99);

    std::cout << "The price of " << product1.first << " is $" << product1.second << '\n';
    std::cout << "The price of " << product2.first << " is $" << product2.second << '\n';
    std::cout << "The price of " << product3.first << " is $" << product3.second << '\n';

    return 0;
}
