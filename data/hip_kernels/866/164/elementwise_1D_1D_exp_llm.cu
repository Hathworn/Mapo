#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void elementwise_1D_1D_exp(float* in, float* out, int size) {
    int tid = blockIdx.x * blockDim.x + threadIdx.x;
    int gridSize = gridDim.x * blockDim.x; // Precompute the total number of threads

    for (; tid < size; tid += gridSize) {
        // Perform the operation only when within bounds
        out[tid] = exp(in[tid]);
    }
}