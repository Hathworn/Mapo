#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void atomic_reduction_kernel(float *data_out, float *data_in, int size)
{
    // Calculate global index and check boundary
    int idx_x = blockIdx.x * blockDim.x + threadIdx.x;
    if (idx_x < size) {
        atomicAdd(&data_out[0], data_in[idx_x]);
    }
}