#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void add(int *a, int *b, int *c) {
    int index = threadIdx.x + blockIdx.x * blockDim.x;
    
    // Check for out-of-bounds access
    if(index < gridDim.x * blockDim.x) {
        c[index] = a[index] + b[index];
    }
}