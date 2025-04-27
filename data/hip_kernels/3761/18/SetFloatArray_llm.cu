#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void SetFloatArray(float *arr, int n_elem, int step, float val)
{
    // Calculate unique global thread index
    int array_idx = blockIdx.x * blockDim.x + threadIdx.x;
    // Use stride to cover all elements in large arrays
    for (int i = array_idx; i < n_elem; i += gridDim.x * blockDim.x) {
        arr[i * step] = val;
    }
}