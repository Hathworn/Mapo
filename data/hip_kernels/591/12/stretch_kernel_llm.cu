#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void stretch_kernel(int acc, int samps, float tsamp, float *d_input, float *d_output, float t_zero, float multiplier, float tsamp_inverse) {
    int t = blockIdx.x * blockDim.x + threadIdx.x; // Calculate global thread index

    // Optimize the calculation of p_time and ensure p_time uses only necessary arithmetic
    float p_time = t_zero + multiplier * (t - 1.0f) * t;
    
    int stretch_index = __float2int_rz(p_time * tsamp_inverse); // Efficient conversion of p_time to int

    // Optimize the range check and assignment
    if (stretch_index >= 0 && stretch_index < samps) {
        d_output[stretch_index] = d_input[t];
    }
}