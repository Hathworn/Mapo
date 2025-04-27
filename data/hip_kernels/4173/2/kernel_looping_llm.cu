#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kernel_looping(float *point, unsigned int num) {
    unsigned int idx = threadIdx.x + blockIdx.x * blockDim.x;
    unsigned int stride = gridDim.x * blockDim.x;  // Pre-compute stride

    for (int iloop = 0; iloop < NLOOPS; ++iloop) {
        for (size_t offset = idx; offset < num; offset += stride) {
            point[offset] += 1;
        }
    }
}