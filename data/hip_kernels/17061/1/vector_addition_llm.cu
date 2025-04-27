#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void vector_addition(int *a, int *b, int *c, int n) {
    // Calculate global index for the element
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Ensure the thread index is within range
    if (i < n) {
        c[i] = a[i] + b[i];
    }
}