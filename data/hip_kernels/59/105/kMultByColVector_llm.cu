```c
#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kMultByColVector(float* __restrict__ mat, float* __restrict__ vec, float* __restrict__ tgtMat, unsigned int width, unsigned int height) {
    const unsigned int idx = blockIdx.x * blockDim.x + threadIdx.x;
    const unsigned int stride = gridDim.x * blockDim.x;

    for (unsigned int i = idx; i < width * height; i += stride) {
        // Load vector element into a register to reduce global memory access
        float vecElement = vec[i % height];  
        tgtMat[i] = mat[i] * vecElement;
    }
}