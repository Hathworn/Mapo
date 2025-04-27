#include "hip/hip_runtime.h"
#include "includes.h"

char* concat(char *s1, char *s2);

__global__ void r_initial_sum(float* a, int* indeces, float* x, float* r, float* r_squared, float* p_sum, int size)
{
    int index = blockDim.x * blockIdx.x + threadIdx.x;
    int local_index = threadIdx.x;

    __shared__ float shared_r_squared[1024];
    __shared__ float shared_p_sum[1024];

    // Initialize shared memory
    float sum_p_val = 0;
    float sum_r_squared_val = 0;
    
    if (index < size)
    {
        // Compute partial sums directly into registers
        for (int i = 0; i < 3; i++)
        {
            sum_p_val += a[3 * index + i] * r[indeces[3 * index + i]];
        }
        sum_r_squared_val = r[index] * r[index];
        sum_p_val = sum_p_val * r[index];
    }
    
    // Store results in shared memory
    shared_r_squared[local_index] = sum_r_squared_val;
    shared_p_sum[local_index] = sum_p_val;
    __syncthreads();

    // Perform reduction in shared memory
    for (unsigned int s = blockDim.x / 2; s > 0; s >>= 1)
    {
        if (local_index < s)
        {
            shared_r_squared[local_index] += shared_r_squared[local_index + s];
            shared_p_sum[local_index] += shared_p_sum[local_index + s];
        }
        __syncthreads();
    }

    // Write result for this block to global memory
    if (threadIdx.x == 0)
    {
        r_squared[blockIdx.x] = shared_r_squared[0];
        p_sum[blockIdx.x] = shared_p_sum[0];
    }
}