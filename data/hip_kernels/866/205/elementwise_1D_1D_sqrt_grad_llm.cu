#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void elementwise_1D_1D_sqrt_grad(float* in_x, float* in_d, float* out_x, float* out_d, int size) {
    // Calculate unique thread index
    int tid = blockIdx.x * blockDim.x + threadIdx.x;

    // Use stride for efficient memory access pattern
    int stride = blockDim.x * gridDim.x;

    // Process elements in stride increments
    while (tid < size) {
        in_d[tid] += out_d[tid] / (2 * out_x[tid]); // Optimize division and operation order
        tid += stride;
    }
}