#include "hip/hip_runtime.h"
#include "includes.h"

// Optimize global kernel function for better parallelism
__global__ void gSetSparse(float* out, const size_t* indices, const float* values, int length) {
    int index = blockIdx.x * blockDim.x + threadIdx.x;
    if (index < length) {
        out[indices[index]] = values[index];
    }
}