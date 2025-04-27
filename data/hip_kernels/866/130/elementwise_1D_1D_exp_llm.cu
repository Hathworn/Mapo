#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void elementwise_1D_1D_exp(float* in, float* out, int size) {
    int tid = blockIdx.x * blockDim.x + threadIdx.x;
    // Use a conditional check to eliminate unnecessary loop iterations
    if (tid < size) {
        out[tid] = exp(in[tid]);
    }
    // Parallelize the remainder tasks using stride
    tid += blockDim.x * gridDim.x;
    while (tid < size) {
        out[tid] = exp(in[tid]);
        tid += blockDim.x * gridDim.x;
    }
}