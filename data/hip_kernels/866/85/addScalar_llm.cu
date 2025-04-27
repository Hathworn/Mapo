#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void addScalar(float* in, float* out, float add, int size) {
    int tid = blockIdx.x * blockDim.x + threadIdx.x;
    int stride = gridDim.x * blockDim.x;
    
    // Loop unrolling for improved performance
    for (; tid < size; tid += stride) {
        if (tid < size) out[tid] = in[tid] + add;
        if (tid + stride < size) out[tid + stride] = in[tid + stride] + add;
    }
}