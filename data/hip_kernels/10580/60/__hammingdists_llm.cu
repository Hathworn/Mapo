#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void __hammingdists(int *a, int *b, int *w, int *op, int *ow, int n) {
    // Calculate global thread index
    int idx = blockIdx.x * blockDim.x + threadIdx.x;

    // Use a loop to handle multiple elements per thread
    for (int i = idx; i < n; i += gridDim.x * blockDim.x) {
        // Example: Compute hamming distance between a[i] and b[i]
        int x = a[i] ^ b[i];
        int dist = 0;

        // Count the number of set bits
        for (; x; x >>= 1)
            dist += x & 1;

        // Store result to output arrays
        op[i] = dist;
        ow[i] = w[i];
    }
}