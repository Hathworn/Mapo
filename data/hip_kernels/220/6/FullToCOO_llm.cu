#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void FullToCOO(int numElem, float* H_vals, double* hamilValues, int dim)
{
    // Use shared memory to reduce global memory access for improved efficiency
    extern __shared__ float sharedH_vals[];

    int i = threadIdx.x + blockDim.x * blockIdx.x;

    if (i < numElem)
    {
        // Load data into shared memory for coalesced access
        sharedH_vals[threadIdx.x] = H_vals[i];
        __syncthreads();

        // Copy data from shared memory to hamilValues
        hamilValues[i] = sharedH_vals[threadIdx.x];
    }
}