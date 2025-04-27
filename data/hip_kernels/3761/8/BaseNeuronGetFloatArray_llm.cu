#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void BaseNeuronGetFloatArray(float *arr1, float *arr2, int n_elem, int step1, int step2)
{
    int array_idx = blockIdx.x * blockDim.x + threadIdx.x;
    // Unroll the loop to process multiple elements to improve performance
    int stride = blockDim.x * gridDim.x;
    for (int i = array_idx; i < n_elem; i += stride) {
        arr2[i * step2] = arr1[i * step1];
    }
}