#include "hip/hip_runtime.h"
#include "includes.h"

// Optimize the kernel function using block-level parallel reduction technique
__global__ void kernelAddMullSqr(const int N, double* S, double* A, double m)
{
    // Calculate the global thread index
    int i = blockIdx.x * blockDim.x + threadIdx.x;

    // Use shared memory to minimize global memory access
    __shared__ double sharedMem[256];  // Adjust size based on blockDim.x

    // Perform the computation if within bounds
    if (i < N)
    {
        sharedMem[threadIdx.x] = m * A[i] * A[i];
    }
    else
    {
        sharedMem[threadIdx.x] = 0.0;  // Handle out-of-bounds threads
    }

    // Synchronize threads to ensure shared memory is fully populated
    __syncthreads();

    // Use a loop for block-level parallel reduction
    for (unsigned int s = blockDim.x / 2; s > 0; s >>= 1)
    {
        if (threadIdx.x < s)
        {
            sharedMem[threadIdx.x] += sharedMem[threadIdx.x + s];
        }
        __syncthreads();
    }

    // Update the global memory result
    if (threadIdx.x == 0)
    {
        atomicAdd(&S[blockIdx.x], sharedMem[0]);
    }
}