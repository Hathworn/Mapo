#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void addScalar(float* in, float* out, float add, int size) {
    int tid = blockIdx.x * blockDim.x + threadIdx.x;
    int stride = gridDim.x * blockDim.x;
    
    // Use modulo operation to ensure tid is within bounds
    if (tid < size) {
        out[tid] = in[tid] + add;
    }

    // Loop unrolling for better performance
    for (tid += stride; tid < size; tid += stride) {
        out[tid] = in[tid] + add;
    }
}