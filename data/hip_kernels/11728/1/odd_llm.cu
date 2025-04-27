#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void odd(int *darr, int n) {
    int k = threadIdx.x * 2 + 1; // Calculate index once
    if (k <= n - 2) {
        int current = darr[k];
        int next = darr[k + 1];
        if (current > next) {
            darr[k] = next;
            darr[k + 1] = current;
        }
    }
}