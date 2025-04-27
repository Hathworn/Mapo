#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void one_channel_mul_kernel(float *data_l, float *data_r, float *result)
{
    // Compute linear thread index for improved performance
    int threadId = 2 * (blockIdx.x * blockDim.x * blockDim.y + threadIdx.y * blockDim.x + threadIdx.x);
    int one_ch_index = 2 * (threadIdx.y * blockDim.x + threadIdx.x);

    // Use shared memory for faster data access
    extern __shared__ float shared_data_r[];
    shared_data_r[one_ch_index] = data_r[one_ch_index];
    shared_data_r[one_ch_index + 1] = data_r[one_ch_index + 1];
    __syncthreads();

    // Perform operations using shared memory
    result[threadId] = data_l[threadId] * shared_data_r[one_ch_index] - data_l[threadId + 1] * shared_data_r[one_ch_index + 1];
    result[threadId + 1] = data_l[threadId] * shared_data_r[one_ch_index + 1] + data_l[threadId + 1] * shared_data_r[one_ch_index];
}