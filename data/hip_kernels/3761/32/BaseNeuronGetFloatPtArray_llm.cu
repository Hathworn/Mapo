#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void BaseNeuronGetFloatPtArray(float *arr1, float *arr2, int *pos, int n_elem, int step1, int step2)
{
    // Calculate the global index
    int array_idx = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Ensure the thread index does not exceed the number of elements
    if (array_idx < n_elem) {
        // Use the index to update the output array
        arr2[array_idx * step2] = arr1[pos[array_idx] * step1];
    }
}