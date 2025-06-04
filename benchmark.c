#include <stdio.h>
#include <stdlib.h>
#include <time.h>

// Deklaracije sortirajućih funkcija 
void quick_sort(int arr[], int low, int high);
void radix_sort(int arr[], int n);
void bubble_sort(int arr[], int n);

#define SIZE 1000

void generate_random_array(int *arr, int size) {
    for (int i = 0; i < size; i++) {
        arr[i] = rand() % 10000;
    }
}

void copy_array(int *src, int *dest, int size) {
    for (int i = 0; i < size; i++) {
        dest[i] = src[i];
    }
}

int main() {
    srand((unsigned int)time(NULL));

    int original[SIZE];
    int copy[SIZE];

    generate_random_array(original, SIZE);

    clock_t start, end;
    double time_taken;

    // Bubble Sort
    copy_array(original, copy, SIZE);
    start = clock();
    bubble_sort(copy, SIZE);
    end = clock();
    time_taken = ((double)(end - start)) / CLOCKS_PER_SEC;
    printf("Bubble Sort time: %f seconds\n", time_taken);

    // Quick Sort
    copy_array(original, copy, SIZE);
    start = clock();
    quick_sort(copy, 0, SIZE - 1);
    end = clock();
    time_taken = ((double)(end - start)) / CLOCKS_PER_SEC;
    printf("Quick Sort time: %f seconds\n", time_taken);

    // Radix Sort
    copy_array(original, copy, SIZE);
    start = clock();
    radix_sort(copy, SIZE);
    end = clock();
    time_taken = ((double)(end - start)) / CLOCKS_PER_SEC;
    printf("Radix Sort time: %f seconds\n", time_taken);

    return 0;
}
