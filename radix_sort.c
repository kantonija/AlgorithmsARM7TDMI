/* radix_sort.c */
#include "radix_sort.h"
#include <stdlib.h>

static int getMax(int a[], int n) {
    int mx = a[0];
    for (int i = 1; i < n; ++i) if (a[i] > mx) mx = a[i];
    return mx;
}

static void countSort(int a[], int n, int exp) {
    int *out = malloc(n * sizeof(int)), cnt[10] = {0};
    for (int i = 0; i < n; ++i) cnt[(a[i] / exp) % 10]++;
    for (int i = 1; i < 10; ++i) cnt[i] += cnt[i - 1];
    for (int i = n - 1; i >= 0; --i) out[--cnt[(a[i] / exp) % 10]] = a[i];
    for (int i = 0; i < n; ++i) a[i] = out[i];
    free(out);
}

void radix_sort(int a[], int n) {
    for (int m = getMax(a, n), exp = 1; m / exp; exp *= 10)
        countSort(a, n, exp);
}
