#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void axpy(float a, float* x, float* y, int n) {
    // Calculate global index for concurrent execution
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    // Perform axpy operation if index is within bounds
    if (idx < n) {
        y[idx] = a * x[idx];
    }
}