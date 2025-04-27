#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void elementwise_1D_1D_exp(float* __restrict__ in, float* __restrict__ out, int size) {
    // Calculate a unique thread index optimized with memory coalescing.
    int tid = blockIdx.x * blockDim.x + threadIdx.x;
    int stride = blockDim.x * gridDim.x;

    // Loop unrolling for better performance.
    for(int i = tid; i < size; i += stride) {
        out[i] = exp(in[i]);
    }
}