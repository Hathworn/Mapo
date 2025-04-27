#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void sum(int *a, int *b, int *c) {
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    int stride = gridDim.x * blockDim.x; // Calculate stride outside the loop
    for (; i < N; i += stride) {         // Use for loop for clarity
        c[i] = a[i] + b[i];              // Perform sum operation
    }
}