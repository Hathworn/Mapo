#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void elementwise_1D_1D_mul(float* in1, float* in2, float* out, int size) {
    // Calculate unique thread index
    int tid = blockIdx.x * blockDim.x + threadIdx.x;
    // Use stride to efficiently divide work among threads
    int stride = gridDim.x * blockDim.x;
    // Efficiently handle out-of-bound access with single check
    while (tid < size) {
        out[tid] = in1[tid] * in2[tid];
        tid += stride;
    }
}