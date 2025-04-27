#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void elementwise_1D_1D_square_grad(float* in_x, float* in_d, float* out_x, float* out_d, int size) {
    int tid = blockIdx.x * blockDim.x + threadIdx.x;
    int stride = gridDim.x * blockDim.x;
    for (; tid < size; tid += stride) {
        // Optimize: Use register to store repeated calculation
        float temp = out_d[tid] * 2 * in_x[tid];
        in_d[tid] += temp;
    }
}