#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void unpack8bits_kernel(float *rcp, float *lcp, const int8_t *src) {
    // Calculate global index
    const size_t i = blockDim.x * blockIdx.x + threadIdx.x;
    const size_t j = i * 2;
    
    // Optimize load by using a temporary variable
    int8_t src_j = src[j];
    int8_t src_j1 = src[j + 1];
    
    rcp[i] = static_cast<float>(src_j);
    lcp[i] = static_cast<float>(src_j1);
}