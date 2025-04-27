#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void BaseNeuronSetIntArray(int *arr, int n_elem, int step, int val)
{
    // Calculate the global thread index
    int array_idx = blockIdx.x * blockDim.x + threadIdx.x;

    // Ensure array index is within bounds
    if (array_idx < n_elem) {
        arr[array_idx * step] = val;
    }
}