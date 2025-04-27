#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void backward_sam_kernel(float *in_w_h_c_delta, int size, int channel_size, float *in_scales_c, float *out_from_delta, float *in_from_output, float *out_state_delta)
{
    const int index = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Check if index is within bounds
    if (index < size) {
        float delta = in_w_h_c_delta[index];
        float from_output = in_from_output[index];
        float scales = in_scales_c[index];

        // Update delta for state and from output
        out_state_delta[index] += delta * from_output; // l.delta * from  (should be divided by channel_size?)
        out_from_delta[index] += scales * delta; // input * l.delta

        // Remove commented, obsolete operations
    }
}