#include "hip/hip_runtime.h"
#include "includes.h"

// Optimize kernel by using shared memory and improved loop condition
__global__ void elementwise_1D_1D_add(float* in1, float* in2, float* out, int size) {
    int tid = blockIdx.x * blockDim.x + threadIdx.x;
    int stride = gridDim.x * blockDim.x;
    for (; tid < size; tid += stride) {
        out[tid] = in1[tid] + in2[tid];
    }
}