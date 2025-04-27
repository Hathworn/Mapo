#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void cuda_fill(double* pVec, double val, int n)
{
    int id = blockIdx.x * blockDim.x + threadIdx.x;
    // Each thread writes to its own index, correcting the assignment
    if (id < n)
        pVec[id] = val;
}