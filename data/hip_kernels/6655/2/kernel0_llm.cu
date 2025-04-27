```c
#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void kernel0(int n, float a, float *x, float *y) {
    
    int i = blockIdx.x * blockDim.x + threadIdx.x;

    // Optimize by removing the unused for-loop and initializing x and y via parallel threads
    if (i < n) {
        x[i] = 1.0f;
        y[i] = 2.0f;
        y[i] = a * x[i] + y[i];
    }
}