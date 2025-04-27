#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void GPU_simple_power_and_interbin_kernel(float2 *d_input_complex, float *d_output_power, float *d_output_interbinning, int nTimesamples, float norm){
    int pos_x = blockIdx.x * blockDim.x + threadIdx.x;
    int pos_y = blockIdx.y * ((nTimesamples >> 1) + 1);

    // Initialize A and B to avoid using uninitialized data
    float2 A = {0.0f, 0.0f};
    float2 B = {0.0f, 0.0f};

    if ((pos_x < (nTimesamples >> 1)) && (pos_x > 0)) {
        A = d_input_complex[pos_y + pos_x];
        B = d_input_complex[pos_y + pos_x + 1];

        // Use reciprocal multiplication for normalization for performance
        float inv_norm = 1.0f / norm;
        A.x *= inv_norm;
        A.y *= inv_norm;
        B.x *= inv_norm;
        B.y *= inv_norm;
    }

    if (pos_x < (nTimesamples >> 1)) {
        // Calculate power directly without storing intermediate values
        float power = A.x * A.x + A.y * A.y;
        d_output_power[blockIdx.y * (nTimesamples >> 1) + pos_x] = power;
        d_output_interbinning[blockIdx.y * nTimesamples + 2 * pos_x] = power;
        d_output_interbinning[blockIdx.y * nTimesamples + 2 * pos_x + 1] = 0.616850275f * ((A.x - B.x) * (A.x - B.x) + (A.y - B.y) * (A.y - B.y));
    }
}