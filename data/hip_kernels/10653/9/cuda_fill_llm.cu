#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void cuda_fill(double* pVec, double val, int n)
{
    int id = blockIdx.x * blockDim.x + threadIdx.x;
    // Use __syncthreads() to ensure all threads are at the same execution point
    if (id < n)
    {
        pVec[id] = val;  // Correct index to write to the specific element
    }
}