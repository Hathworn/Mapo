#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void elementwise_1D_1D_square(float* in, float* out, int size) {
    int tid = blockIdx.x * blockDim.x + threadIdx.x;
    int stride = gridDim.x * blockDim.x;

    // Loop to handle out-of-bounds within the condition
    for (; tid < size; tid += stride) {
        out[tid] = in[tid] * in[tid];
    }
}