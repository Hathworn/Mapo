#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void global_reduction_kernel(float *data_out, float *data_in, int stride, int size)
{
    int idx_x = blockIdx.x * blockDim.x + threadIdx.x;

    // Use shared memory to minimize global memory access
    extern __shared__ float sdata[];
    
    if (idx_x < size) {
        sdata[threadIdx.x] = data_in[idx_x];
    } else {
        sdata[threadIdx.x] = 0.0f;
    }

    __syncthreads();

    if (idx_x + stride < size) {
        data_out[idx_x] = sdata[threadIdx.x] + sdata[threadIdx.x + stride];
    }
}