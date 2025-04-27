#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void gpu_reduce(int *c, int size)
{
    // Get unique global thread ID
    int position = threadIdx.x + blockIdx.x * blockDim.x;

    // Check bounds and reduce in place, handle odd size with additional check
    if (position < size / 2) 
    {
        int partner_idx = position + size / 2;
        if (c[position] < c[partner_idx]) 
        {
            c[position] = c[partner_idx];
        }
    }
    else if (size % 2 != 0 && position == size - 1) 
    {
        if (c[position] > c[size / 2 - 1]) 
        {
            c[size / 2 - 1] = c[position];
        }
    }
}