#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void serialsum(const int n, const double *x, double *y)
{
    // Using shared memory to improve access speed
    __shared__ double cache[256];

    int tid = threadIdx.x;
    double temp_sum = 0.0;

    // Accumulate partial sums
    for (int i = tid; i < n; i += blockDim.x)
    {
        temp_sum += x[i];
    }

    // Store the partial result in shared memory
    cache[tid] = temp_sum;
    __syncthreads();

    // Use binary reduction to sum up partial results
    for (int stride = blockDim.x / 2; stride > 0; stride /= 2)
    {
        if (tid < stride)
        {
            cache[tid] += cache[tid + stride];
        }
        __syncthreads();
    }

    // Write the result from the first thread of the block
    if (tid == 0)
    {
        atomicAdd(y, cache[0]);
    }
}