#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kernel_looping(float *point, unsigned int num) {
    // Calculate global index
    unsigned int idx = threadIdx.x + blockIdx.x * blockDim.x;
    // Calculate stride size for loops
    unsigned int stride = gridDim.x * blockDim.x;

    for (int iloop = 0; iloop < NLOOPS; ++iloop) {
        // Unroll loop to improve performance
        for (size_t offset = idx; offset < num; offset += stride) {
            point[offset] += 1;
        }
    }
}