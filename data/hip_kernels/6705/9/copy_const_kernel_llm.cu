#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void copy_const_kernel(float *iptr, const float *cptr) {
    // Calculate offset in a 1D fashion to maximize memory coalescing
    int offset = threadIdx.x + blockDim.x * (threadIdx.y + blockDim.y * (blockIdx.y + gridDim.y * blockIdx.x));

    // Conditional copy to iptr only if cptr is non-zero
    if (cptr[offset] != 0) {
        iptr[offset] = cptr[offset];
    }
}