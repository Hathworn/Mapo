#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void elementwise_1D_1D_log_grad(float* in_x, float* in_d, float* out_x, float* out_d, int size) {
    int tid = blockIdx.x * blockDim.x + threadIdx.x;

    // Unroll loop for better efficiency
    for (; tid < size; tid += blockDim.x * gridDim.x) {
        if (tid < size) {
            in_d[tid] += out_d[tid] / in_x[tid];
        }
    }
}