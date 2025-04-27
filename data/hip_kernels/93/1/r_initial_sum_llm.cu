#include "hip/hip_runtime.h"
#include "includes.h"

char* concat(char *s1, char *s2);

__global__ void r_initial_sum(float* a, int* indeces, float* x, float* r, float* r_squared, float* p_sum, int size)
{
    int index = blockDim.x * blockIdx.x + threadIdx.x;
    int local_index = threadIdx.x;

    // Use dynamic shared memory to avoid hardcoded size
    extern __shared__ float shared_memory[];

    float* shared_r_squared = shared_memory;
    float* shared_p_sum = shared_memory + blockDim.x;

    shared_r_squared[local_index] = 0;
    shared_p_sum[local_index] = 0;
    __syncthreads();

    if (index < size)
    {
        // Unrolling loop for performance optimization
        #pragma unroll
        for (int i = 0; i < 3; i++)
        {
            shared_p_sum[local_index] += a[3 * index + i] * r[indeces[3 * index + i]];
        }

        shared_r_squared[local_index] = r[index] * r[index];
        shared_p_sum[local_index] *= r[index];
    }
    __syncthreads();

    // Optimize reduction using warp and shared memory
    for (unsigned int s = blockDim.x / 2; s > 0; s >>= 1)
    {
        if (local_index < s)
        {
            shared_r_squared[local_index] += shared_r_squared[local_index + s];
            shared_p_sum[local_index] += shared_p_sum[local_index + s];
        }
        // Separate __syncthreads outside if condition in the loop
        __syncthreads();
    }

    if (local_index == 0)
    {
        r_squared[blockIdx.x] = shared_r_squared[0];
        p_sum[blockIdx.x] = shared_p_sum[0];
    }
}