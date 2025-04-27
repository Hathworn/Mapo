#include "hip/hip_runtime.h"
#include "includes.h"

__constant__ float *c_Kernel;

// Global kernel optimized for performance
__global__ void subtract(float *d_dst, const float *d_src_1, const float *d_src_2, int len) {
    // Calculate the global thread index
    int baseX = blockIdx.x * blockDim.x + threadIdx.x;

    // Ensure index within array bounds
    if (baseX < len) {
        d_dst[baseX] = d_src_1[baseX] - d_src_2[baseX];
    }
}