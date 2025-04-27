#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void gpu_array_init_r4__(size_t tsize, float *arr, float val)
{
    // Calculate global thread index
    size_t _ti = blockIdx.x * blockDim.x + threadIdx.x;
    // Use stride to assign values across entire array
    size_t stride = gridDim.x * blockDim.x;

    for(size_t l = _ti; l < tsize; l += stride) {
        arr[l] = val; // Initialize array with val
    }
}