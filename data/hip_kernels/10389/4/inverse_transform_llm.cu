#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void inverse_transform(float *in, float *out, int height, int width) {
    // Calculate global index and ensure it is within bounds
    int my_x = blockIdx.x * blockDim.x + threadIdx.x;
    if (my_x >= width) return;

    // Iterate through each element, transforming from frequency to time domain
    for (int k = 0; k < height; k++) {
        float realSum = 0.0f;

        #pragma unroll // Unroll the loop for better performance
        for (int t = 0; t < width; t++) {
            float angle = 2 * M_PI * (my_x * height + t) * (my_x * height + k) / height;
            realSum += in[my_x * height + t] * cos(angle);
        }
        out[my_x * height + k] = realSum / height; // Normalize by height
    }
}