#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void cu_lessThan(const float* __restrict__ src, float* __restrict__ dst, const float val, const int n) {
    int tid = threadIdx.x + blockIdx.x * blockDim.x;
    int stride = blockDim.x * gridDim.x;
    
    for(int i = tid; i < n; i += stride) {
        // Use branchless assignment for better performance
        dst[i] = (src[i] < val) ? 1.0f : 0.0f;
    }
}