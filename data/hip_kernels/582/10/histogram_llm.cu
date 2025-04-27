#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void histogram(const float* d_in, unsigned int* d_out, const float lumMin, const float lumRange, const size_t numBins, const size_t size)
{
    int abs_x = threadIdx.x + blockDim.x * blockIdx.x;

    // Check if the thread's index is within bounds
    if (abs_x >= size)
    {
        return;
    }

    // Calculate bin index
    int bin = (d_in[abs_x] - lumMin) / lumRange * numBins;

    // Use atomic operation to update histogram bin
    atomicAdd(&(d_out[bin]), 1);
}