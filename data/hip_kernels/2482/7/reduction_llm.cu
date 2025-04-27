#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void reduction(float *g_data, int n)
{
    __shared__ float s_data[NUM_ELEMENTS];

    int tid = threadIdx.x;
    int myIndex = threadIdx.x + blockIdx.x * blockDim.x;

    // Initialize shared memory with data from global memory
    s_data[tid] = (myIndex < n) ? g_data[myIndex] : 0.0f;

    __syncthreads();

    // Perform reduction using shared memory
    for (int s = blockDim.x / 2; s > 0; s >>= 1)
    {
        if (tid < s)
        {
            s_data[tid] += s_data[tid + s];
        }
        __syncthreads();
    }

    // Write the result to global memory
    if (tid == 0)
    {
        g_data[blockIdx.x] = s_data[0];
    }
}