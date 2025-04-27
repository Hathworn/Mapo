#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kernel_add_regularization_term(double* d_input_vector, int dimension, double regularization_parameter, double* d_rv)
{
    // Use shared memory for intermediate sum calculation
    extern __shared__ double shared_sum[];
    int idx = threadIdx.x;

    shared_sum[idx] = 0;
    
    // Calculate partial sum for each thread
    for (int i = idx + 1; i < dimension; i += blockDim.x) {
        shared_sum[idx] += 0.5 * d_input_vector[i] * d_input_vector[i] * regularization_parameter;
    }
    
    __syncthreads();
    
    // Use reduction to sum up partial results
    for (int stride = blockDim.x / 2; stride > 0; stride /= 2) {
        if (idx < stride) {
            shared_sum[idx] += shared_sum[idx + stride];
        }
        __syncthreads();
    }
    
    // One thread writes the result to global memory
    if (idx == 0) {
        atomicAdd(d_rv, shared_sum[0]);
    }
}