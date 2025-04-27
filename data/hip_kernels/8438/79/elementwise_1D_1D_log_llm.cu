#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void elementwise_1D_1D_log(float* __restrict__ in, float* __restrict__ out, int size) {
    int tid = blockIdx.x * blockDim.x + threadIdx.x;
    int stride = gridDim.x * blockDim.x;
    for (; tid < size; tid += stride) {
        // Ensure thread accesses in-bounds element of input and output
        if (tid < size) {
            out[tid] = logf(in[tid]); // Use logf for single-precision floats
        }
    }
}