#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void inverse_transform(float *in, float *out, int height, int width) {
    // Compute global thread index
    int my_x = blockIdx.x * blockDim.x + threadIdx.x;

    // Check to ensure thread is within bounds
    if (my_x < width) {
        // Iterate through each element, going from frequency to time domain
        for (int k = 0; k < height; k++) {
            float realSum = 0.0f;
            // Iterate through the input element
            for (int t = 0; t < width; t++) {
                float angle = 2.0f * M_PI * (my_x * height + t) * (my_x * height + k) / height;
                realSum += in[my_x * height + t] * cosf(angle);
            }
            // Store the result
            out[my_x * height + k] = realSum / height;
        }
    }
}