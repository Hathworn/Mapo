#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void add_thread(int *a, int *b, int *c) {
    // Calculate global index for the thread within the grid
    int index = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Perform addition if within bounds
    if (index < blockDim.x) {
        c[index] = a[index] + b[index];
    }
}