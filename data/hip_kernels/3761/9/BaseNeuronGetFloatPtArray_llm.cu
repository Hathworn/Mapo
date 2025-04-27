#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void BaseNeuronGetFloatPtArray(float *arr1, float *arr2, int *pos, int n_elem, int step1, int step2)
{
    int array_idx = blockIdx.x * blockDim.x + threadIdx.x;

    // Check if the current thread index is within bounds
    if (array_idx < n_elem) {
        // Directly calculate target index and assign value to avoid multiple indexing
        int target_idx = array_idx * step2;
        int source_idx = pos[array_idx] * step1;
        arr2[target_idx] = arr1[source_idx];
    }
}