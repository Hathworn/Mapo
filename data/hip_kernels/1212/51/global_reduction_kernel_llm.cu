#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void global_reduction_kernel(float *data_out, float *data_in, int stride, int size)
{
    // Calculate global index and check bounds
    int idx_x = blockIdx.x * blockDim.x + threadIdx.x;
    int idx_stride = idx_x + stride;
    
    if (idx_stride < size) {
        // Use shared memory for faster access
        extern __shared__ float s_data[];
        s_data[threadIdx.x] = data_in[idx_x];
        __syncthreads();

        // Perform the reduction
        data_out[idx_x] += s_data[threadIdx.x + stride];

        // Synchronize threads before next stride (if necessary for correctness)
        __syncthreads();
    }
}