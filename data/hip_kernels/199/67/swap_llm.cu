#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void swap(unsigned short *d_input, float *d_output, int nchans, int nsamp) {
    
    // Calculate global thread index
    size_t t = blockIdx.x * blockDim.x + threadIdx.x;
    size_t c = blockIdx.y * blockDim.y + threadIdx.y;

    // Check bounds to prevent out-of-bounds access
    if (t < nsamp && c < nchans) {
        d_input[c * nsamp + t] = (unsigned short) __ldg(&d_output[c * nsamp + t]);
    }
}