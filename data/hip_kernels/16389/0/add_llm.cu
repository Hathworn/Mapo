#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void add(int *a, int *b, int *c, int size) {
    // Calculate the global thread index
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Check to ensure index is within bounds
    if (idx < size) {
        c[idx] = a[idx] + b[idx];
    }
}