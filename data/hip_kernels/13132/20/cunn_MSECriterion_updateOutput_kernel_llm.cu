#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void cunn_MSECriterion_updateOutput_kernel(float* output, float *input, float *target, int nframe, int dim, int sizeAverage)
{
    __shared__ float buffer[MSECRITERION_THREADS];
    int k = blockIdx.x;
    float *input_k = input + k*dim;
    float *target_k = target + k*dim;

    int i_start = threadIdx.x;
    int i_end = dim;
    int i_step = blockDim.x;

    // Initialize buffer to ensure all threads start with zero
    float sum_local = 0.0f;

    // Accumulate mse for each thread over its assigned indices
    for (int i=i_start; i<i_end; i+=i_step)
    {
        float z = input_k[i] - target_k[i];
        sum_local += z*z;
    }
    buffer[threadIdx.x] = sum_local;

    // Synchronize threads to ensure all calculations are complete
    __syncthreads();

    // Perform parallel reduction to compute the final output
    if (threadIdx.x == 0)
    {
        float sum_total = 0.0f;
        for (int i=0; i<blockDim.x; i++)
        {
            sum_total += buffer[i];
        }
        if (sizeAverage)
            sum_total /= dim;
        *output = sum_total;
    }
}