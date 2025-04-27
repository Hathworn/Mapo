#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void swap(unsigned int *in, unsigned int *in_pos, unsigned int *out, unsigned int *out_pos, unsigned int n)
{
    unsigned int i = blockIdx.x * blockDim.x + threadIdx.x;

    // Use shared memory to reduce global memory accesses
    extern __shared__ unsigned int shared_mem[];
    
    if (i < n)
    {
        // Load inputs into shared memory
        shared_mem[threadIdx.x] = in[i];
        shared_mem[threadIdx.x + blockDim.x] = out[i];

        shared_mem[threadIdx.x + 2 * blockDim.x] = in_pos[i];
        shared_mem[threadIdx.x + 3 * blockDim.x] = out_pos[i];
        
        __syncthreads();

        // Perform swap using shared memory
        unsigned int temp_in = shared_mem[threadIdx.x] ^ shared_mem[threadIdx.x + blockDim.x];
        shared_mem[threadIdx.x] = temp_in ^ shared_mem[threadIdx.x];
        shared_mem[threadIdx.x + blockDim.x] = temp_in;

        unsigned int temp_in_pos = shared_mem[threadIdx.x + 2 * blockDim.x] ^ shared_mem[threadIdx.x + 3 * blockDim.x];
        shared_mem[threadIdx.x + 2 * blockDim.x] = temp_in_pos ^ shared_mem[threadIdx.x + 2 * blockDim.x];
        shared_mem[threadIdx.x + 3 * blockDim.x] = temp_in_pos;

        __syncthreads();

        // Save outputs back to global memory
        in[i] = shared_mem[threadIdx.x];
        out[i] = shared_mem[threadIdx.x + blockDim.x];

        in_pos[i] = shared_mem[threadIdx.x + 2 * blockDim.x];
        out_pos[i] = shared_mem[threadIdx.x + 3 * blockDim.x];
    }
}