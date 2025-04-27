#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void fourier_transform(float *in, float *out, int height, int width, int blockConfig) {
    // Calculate the global index
    int my_x = blockIdx.x * blockDim.x + threadIdx.x;

    // Loop through each element from frequency to time domain
    for (int k = 0; k < height; k++) {
        // Initialize real part sum
        float realSum = 0.0;

        // Iterate through the input elements
        for (int t = 0; t < width; t++) {
            // Calculate the angle and update the real sum
            float angle = 2 * M_PI * (my_x * height + t) * (my_x * width + k) / height;
            realSum += in[my_x * height + t] * cosf(angle);  // Use cosf for single precision
        }

        // Store the result in the output array
        out[my_x * height + k] = realSum;
    }
}