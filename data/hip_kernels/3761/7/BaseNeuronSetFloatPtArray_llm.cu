#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void BaseNeuronSetFloatPtArray(float *arr, int *pos, int n_elem, int step, float val)
{
    // Use variable to avoid repeated calculations
    const int array_idx = blockIdx.x * blockDim.x + threadIdx.x;

    // Ensure valid index before accessing memory
    if (array_idx < n_elem) {
        // Write value directly to calculated position
        arr[pos[array_idx] * step] = val;
    }
}