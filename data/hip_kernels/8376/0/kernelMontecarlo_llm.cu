#include "hip/hip_runtime.h"
#include "includes.h"
#define N 128*128

__global__ void kernelMontecarlo(float *x, float *y, int *contador) {
    int idx = blockIdx.x * blockDim.x + threadIdx.x; // Use 1D indexing for simplicity
    if (idx < N) { // Ensure index is within bounds
        float x_val = x[idx];
        float y_val = y[idx];
        if ((x_val * x_val + y_val * y_val) <= 1.0f) { // Check condition
            atomicAdd(contador, 1); // Safely increment counter
        }
    }
}