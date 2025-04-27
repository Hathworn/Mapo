#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void elementwise_1D_1D_sqrt_grad(float* in_x, float* in_d, float* out_x, float * out_d, int size) {
    // Calculate the global thread index
    int tid = blockIdx.x * blockDim.x + threadIdx.x;
    int stride = gridDim.x * blockDim.x;

    // Optimized loop with bounds checking
    while (tid < size) {
        in_d[tid] += out_d[tid] / out_x[tid] / 2;  // Direct arithmetic operation
        tid += stride;
    }
}