#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void gradient_array_normalize_channels_softmax_kernel(float *x, int size, int batch, int channels, int wh_step, float *delta_gpu)
{
    int i = blockIdx.x * blockDim.x + threadIdx.x;

    // Compute spatial index within the batch
    int wh_i = i % wh_step;
    int b = i / wh_step;

    if (i < size) {
        for (int k = 0; k < channels; ++k) {
            // Compute index for this channel
            const int index = wh_i + k * wh_step + b * wh_step * channels;
            float delta = delta_gpu[index];

            // Compute gradient using softmax derivative
            float grad = x[index] * (1.0f - x[index]);
            delta = delta * grad;

            // Handle numerical issues
            if (isnan(delta) || isinf(delta)) delta = 0;
            delta_gpu[index] = delta;
        }
    }
}