/* quick_sort.c */
#include "quick_sort.h"

static void swap(int *a, int *b) { int t = *a; *a = *b; *b = t; }

static int partition(int a[], int low, int high) {
    int pivot = a[high], i = low - 1;
    for (int j = low; j < high; ++j)
        if (a[j] <= pivot) swap(&a[++i], &a[j]);
    swap(&a[i + 1], &a[high]);
    return i + 1;
}

void quick_sort(int a[], int low, int high) {
    if (low < high) {
        int p = partition(a, low, high);
        quick_sort(a, low, p - 1);
        quick_sort(a, p + 1, high);
    }
}
