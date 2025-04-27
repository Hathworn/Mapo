#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void elementwise_1D_1D_mul_mutate(float* in1, float* in2, float* out, int size) {
    int tid = blockIdx.x * blockDim.x + threadIdx.x;
    int stride = gridDim.x * blockDim.x;

    // Optimize loop to avoid unnecessary boundary check
    if (tid < size) {
        for (; tid < size; tid += stride) {
            out[tid] += in1[tid] * in2[tid];
        }
    }
}