#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void simple_corner_turn_kernel(unsigned short *d_input, float *d_output, int nchans, int nsamp) {
    // Use a single index to improve coalesced memory access
    size_t idx = blockIdx.y * blockDim.y * nsamp + blockIdx.x * blockDim.x + threadIdx.y * nsamp + threadIdx.x;

    if (threadIdx.y < nchans && threadIdx.x < nsamp) {
        // Using shared memory could be unnecessary without further context
        d_output[idx] = (float) __ldg(&d_input[idx]);
    }
}