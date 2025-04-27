#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void one_channel_mul_kernel(const float *data_l, const float *data_r, float *result, int channel_total, int total)
{
    // Calculate the global index for the current thread
    int idx = 2 * (blockIdx.x * blockDim.x + threadIdx.x);
    
    // Calculate one channel index
    int one_ch_idx = idx % (2 * channel_total);

    // Check if the current index is within the bounds
    if (idx / 2 < total) {
        // Compute the real and imaginary multiplication
        float real_temp = data_l[idx] * data_r[one_ch_idx] - data_l[idx + 1] * data_r[one_ch_idx + 1];
        float imag_temp = data_l[idx] * data_r[one_ch_idx + 1] + data_l[idx + 1] * data_r[one_ch_idx];
        
        // Store the results
        result[idx] = real_temp;
        result[idx + 1] = imag_temp;
    }
}