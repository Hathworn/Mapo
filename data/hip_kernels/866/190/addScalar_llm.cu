#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void addScalar(float* in, float* out, float add, int size) {
    // Calculate the thread index
    int tid = blockIdx.x * blockDim.x + threadIdx.x;
    int stride = gridDim.x * blockDim.x;
    
    // Improved loop with tid check within loop condition
    for (; tid < size; tid += stride) {
        out[tid] = in[tid] + add;
    }
}