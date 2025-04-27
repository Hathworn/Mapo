#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void gSetSparse(float* out, const size_t* indices, const float* values, int length) {
    // Optimize: use a single loop with stride for better parallelization
    int index = blockIdx.x * blockDim.x + threadIdx.x;
    int stride = blockDim.x * gridDim.x;
    for(int i = index; i < length; i += stride) {
        out[indices[i]] = values[i];
    }
}