#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void reduce(int *a, int *b, int n) {
    // Calculate global index
    unsigned int i = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Check index boundary
    if (i < n) {
        // Perform atomic addition to avoid race conditions
        atomicAdd(b, a[i]);
    }
}