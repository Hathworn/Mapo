#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void device_add(int *a, int *b, int *c) {
    // Pre-compute the index to reduce recalculation
    int index = threadIdx.x + blockIdx.x * blockDim.x;
    if (index < (gridDim.x * blockDim.x)) { // Check bounds to avoid out of range access
        c[index] = a[index] + b[index];
    }
}