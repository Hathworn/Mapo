#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void mul_sub(float* in1, float* in2, float* out, int in1ScalarCount, int in2ScalarCount) {
    int tid = blockIdx.x * blockDim.x + threadIdx.x;
    int stride = gridDim.x * blockDim.x;
    // Optimize by unrolling the loop for improved performance
    int tidMod = tid % in2ScalarCount;
    for (; tid < in1ScalarCount; tid += stride) {
        out[tid] = in1[tid] * in2[tidMod];
        tidMod = (tidMod + 1) % in2ScalarCount; // Calculate mod outside the loop
    }
}