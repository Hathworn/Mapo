#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void gpu_array_init_r8__(size_t tsize, double *arr, double val)
{
    // Compute global thread index
    size_t idx = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Ensure idx is within array bounds
    if (idx < tsize) {
        arr[idx] = val;
    }
    return;
}