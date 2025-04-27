#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void kernel_4(float *d_data_in, float *d_data_out, int data_size)
{
    extern __shared__ float s_data[]; // Use dynamic shared memory
    int tid = threadIdx.x;
    int index = tid + blockIdx.x * blockDim.x;

    s_data[tid] = (index < data_size) ? d_data_in[index] : 0.0f; // Direct initialization
    __syncthreads();

    for (int s = blockDim.x / 2; s > 32; s >>= 1) { // Optimize loop for power of two
        if (tid < s) {
            s_data[tid] += s_data[tid + s];
        }
        __syncthreads();
    }

    // Unroll the last warp
    if (tid < 32) {
        volatile float *v_s_data = s_data; // Employ volatile for warp-level operations
        v_s_data[tid] += v_s_data[tid + 32];
        v_s_data[tid] += v_s_data[tid + 16];
        v_s_data[tid] += v_s_data[tid + 8];
        v_s_data[tid] += v_s_data[tid + 4];
        v_s_data[tid] += v_s_data[tid + 2];
        v_s_data[tid] += v_s_data[tid + 1];
    }

    if (tid == 0) {
        d_data_out[blockIdx.x] = s_data[0]; // Store the result
    }
}