#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void BaseNeuronSetFloatPtArray(float *arr, int *pos, int n_elem, int step, float val)
{
    // Cache thread and block indices
    int tid = threadIdx.x;
    int bid = blockIdx.x;

    // Calculate array index more efficiently
    int array_idx = tid + bid * blockDim.x;

    // Ensure we process elements within the range
    if (array_idx < n_elem) {
        // Directly update the element in arr using position and step offset
        arr[pos[array_idx] * step] = val;
    }
}