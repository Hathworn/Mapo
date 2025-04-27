#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void BaseNeuronGetIntArray(int *arr1, int *arr2, int n_elem, int step1, int step2)
{
    // Calculate array index for this thread
    int array_idx = threadIdx.x + blockIdx.x * blockDim.x;
    
    // Ensure array_idx is within bounds
    if (array_idx < n_elem) {
        // Efficiently assign value using calculated index
        arr2[array_idx * step2] = arr1[array_idx * step1];
    }
}