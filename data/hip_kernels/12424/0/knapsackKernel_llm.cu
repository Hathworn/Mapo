```c
#include "hip/hip_runtime.h"
#include "includes.h"

#define index(i, j, N)  ((i)*(N+1)) + (j)

__device__ int maximum(int a, int b) {
    return (a > b)? a : b;
}

__global__ void knapsackKernel(int *profits, int *weights, int *f, int capacity, int i) {
    int c = threadIdx.x;
    int idx = index(i, c, capacity); // Pre-compute index for current item

    if (i == 0 || c == 0) {
        f[idx] = 0; // Initialize base case
    } else {
        int idx_prev = index(i - 1, c, capacity); // Pre-compute previous row index
        if (weights[i - 1] <= c) {
            // Utilize pre-computed index for better readability
            f[idx] = maximum(f[idx_prev], profits[i - 1] + f[index(i - 1, c - weights[i - 1], capacity)]);
        } else {
            f[idx] = f[idx_prev];
        }
    }
}