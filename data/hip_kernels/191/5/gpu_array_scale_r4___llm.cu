#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void gpu_array_scale_r4__(size_t tsize, float *arr, float val)
{
    // Calculate the global thread index
    size_t idx = blockIdx.x * blockDim.x + threadIdx.x;

    // Process elements in stride of the total number of threads
    if (idx < tsize) {
        arr[idx] *= val;
    }
    
    // Stride loop to cover all elements
    size_t gridStride = gridDim.x * blockDim.x;
    for (size_t i = idx + gridStride; i < tsize; i += gridStride) {
        arr[i] *= val;
    }
    return;
}