#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void redunction_neighbored_pairs_1(int * input, int * temp, int size)
{
    int tid = threadIdx.x;
    int gid = blockDim.x * blockIdx.x + threadIdx.x;

    // Return immediately if gid is out of bounds
    if (gid >= size)
        return;

    // Using more efficient loop to reduce
    for (int offset = blockDim.x / 2; offset > 0; offset >>= 1)
    {
        if (tid < offset)
        {
            input[gid] += input[gid + offset];
        }

        __syncthreads(); // Ensure all threads have completed addition
    }

    // Write block result to temp only if tid is 0
    if (tid == 0)
    {
        temp[blockIdx.x] = input[gid];
    }
}