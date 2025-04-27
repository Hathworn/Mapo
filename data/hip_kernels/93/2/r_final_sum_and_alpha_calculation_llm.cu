#include "hip/hip_runtime.h"
#include "includes.h"

char* concat(char *s1, char *s2);

__global__ void r_final_sum_and_alpha_calculation(float * r_squared ,float * p_sum ,int size)
{
    int index = threadIdx.x;
    
    // Use dynamically allocated shared memory to handle variable sizes
    extern __shared__ float shared_memory[];
    float* shared_r_squared = shared_memory;
    float* shared_p_sum = shared_memory + blockDim.x;
    
    if (index < size) {
        // Load data into shared memory
        shared_r_squared[index] = r_squared[index];
        shared_p_sum[index] = p_sum[index];
    } else {
        shared_r_squared[index] = 0;
        shared_p_sum[index] = 0;
    }
    __syncthreads();
    
    for (unsigned int s = blockDim.x / 2; s > 0; s >>= 1) {
        if (index < s) {
            // Perform reduction in shared memory using warp synchronous operations
            shared_r_squared[index] += shared_r_squared[index + s];
            shared_p_sum[index] += shared_p_sum[index + s];
        }
        __syncthreads();
    }
    
    if (index == 0) {
        // Calculate alpha only once for each block
        r_squared[blockIdx.x] = shared_r_squared[0] / shared_p_sum[0];
    }
}