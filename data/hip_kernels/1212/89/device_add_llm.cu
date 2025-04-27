#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void device_add(int *a, int *b, int *c) {
    // Calculate the global index
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    // Perform addition
    c[idx] = a[idx] + b[idx];
}