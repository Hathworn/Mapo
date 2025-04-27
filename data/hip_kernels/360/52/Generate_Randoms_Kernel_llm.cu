#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void Generate_Randoms_Kernel(int size, int iterations, unsigned int *randoms, unsigned int *seeds)
{
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    unsigned int z = seeds[idx];
    int offset = idx;
    const int step = 32768;

    // Optimize loop by removing conditional branch and adjusting loop count
    int maxOffset = size / step * step + idx;
    for (int i = 0; i < iterations && offset < maxOffset; i++)
    {
        unsigned int b = (((z << 13) ^ z) >> 19);
        z = (((z & UINT_MAX) << 12) ^ b);
        randoms[offset] = z;
        offset += step;
    }
}