#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void kernel_5(float *d_data_in, float *d_data_out, int data_size)
{
    __shared__ float s_data[BLKSIZE]; // Use shared memory without 'volatile'
    int tid = threadIdx.x;
    int index = tid + blockIdx.x * blockDim.x * 2;

    float temp_sum = 0.0f; // Use a local variable to store temporary sum

    if (index < data_size){
        temp_sum = d_data_in[index];
    }
    if ((index + blockDim.x) < data_size){
        temp_sum += d_data_in[index + blockDim.x];
    }
    s_data[tid] = temp_sum; // Store it once to shared memory
    __syncthreads();

    for (int s = blockDim.x / 2; s >= 64; s >>= 1){
        if (tid < s) {
            s_data[tid] += s_data[tid + s];
        }
        __syncthreads();
    }

    // Use warp shuffle operations to optimize reduction within a warp
    if (tid < 32){
        for (int s = 32; s > 0; s >>= 1) {
            s_data[tid] += __shfl_down(s_data[tid], s, 32);
        }
    }

    if (tid == 0){
        d_data_out[blockIdx.x] = s_data[tid];
    }
}