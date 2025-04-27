#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void createLookupKernel(const int* inds, int total, int* output)
{
    int idx = blockDim.x * blockIdx.x + threadIdx.x;

    // Optimize condition check to avoid divergency
    if (idx < total) {
        int ind_value = inds[idx]; // Reduce memory access by reusing loaded value
        output[ind_value] = idx;
    }
}