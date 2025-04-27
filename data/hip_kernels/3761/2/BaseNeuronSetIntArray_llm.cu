#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void BaseNeuronSetIntArray(int *arr, int n_elem, int step, int val)
{
    int array_idx = blockIdx.x * blockDim.x + threadIdx.x; // Calculate global index

    if (array_idx < n_elem) { // Check if within bounds
        arr[array_idx * step] = val; // Set value with stride
    }
}