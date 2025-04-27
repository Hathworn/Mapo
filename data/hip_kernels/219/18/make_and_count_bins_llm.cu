```c
#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void make_and_count_bins(float *vec, int *bin, int *bin_counters, const int num_bins, const int n, const float slope, const float intercept)
{
    unsigned int xIndex = blockDim.x * blockIdx.x + threadIdx.x;
    
    // Ensure the index is within bounds before proceeding
    if (xIndex < n) {
        float temp = abs(vec[xIndex]);
        int binIndex;

        // Use conditional operator for concise assignment
        if (temp > (intercept * 0.01)) {
            binIndex = max(0, __float2int_rd(slope * (intercept - temp))); // Use faster intrinsic rounding
            atomicAdd(bin_counters + binIndex, 1);
        } else {
            binIndex = __float2int_rd(slope * intercept) + 1; // Use faster intrinsic rounding
        }

        bin[xIndex] = binIndex;  // Assign binIndex to the bin array
    }
}
```
