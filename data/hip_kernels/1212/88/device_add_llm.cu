#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void device_add(int *a, int *b, int *c) {
    // Calculate the global index for the thread
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    // Perform bounds checking to prevent accessing out-of-bounds
    if (idx < gridDim.x * blockDim.x) {
        c[idx] = a[idx] + b[idx];
    }
}