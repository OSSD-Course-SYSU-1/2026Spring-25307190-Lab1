#include <iostream>
using namespace std;

int main() {
    // 待排序的数组
    int arr[] = {5, 2, 9, 1, 5, 6};
    // 计算数组长度
    int len = sizeof(arr) / sizeof(arr[0]);

    // 冒泡排序核心：外层循环控制排序轮数
    for (int i = 0; i < len - 1; i++) {
        // 内层循环控制每轮比较交换
        for (int j = 0; j < len - 1 - i; j++) {
            // 前一个数比后一个大，就交换位置
            if (arr[j] > arr[j + 1]) {
                int temp = arr[j];
                arr[j] = arr[j + 1];
                arr[j + 1] = temp;
            }
        }
    }

    // 输出排序后的数组
    cout << "排序后的数组：";
    for (int i = 0; i < len; i++) {
        cout << arr[i] << " ";
    }
    cout << endl;

    return 0;
}
