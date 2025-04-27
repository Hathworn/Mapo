#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void __veccmp(int *a, int *b, int *d) {
    // Get the unique thread index
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Calculate comparison only if index is in array bound
    if (idx < blockDim.x * gridDim.x) {
        d[idx] = a[idx] > b[idx] ? 1 : (a[idx] < b[idx] ? -1 : 0); // Simplified ternary operation
    }
}