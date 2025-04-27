#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kernel_add_regularization_term(double *d_input_vector, int dimension, double regularization_parameter, double *d_rv)
{
    // Calculate global thread index
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Initialize shared memory for partial sum
    extern __shared__ double shared_sum[];

    // Each thread computes partial sum
    if (idx < dimension) {
        shared_sum[threadIdx.x] = 0.5 * d_input_vector[idx] * d_input_vector[idx] * regularization_parameter;
    } else {
        shared_sum[threadIdx.x] = 0.0;
    }
    __syncthreads();

    // Perform reduction in shared memory
    for (unsigned int stride = blockDim.x / 2; stride > 0; stride >>= 1) {
        if (threadIdx.x < stride) {
            shared_sum[threadIdx.x] += shared_sum[threadIdx.x + stride];
        }
        __syncthreads();
    }

    // Add the result from each block to global sum
    if (threadIdx.x == 0) {
        atomicAdd(d_rv, shared_sum[0]);
    }
}