#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void writeGlobalMemoryUnit(float *output, int size, int repeat) {
    int gid = threadIdx.x + (blockDim.x * blockIdx.x), j;
    int s = gid * 512;
    
    // Unrolling loop for coalesced global memory access
    for (j = 0; j < repeat; ++j) {
        #pragma unroll
        for (int offset = 0; offset < 16; ++offset) {
            output[(s + offset) & (size - 1)] = gid;
        }
        s = (s + 16) & (size - 1);
    }
}