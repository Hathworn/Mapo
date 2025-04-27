#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void add(int *a, int *b, int *c, int n) {
    // Use a more descriptive variable name for index
    int globalIdx = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Unroll the loop for potentially better performance
    if (globalIdx < n) {
        c[globalIdx] = a[globalIdx] + b[globalIdx];
    }
}