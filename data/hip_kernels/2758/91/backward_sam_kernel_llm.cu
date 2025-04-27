#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void backward_sam_kernel(float *in_w_h_c_delta, int size, int channel_size, float *in_scales_c, float *out_from_delta, float *in_from_output, float *out_state_delta)
{
    const int index = blockIdx.x * blockDim.x + threadIdx.x;
    if (index < size) {
        // Use local variables to avoid repetitive global memory access
        float delta = in_w_h_c_delta[index];
        float from_output = in_from_output[index];
        float scale = in_scales_c[index];

        // Perform the operations with minimized global reads
        out_state_delta[index] += delta * from_output;
        out_from_delta[index] += scale * delta;
    }
}