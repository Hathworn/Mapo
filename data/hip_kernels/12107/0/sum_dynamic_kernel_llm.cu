#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void sum_dynamic_kernel(const int* pIn, int* pOut, size_t numInts)
{
    extern __shared__ int ps[]; // Declare shared memory

    // Loading shared memory with boundary checks
    const unsigned int tid = threadIdx.x;
    unsigned int idx = tid + blockIdx.x * blockDim.x;
    if (idx < numInts) 
    {
        ps[tid] = pIn[idx];
    }
    else 
    {
        ps[tid] = 0; // Handle out-of-bound threads
    }

    __syncthreads(); // Synchronize to ensure shared memory is fully loaded

    // Reduce within shared memory
    for (unsigned int s = blockDim.x / 2; s > 0; s >>= 1) 
    {
        if (tid < s) 
        {
            ps[tid] += ps[tid + s];
        }
        __syncthreads(); // Synchronize to ensure all threads have updated values
    }

    // Write result for this block to global memory
    if (tid == 0) 
    {
        atomicAdd(pOut, ps[0]); // Use atomic operation to avoid race conditions
    }
}