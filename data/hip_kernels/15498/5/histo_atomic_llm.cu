#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void histo_atomic(unsigned int *out_histo, const float *d_in, int num_bins, int size, float min_val, float range)
{
    // Calculate the global thread ID
    int id = threadIdx.x + blockIdx.x * blockDim.x;

    // Exit if thread ID is out of bounds
    if (id >= size)
    {
        return;
    }

    // Calculate the histogram bin index
    int bin = ((d_in[id] - min_val) * num_bins) / range;
    bin = bin == num_bins ? num_bins - 1 : bin; // Ensure max value falls into the last bin

    // Atomically increment the histogram bin
    atomicAdd(&(out_histo[bin]), 1);
}