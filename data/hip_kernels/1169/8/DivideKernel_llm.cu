#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void DivideKernel ( float *d_dst, unsigned short *d_denom ) {
    const int idx = blockIdx.x * blockDim.x + threadIdx.x; // Use both block and thread indices
    if (idx < gridDim.x * blockDim.x) { // Boundary check to avoid out of bounds
        d_dst[idx] /= d_denom[idx]; // Perform division
    }
}