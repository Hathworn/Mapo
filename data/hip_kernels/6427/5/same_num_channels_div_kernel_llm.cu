#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void same_num_channels_div_kernel(const float *data_l, const float *data_r, float *result, unsigned total)
{
    // Calculate index accounting for each thread handling two data points
    unsigned idx = blockIdx.x * blockDim.x + threadIdx.x;

    if (idx < total) {
        // Improved indexing by eliminating repetitive multiplication
        unsigned dataIdx = 2 * idx;

        // Common denominator calculation optimization
        float denom = (data_r[dataIdx] * data_r[dataIdx] + data_r[dataIdx + 1] * data_r[dataIdx + 1]);

        // Ensure denominator is not zero
        if (denom != 0.0f) {
            result[dataIdx] = (data_l[dataIdx] * data_r[dataIdx] + data_l[dataIdx + 1] * data_r[dataIdx + 1]) / denom;
            result[dataIdx + 1] = (data_l[dataIdx + 1] * data_r[dataIdx] - data_l[dataIdx] * data_r[dataIdx + 1]) / denom;
        } else {
            result[dataIdx] = 0.0f;
            result[dataIdx + 1] = 0.0f;
        }
    }
}