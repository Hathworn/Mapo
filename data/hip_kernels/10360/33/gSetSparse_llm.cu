#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void gSetSparse(float* out, const size_t* indices, const float* values, int length) {
    // Calculate global thread index
    int index = blockIdx.x * blockDim.x + threadIdx.x;
    // Use stride loop for improved memory access pattern
    for(; index < length; index += blockDim.x * gridDim.x) {
        out[indices[index]] = values[index];
    }
}