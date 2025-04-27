#include "hip/hip_runtime.h"
#include "includes.h"

char* concat(char *s1, char *s2);

__global__ void r_final_sum_and_alpha_calculation(float *r_squared, float *p_sum, int size) {
    int index = threadIdx.x;
    extern __shared__ float shared_mem[]; // Use dynamic shared memory
    float* shared_r_squared = shared_mem;
    float* shared_p_sum = shared_mem + blockDim.x;

    // Load input into shared memory
    float local_r_squared = (index < size) ? r_squared[index] : 0.0f;
    float local_p_sum = (index < size) ? p_sum[index] : 0.0f;

    shared_r_squared[index] = local_r_squared;
    shared_p_sum[index] = local_p_sum;

    __syncthreads();

    // Reduce within block
    for (unsigned int s = blockDim.x / 2; s > 0; s >>= 1) {
        if (index < s) {
            shared_r_squared[index] += shared_r_squared[index + s];
            shared_p_sum[index] += shared_p_sum[index + s];
        }
        __syncthreads();
    }

    // Write block result
    if (index == 0) {
        r_squared[blockIdx.x] = shared_r_squared[0] / shared_p_sum[0];
    }
}