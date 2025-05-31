#include <stdio.h>

extern void bubble_sort(int arr[], int n);
extern void quick_sort(int arr[], int low, int high);
extern void radix_sort(int arr[], int n);
extern void print_array(int arr[], int n);

void copy_array(int dest[], int src[], int n) {
    for (int i = 0; i < n; i++)
        dest[i] = src[i];
}

int main(void) {
    int original[] = {5, 3, 8, 1, 2};
    int n = sizeof(original) / sizeof(original[0]);
    int arr[n];

    // Bubble sort
    copy_array(arr, original, n);
    printf("Before Bubble Sort:\n");
    print_array(arr, n);
    bubble_sort(arr, n);
    printf("After Bubble Sort:\n");
    print_array(arr, n);
    printf("\n");

    // Quick sort
    copy_array(arr, original, n);
    printf("Before Quick Sort:\n");
    print_array(arr, n);
    quick_sort(arr, 0, n - 1);
    printf("After Quick Sort:\n");
    print_array(arr, n);
    printf("\n");

    // Radix sort
    copy_array(arr, original, n);
    printf("Before Radix Sort:\n");
    print_array(arr, n);
    radix_sort(arr, n);
    printf("After Radix Sort:\n");
    print_array(arr, n);
    printf("\n");

    return 0;
}
