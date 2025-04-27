#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void elementwise_1D_1D_sqrt_grad(float* in_x, float* in_d, float* out_x, float * out_d, int size) {
    int tid = blockIdx.x * blockDim.x + threadIdx.x;
    // Optimize by removing branch condition from the loop
    if (tid < size) {
        int stride = gridDim.x * blockDim.x;
        // Unroll the loop to process multiple elements per thread
        for (; tid < size; tid += stride) {
            in_d[tid] += out_d[tid] / out_x[tid] / 2;
        }
    }
}