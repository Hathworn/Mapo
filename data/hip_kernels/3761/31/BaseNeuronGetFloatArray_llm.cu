#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void BaseNeuronGetFloatArray(float *arr1, float *arr2, int n_elem, int step1, int step2)
{
    int array_idx = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Process multiple elements per thread to improve memory coalescing and reduce kernel launch overhead
    int stride = blockDim.x * gridDim.x;
    for (int idx = array_idx; idx < n_elem; idx += stride) {
        arr2[idx * step2] = arr1[idx * step1];
    }
}