#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void countRest(int *bin, int *bin_counters, const int num_bins, const int maxBin, const int n)
{
    unsigned int xIndex = blockDim.x * blockIdx.x + threadIdx.x;
    if (xIndex < n) {
        int binValue = bin[xIndex];
        // Combine both conditions to minimize divergence
        if (binValue >= maxBin && binValue < num_bins) {
            atomicAdd(&bin_counters[binValue], 1); // Directly use binValue instead of recalculating
        }
    }
}