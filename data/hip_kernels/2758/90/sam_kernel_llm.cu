```c
#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void sam_kernel(float *in_w_h_c, int size, int channel_size, float *scales_c, float *out)
{
    // Calculate global index
    const int index = blockIdx.x * blockDim.x + threadIdx.x;
    const int stride = blockDim.x * gridDim.x; // Calculate stride for loop

    // Loop with stride to cover all elements
    for (int i = index; i < size; i += stride) {
        out[i] = in_w_h_c[i] * scales_c[i];
    }
}