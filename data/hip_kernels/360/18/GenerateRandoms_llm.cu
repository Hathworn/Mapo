#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void GenerateRandoms(int size, int iterations, unsigned int *randoms, unsigned int *seeds) {
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    if (idx >= size) return; // Exit early if idx is beyond size, reducing unnecessary calculations.

    unsigned int z = seeds[idx];
    int offset = idx;
    int step = 32768;

    for (int i = 0; i < iterations; i++) {
        unsigned int b = (((z << 13) ^ z) >> 19);
        z = (((z & UINT_MAX) << 12) ^ b);
        randoms[offset] = z;
        offset += step;
        if (offset >= size) break; // Exit loop when offset is beyond size to save computation.
    }
}