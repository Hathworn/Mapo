#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void simple_corner_turn_kernel(unsigned short *d_input, float *d_output, int nchans, int nsamp) {

    // Calculate unique global index for current thread
    size_t threadId = threadIdx.y * blockDim.x + threadIdx.x;
    size_t blockId = blockIdx.y * gridDim.x + blockIdx.x;
    size_t index = blockId * blockDim.x * blockDim.y + threadId;
   
    // Ensure index is within bounds before accessing memory
    if (index < nchans * nsamp) {
        size_t t = index % nsamp;
        size_t c = index / nsamp;
        d_output[c * nsamp + t] = static_cast<float>(__ldg(&d_input[t * nchans + c]));
    }
}