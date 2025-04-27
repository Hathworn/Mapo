#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void copy_const_kernel(float *iptr, const float *cptr) {
    // Calculate the global thread index
    int x = blockIdx.x * blockDim.x + threadIdx.x;
    int y = blockIdx.y * blockDim.y + threadIdx.y;
    int offset = x + y * blockDim.x * gridDim.x;

    // Perform copy only if condition is met
    if (cptr[offset] != 0.0f) {
        iptr[offset] = cptr[offset];
    }
}