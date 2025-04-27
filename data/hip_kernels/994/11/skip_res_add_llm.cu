#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void skip_res_add(size_t sz, float_t* f5, float* f1, float_t* skip_out_sum, size_t stride)
{
    size_t index = blockDim.x * blockIdx.x + threadIdx.x;

    // Use shared memory for faster data access
    extern __shared__ float_t shared_mem[];

    if(index < sz)
    {
        // Load data from global to shared memory
        shared_mem[threadIdx.x] = f5[index + stride];
        
        // Sync threads to ensure all data is loaded
        __syncthreads();

        skip_out_sum[index] += shared_mem[threadIdx.x];
        f1[index] += f5[index];
    }
}