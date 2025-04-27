#include "hip/hip_runtime.h"
#include "includes.h"

__constant__ float *c_Kernel;

__global__ void add(float *d_dst, const float *d_src_1, int len) {
    int baseX = blockIdx.x * blockDim.x + threadIdx.x;

    // Use shared memory for better performance in future complex operations
    if (baseX < len) {
        d_dst[baseX] += d_src_1[baseX]; // Simplified in-place addition
    }
}