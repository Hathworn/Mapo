#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void mult_add_into_kernel(int n, float *a, float *b, float *c)
{
    // Use 1D block and grid to simplify indexing and improve coalesced access
    int i = blockIdx.x * blockDim.x + threadIdx.x;

    // Ensure index is within bounds for memory access safety
    if(i < n){
        // Perform multiplication and addition directly
        c[i] += a[i] * b[i];
    }
}