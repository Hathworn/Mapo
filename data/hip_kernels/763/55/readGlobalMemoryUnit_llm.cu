#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void readGlobalMemoryUnit(float *data, float *output, int size, int repeat)
{
    int gid = threadIdx.x + (blockDim.x * blockIdx.x);
    float sum = 0;
    int s = gid * 512;
    // Unroll loop and simplify addressing
    for (int j = 0; j < repeat; ++j) {
        #pragma unroll
        for (int k = 0; k < 16; ++k) {
            sum += data[(s + k) & (size - 1)];
        }
        s = (s + 16) & (size - 1);
    }
    output[gid] = sum;
}