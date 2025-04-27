#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void gradient_array_normalize_channels_kernel(float *x, int size, int batch, int channels, int wh_step, float *delta_gpu)
{
    int i = blockIdx.x * blockDim.x + threadIdx.x;

    int wh_i = i % wh_step;
    int b = i / wh_step;

    if (i < size) {
        // Optimized loop by avoiding extra computation within loop
        for (int k = 0; k < channels; ++k) {
            const int index = wh_i + k * wh_step + b * wh_step * channels;
            float grad = x[index];
            if (grad > 0) { // Check condition outside delta computation
                float delta = delta_gpu[index];
                delta_gpu[index] = delta * grad; // Direct multiplications to reduce operations
            }
        }
    }
}