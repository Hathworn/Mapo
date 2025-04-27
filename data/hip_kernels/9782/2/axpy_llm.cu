#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void axpy(float a, float* x, float* y) {
    // Optimize memory access by computing the global thread index
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Perform axpy operation using the computed global index
    y[idx] = a * x[idx];
}