#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void device_add(int *a, int *b, int *c) {
    // Calculate the global index for the current thread
    int idx = blockIdx.x * blockDim.x + threadIdx.x;  
    // Perform the addition for each thread
    c[idx] = a[idx] + b[idx];
}