#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void _dev_saxpy(int n, float a, float* x, float* y, float* result) {
    // Calculate global thread index
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Ensure thread index does not exceed array bounds
    if (idx < n) {
        // Perform the SAXPY operation: result = a * x + y
        result[idx] = a * x[idx] + y[idx];
    }
}