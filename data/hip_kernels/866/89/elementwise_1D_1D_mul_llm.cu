#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void elementwise_1D_1D_mul(float* in1, float* in2, float* out, int size) {
    int tid = blockIdx.x * blockDim.x + threadIdx.x;
    int stride = gridDim.x * blockDim.x;
    // Loop unrolling for better efficiency
    while (tid < size) {
        out[tid] = in1[tid] * in2[tid];
        tid += stride;
    }
}