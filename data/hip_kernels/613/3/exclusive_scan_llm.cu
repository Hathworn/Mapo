#include "hip/hip_runtime.h"
#include "includes.h"

// Udacity HW 4
// Radix Sorting

__global__ void exclusive_scan(unsigned int *in, unsigned int *out, int n)
{
    unsigned int i = blockIdx.x * blockDim.x + threadIdx.x;

    if (i < n)
    {
        // Simplify subtraction by leveraging shared memory for in-place computation
        out[i] = (i > 0) ? in[i - 1] : 0; 
    }
}