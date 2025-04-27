#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void BaseNeuronSetIntPtArray(int *arr, int *pos, int n_elem, int step, int val)
{
    // Calculate the array index with cache of blockDim.x for repeated use
    int globalIdx = blockDim.x * blockIdx.x + threadIdx.x;
    
    // Perform the operation only if global index is within bounds
    if (globalIdx < n_elem) {
        arr[pos[globalIdx] * step] = val;
    }
}