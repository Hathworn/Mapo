#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void BaseNeuronSetFloatArray(float *arr, int n_elem, int step, float val)
{
    // Pre-compute values used multiple times to optimize performance
    int array_idx = blockIdx.x * blockDim.x + threadIdx.x;
    int offset = array_idx * step;

    // Check within bounds and set the array value
    if (array_idx < n_elem) {
        arr[offset] = val;
    }
}