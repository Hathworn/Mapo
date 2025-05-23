```c
#include "hip/hip_runtime.h"
#include "includes.h"

#define index(i, j, N)  ((i)*(N+1)) + (j)

__device__ int maximum(int a, int b) {
    return (a > b) ? a : b;
}

__global__ void knapsackKernel(int *profits, int *weights, int *f, int capacity, int i) {
    int c = threadIdx.x + blockIdx.x * blockDim.x;  // Expand computation across threads
    if (c > capacity) return;  // Boundary check to avoid invalid memory access

    // Coalesced memory access by having blocks work on consecutive ranges
    if (i == 0 || c == 0) {
        f[index(i, c, capacity)] = 0;
    } else if (weights[i - 1] <= c) {
        f[index(i, c, capacity)] = maximum(f[index(i - 1, c, capacity)], profits[i - 1] + f[index(i - 1, c - weights[i - 1], capacity)]);
    } else {
        f[index(i, c, capacity)] = f[index(i - 1, c, capacity)];
    }
}