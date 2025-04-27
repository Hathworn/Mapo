#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void createLookupKernel(const int* inds, int total, int* output)
{
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Utilize shared memory to reduce global memory accesses
    __shared__ int sharedInds[256]; // Ensure this matches blockDim.x
    
    if (idx < total) {
        sharedInds[threadIdx.x] = inds[idx];
        __syncthreads(); // Ensure all threads have written their inds
        
        output[sharedInds[threadIdx.x]] = idx;
    }
}