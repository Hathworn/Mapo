#include "hip/hip_runtime.h"
#include "includes.h"

// Optimize workload distribution and memory access
__global__ void elementwise_1D_1D_mul(float* in1, float* in2, float* out, int size) {
    int tid = blockIdx.x * blockDim.x + threadIdx.x;
    int stride = gridDim.x * blockDim.x;

    // Unroll loop for better performance
    for (int i = tid; i < size; i += stride) {
        out[i] = in1[i] * in2[i];
    }
}