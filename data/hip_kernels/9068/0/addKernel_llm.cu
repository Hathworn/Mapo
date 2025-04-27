#include "hip/hip_runtime.h"
#include "includes.h"

// Improved kernel function
__global__ void addKernel(int *c, const int *a, const int *b)
{
    // Use the block index and thread index for a more scalable approach
    int i = blockIdx.x * blockDim.x + threadIdx.x; // Calculate the global index
    if (i < blockDim.x) { // Check bounds to avoid out-of-bounds access
        c[i] = a[i] + b[i];
        // Removed unnecessary printf for cleaner execution
    }
}