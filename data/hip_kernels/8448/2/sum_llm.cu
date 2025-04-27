#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void sum(float *a, float *b, float *c, int n) {
    // Calculate the global index
    int index = blockDim.x * blockIdx.x + threadIdx.x;
    
    // Ensure the index is within bounds
    if (index < n) {
        c[index] = a[index] + b[index];
    }
}