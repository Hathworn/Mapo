#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void Mask_Sum_Kernel(int* A, int valCount, int* scalarOut)
{
    const int localIdx = threadIdx.x;
    const int globalIdx = blockDim.x * blockIdx.x + threadIdx.x;

    for (int stride = blockDim.x / 2; stride > 0; stride /= 2)
    {
        // Synchronize threads to ensure all additions are completed before proceeding
        __syncthreads();
        if (localIdx < stride)
        {
            A[globalIdx] += A[globalIdx + stride];
        }
    }

    // The first thread writes the result of this block to the output
    if (localIdx == 0)
    {
        A[blockIdx.x] = A[globalIdx];
    }
    
    // Synchronize before moving to the final reduction step
    __syncthreads();

    if (globalIdx == 0)
    {
        int sum = 0;
        for (int i = 0; i < gridDim.x; ++i)
        {
            sum += A[i * blockDim.x];
        }
        scalarOut[0] = sum;
    }
}