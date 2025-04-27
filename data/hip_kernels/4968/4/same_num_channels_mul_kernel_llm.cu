#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void same_num_channels_mul_kernel(const float *data_l, const float *data_r, float *result, int total)
{
    int idx = 2 * (blockIdx.x * blockDim.x + threadIdx.x);

    // Use shared memory for improved memory access efficiency
    __shared__ float s_data_l[1024];
    __shared__ float s_data_r[1024];

    if (idx < 2 * total) {
        // Load data into shared memory
        s_data_l[threadIdx.x * 2] = data_l[idx];
        s_data_l[threadIdx.x * 2 + 1] = data_l[idx + 1];
        s_data_r[threadIdx.x * 2] = data_r[idx];
        s_data_r[threadIdx.x * 2 + 1] = data_r[idx + 1];

        __syncthreads(); // Ensure all data is loaded before processing

        // Compute results using shared memory
        result[idx] = s_data_l[threadIdx.x * 2] * s_data_r[threadIdx.x * 2] 
                    - s_data_l[threadIdx.x * 2 + 1] * s_data_r[threadIdx.x * 2 + 1];
        result[idx + 1] = s_data_l[threadIdx.x * 2] * s_data_r[threadIdx.x * 2 + 1]
                        + s_data_l[threadIdx.x * 2 + 1] * s_data_r[threadIdx.x * 2];
    }
}