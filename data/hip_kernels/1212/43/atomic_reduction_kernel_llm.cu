#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void atomic_reduction_kernel(float *data_out, float *data_in, int size)
{
    int idx_x = blockIdx.x * blockDim.x + threadIdx.x;

    // Ensure that we do not access out of bounds memory
    if (idx_x < size)
    {
        atomicAdd(&data_out[0], data_in[idx_x]);
    }
}