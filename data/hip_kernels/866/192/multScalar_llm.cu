#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void multScalar(float* in, float* out, float mult, int size) {
    int tid = blockIdx.x * blockDim.x + threadIdx.x; 
    int stride = gridDim.x * blockDim.x;
    // Optimize: Remove redundant check within the loop
    if (tid < size) {
        for (; tid < size; tid += stride) {
            out[tid] = in[tid] * mult;
        }
    }
}