#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kernel(int *a, int *b, int *c) {
    // Calculate the global index
    int idx = threadIdx.x + blockIdx.x * blockDim.x;

    // Ensure index is within bounds
    if (idx < N) {
        // Efficiently calculate indices with modulo operation
        int idx1 = (idx + 1) & 255;  // Use bitwise AND as a faster modulo with 256
        int idx2 = (idx + 2) & 255;

        // Combine calculations to reduce the number of operations
        float sum_a = a[idx] + a[idx1] + a[idx2];
        float sum_b = b[idx] + b[idx1] + b[idx2];

        // Compute the average and assign to c
        c[idx] = (sum_a + sum_b) / 6.0f;  // Dividing by 6 instead of 3 twice
    }
}