#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void elementwise_1D_1D_log_grad(float* in_x, float* in_d, float* out_x, float* out_d, int size) {
    // Calculate global thread index
    int tid = blockIdx.x * blockDim.x + threadIdx.x;

    // Use `grid-stride loop` for larger datasets
    int stride = gridDim.x * blockDim.x;

    // Unroll loop to improve performance
    for (; tid < size; tid += stride) {
        if (tid < size) {
            // Perform computation with atomic addition for accumulation
            atomicAdd(&in_d[tid], out_d[tid] / in_x[tid]);
        }
    }
}