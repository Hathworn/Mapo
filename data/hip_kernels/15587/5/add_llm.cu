#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void add(int *a, int *b, int *c, int n) {
    // Calculate the global index.
    int index = threadIdx.x + blockIdx.x * blockDim.x;

    // Ensure no threads do unnecessary work.
    if (index < n) {
        // Perform the addition only for valid indices.
        c[index] = a[index] + b[index];
    }
}