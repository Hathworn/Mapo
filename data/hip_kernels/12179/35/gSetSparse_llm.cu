#include "hip/hip_runtime.h"
#include "includes.h"

// Optimize kernel by using grid-stride loop
__global__ void gSetSparse(float* out, const size_t* indices, const float* values, int length) {
    int index = blockDim.x * blockIdx.x + threadIdx.x;
    int stride = blockDim.x * gridDim.x;
    for(int i = index; i < length; i += stride) {
        out[indices[i]] = values[i];
    }
}