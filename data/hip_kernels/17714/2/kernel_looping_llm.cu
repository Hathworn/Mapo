#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kernel_looping(float *point, unsigned int num) {
    unsigned int idx = threadIdx.x + blockIdx.x * blockDim.x;
    unsigned int stride = gridDim.x * blockDim.x; // Compute stride once for efficiency

    // Loop unrolling optimization
    for (int iloop = 0; iloop < NLOOPS; ++iloop) {
        size_t offset = idx;
        while (offset < num) {
            point[offset] += 1;
            offset += stride;
        }
    }
}