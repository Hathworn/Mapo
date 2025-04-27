```c
#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void mask_kernel(int n, float *x, float mask_num, float *mask, float val)
{
    // Calculate the global index for the thread
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    // Use stride to allow multiple blocks to cover larger data
    int stride = gridDim.x * blockDim.x;
    
    // Iterate over data with a stride equal to the total number of threads
    for (; i < n; i += stride) {
        // Perform the masking check and assignment
        if (mask[i] == mask_num) {
            x[i] = val;
        }
    }
}