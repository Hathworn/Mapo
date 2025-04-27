#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void multiplyBy2_self(int size, long *inout) {
    int ix = blockIdx.x * blockDim.x + threadIdx.x;

    // Unroll the loop to utilize more threads and reduce loop overhead
    int stride = gridDim.x * blockDim.x;
    for (int i = ix; i < size; i += stride) {
        inout[i] *= 2;  // Minimize access to global memory
    }
}