#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void scale_channels_kernel(float *in_w_h_c, int size, int channel_size, int batch_size, int scale_wh, float *scales_c, float *out)
{
    // Calculate global thread index
    const int index = blockIdx.x * blockDim.x + threadIdx.x;

    // Check if the thread should proceed with computations
    if (index < size) {
        // Precompute index components to avoid recalculating
        int index_div_batch_size = index / batch_size;
        int index_div_channel_size = index / channel_size;

        if (scale_wh) {
            // Optimized index computation for wh scaling
            int osd_index = index % channel_size + index_div_batch_size * channel_size;
            out[index] = in_w_h_c[index] * scales_c[osd_index];
        } else {
            // Use precomputed division result for channel scaling
            out[index] = in_w_h_c[index] * scales_c[index_div_channel_size];
        }
    }
}