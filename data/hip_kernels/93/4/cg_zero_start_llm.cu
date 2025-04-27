#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void cg_zero_start(float* a, float* x, float* b, int size)
{
    int index = blockDim.x * blockIdx.x + threadIdx.x;
    int local_index = threadIdx.x;

    __shared__ float shared_r_squared[1024];
    __shared__ float shared_p_sum[1024];
    float local_b;

    // Initialize shared memory
    shared_r_squared[local_index] = 0;
    shared_p_sum[local_index] = 0;
    
    __syncthreads();

    if (index < size)
    {
        local_b = b[index + 2 * blockIdx.x + 1]; // Reduce usage of blockIdx.x

        // Compute shared_p_sum
        for (int i = 0; i < 3; i++)
        {
            shared_p_sum[local_index] += a[3 * index + i] * b[index + 2 * blockIdx.x + i];
        }

        __syncthreads();

        shared_r_squared[local_index] = local_b * local_b;
        shared_p_sum[local_index] *= local_b;

        __syncthreads();

        // Reduce using a single thread synchronization
        for (unsigned int s = blockDim.x / 2; s > 0; s >>= 1)
        {
            if (local_index < s)
            {
                shared_r_squared[local_index] += shared_r_squared[local_index + s];
                shared_p_sum[local_index] += shared_p_sum[local_index + s];
            }
            __syncthreads();
        }

        // Compute alpha and update x using first thread of the block
        if (local_index == 0)
        {
            float alpha = shared_r_squared[0] / shared_p_sum[0];
            // Use atomic operation to avoid race condition
            atomicAdd(&x[index], alpha * local_b);
        }
    }
}