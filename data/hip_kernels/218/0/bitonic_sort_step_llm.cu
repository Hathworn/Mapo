#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void bitonic_sort_step(float *dev_values, int j, int k)
{
    unsigned int i, ixj;
    i = threadIdx.x + blockDim.x * blockIdx.x;
    ixj = i ^ j;

    // Only threads with valid partners proceed
    if (ixj > i)
    {
        float val_i = dev_values[i];
        float val_ixj = dev_values[ixj];

        // Determine direction of sorting and perform it
        bool ascending = ((i & k) == 0);
        if ((ascending && val_i > val_ixj) || (!ascending && val_i < val_ixj))
        {
            // Swap values using a temporary variable
            dev_values[i] = val_ixj;
            dev_values[ixj] = val_i;
        }
    }
}