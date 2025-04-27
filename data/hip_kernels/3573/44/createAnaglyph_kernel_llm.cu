#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void createAnaglyph_kernel(uchar4 *out_image, const float *left_image, const float *right_image, int width, int height, int pre_shift) {
    // Calculate x and y using more efficient grid calculations
    const int x = blockIdx.x * blockDim.x + threadIdx.x;
    const int y = blockIdx.y * blockDim.y + threadIdx.y;
    int x_right = x - pre_shift;
    uchar4 temp;

    if (x < width && y < height) {
        int idx = y * width + x; // Calculate index once
        temp.x = left_image[idx]; // Load left image pixel

        // Check bounds of shifted x_right
        if (x_right > 0 && x_right < width) {
            temp.y = right_image[y * width + x_right]; // Load right image pixel
            temp.z = temp.y; // Copy to temp.z
        } else {
            temp.y = 0;
            temp.z = 0;
        }

        temp.w = 255; // Set alpha channel
        out_image[idx] = temp; // Store result
    }
}