#include "hip/hip_runtime.h"
#include "includes.h"

// Kernel function optimized for better memory access and reduced computation in loop
__global__ void stretch_kernel(int acc, int samps, float tsamp, float *d_input, float *d_output, float t_zero, float multiplier, float tsamp_inverse) {
    int t = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Precompute common terms to save computation inside the loop
    float multiplier_offset = multiplier * (t - 1.0f);
    float p_time = t * (t_zero + multiplier_offset);
    
    int stretch_index = __float2int_rz(p_time * tsamp_inverse);

    // Ensure the index is within bounds before writing to global memory
    if (stretch_index >= 0 && stretch_index < samps) {
        d_output[stretch_index] = d_input[t];
    }
}