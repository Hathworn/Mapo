#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void BaseNeuronSetIntPtArray(int *arr, int *pos, int n_elem, int step, int val)
{
    // Compute the array index using built-in variables
    int array_idx = blockIdx.x * blockDim.x + threadIdx.x;

    // Ensure that the thread is working within bounds
    if (array_idx < n_elem) {
        // Efficiently update the array value
        arr[pos[array_idx] * step] = val;
    }
}