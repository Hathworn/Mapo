#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void update_bins(float *vec, int *bin, int *bin_counters, const int num_bins, const int n, const float slope, const float intercept)
{
    // Compute index and ensure it is within bounds
    unsigned int xIndex = blockIdx.x * blockDim.x + threadIdx.x;
    if (xIndex >= n) return;

    // Calculate the new bin value
    float temp = fabsf(vec[xIndex]); // Use fast absolute value function
    int bin_new_val = (temp > (intercept * 0.000001f)) ? slope * (intercept - temp) : num_bins;

    // Update bin and bin_counters only if there is a change
    if (bin[xIndex] != bin_new_val)
    {
        if (bin[xIndex] < num_bins)
            atomicSub(&bin_counters[bin[xIndex]], 1); // Use atomicSub for clarity

        if (bin_new_val < num_bins)
            atomicAdd(&bin_counters[bin_new_val], 1);

        bin[xIndex] = bin_new_val;
    }
}