#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void gpu_array_scale_r8__(size_t tsize, double *arr, double val)
{
    // Calculate global thread ID
    size_t idx = blockIdx.x * blockDim.x + threadIdx.x;

    // Unroll the loop by process multiple elements per thread
    size_t stride = gridDim.x * blockDim.x;
    for (size_t i = idx; i < tsize; i += stride) {
        arr[i] *= val;
    }
}