#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kernel_looping(float *point, unsigned int num) {
    unsigned int idx = threadIdx.x + blockIdx.x * blockDim.x;

    // Unroll the outer loop to reduce loop overhead and improve performance
    #pragma unroll
    for (int iloop = 0; iloop < NLOOPS; ++iloop) {
        for (size_t offset = idx; offset < num; offset += gridDim.x * blockDim.x) {
            point[offset] += 1;
        }
    }
}