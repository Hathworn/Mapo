#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void swap(unsigned int *in, unsigned int *in_pos, unsigned int *out, unsigned int *out_pos, unsigned int n)
{
    unsigned int i = blockIdx.x * blockDim.x + threadIdx.x;

    if (i < n)
    {
        // Use shared memory for faster access
        __shared__ unsigned int temp_storage1[1024];
        __shared__ unsigned int temp_storage2[1024];

        temp_storage1[threadIdx.x] = in[i];
        temp_storage2[threadIdx.x] = in_pos[i];

        __syncthreads();  // Ensure all threads have written to shared memory

        in[i] = out[i];
        in_pos[i] = out_pos[i];

        __syncthreads();  // Ensure before fetching from shared memory

        out[i] = temp_storage1[threadIdx.x];
        out_pos[i] = temp_storage2[threadIdx.x];
    }
}