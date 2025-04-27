#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void multiplyBy2_self(int size, long *inout) {
    // Use shared memory to improve memory access speed and reduce global memory access
    extern __shared__ long sharedData[];
    const int ix = threadIdx.x + blockIdx.x * blockDim.x;

    if (ix < size) {
        // Load from global memory to shared memory
        sharedData[threadIdx.x] = inout[ix];
        __syncthreads();

        // Perform computation using shared memory
        sharedData[threadIdx.x] *= 2;

        // Synchronize before writing back to global memory
        __syncthreads();
        inout[ix] = sharedData[threadIdx.x];
    }
}