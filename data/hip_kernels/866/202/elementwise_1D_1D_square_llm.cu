#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void elementwise_1D_1D_square(float* in, float* out, int size) {
    int tid = blockIdx.x * blockDim.x + threadIdx.x;
    int stride = blockDim.x * gridDim.x;

    // Use a while loop for cleaner logic
    while (tid < size) {
        out[tid] = in[tid] * in[tid];
        tid += stride;
    }
}