#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void rinit(float *init, const unsigned int *fsum, const float *ncrs) {
    // Calculate global thread index
    unsigned int idx = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Use fast-math intrinsic for square root to improve performance
    init[idx] = __fsqrt_rn((float)fsum[idx] / ncrs[idx]);
}