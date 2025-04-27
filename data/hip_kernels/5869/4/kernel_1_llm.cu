#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void kernel_1(float *d_data_in, float *d_data_out, int data_size)
{
    __shared__ float s_data[BLKSIZE];
    int tid = threadIdx.x;
    int index = tid + blockIdx.x * blockDim.x;
    
    // Initialize shared memory only if within bounds
    s_data[tid] = (index < data_size) ? d_data_in[index] : 0.0f;
    __syncthreads();

    // Optimized parallel reduction
    for (int s = blockDim.x / 2; s > 0; s >>= 1) {
        if (tid < s) {
            s_data[tid] += s_data[tid + s];
        }
        __syncthreads();
    }

    // Write the result from the first thread
    if (tid == 0) {
        d_data_out[blockIdx.x] = s_data[0];
    }
}