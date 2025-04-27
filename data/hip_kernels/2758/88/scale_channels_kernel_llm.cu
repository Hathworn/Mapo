```c
#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void scale_channels_kernel(float *in_w_h_c, int size, int channel_size, float *scales_c, float *out)
{
    const int index = blockIdx.x * blockDim.x + threadIdx.x;
    if (index < size) {
        // Load values into registers for efficient computation
        float input_val = in_w_h_c[index];
        float scale_val = scales_c[index / channel_size];
        // Perform scaling operation
        out[index] = input_val * scale_val;
    }
}