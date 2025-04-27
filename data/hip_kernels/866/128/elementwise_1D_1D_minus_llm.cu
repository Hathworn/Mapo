#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void elementwise_1D_1D_minus(float* in1, float* in2, float* out, int size) {
    // Calculate global thread index and grid stride
    int tid = blockIdx.x * blockDim.x + threadIdx.x;
    int stride = gridDim.x * blockDim.x;

    // Optimize loop by removing redundant if condition
    for (; tid < size; tid += stride) {
        out[tid] = in1[tid] - in2[tid];
    }
}