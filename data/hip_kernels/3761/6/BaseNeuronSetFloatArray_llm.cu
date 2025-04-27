#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void BaseNeuronSetFloatArray(float *arr, int n_elem, int step, float val)
{
    // Compute array index using unique thread index
    int array_idx = blockDim.x * blockIdx.x + threadIdx.x;

    // Check if index is within bounds and update only valid elements
    if (array_idx < n_elem) {
        arr[array_idx * step] = val;
    }
}