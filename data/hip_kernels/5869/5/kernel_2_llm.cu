#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kernel_2(float *d_data_in, float *d_data_out, int data_size)
{
    __shared__ float s_data[BLKSIZE];
    int tid = threadIdx.x;
    int index = tid + blockIdx.x * blockDim.x;
    
    // Load input data into shared memory
    s_data[tid] = (index < data_size) ? d_data_in[index] : 0.0;
    __syncthreads();

    // Perform reduction in shared memory
    for (int s = blockDim.x / 2; s > 0; s >>= 1) {
        if (tid < s) {
            s_data[tid] += s_data[tid + s];
        }
        __syncthreads();
    }

    // Write the result for this block to output
    if (tid == 0) {
        d_data_out[blockIdx.x] = s_data[0];
    }
}