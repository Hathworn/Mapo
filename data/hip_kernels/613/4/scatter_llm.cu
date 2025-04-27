```c
#include "hip/hip_runtime.h"
#include "includes.h"

// Udacity HW 4
// Radix Sorting

__global__ void scatter(unsigned int *in, unsigned int *in_pos, unsigned int *out, unsigned int *out_pos, unsigned int n, unsigned int *d_histScan, unsigned int mask, unsigned int current_bits, unsigned int nBins)
{
    unsigned int tid = blockDim.x * blockIdx.x + threadIdx.x;
    if (tid < n)
    {
        // Calculate the bin for each thread's element
        unsigned int bin = (in[tid] >> current_bits) & mask;
        unsigned int index = atomicAdd(&d_histScan[bin * gridDim.x + blockIdx.x], 1);
        
        // Write to the output array at the correct bin position
        out[index] = in[tid];
        out_pos[index] = in_pos[tid];
    }
}