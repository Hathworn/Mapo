#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void colorInvalids_kernel(uchar4 *out_image, const float *in_image, int width, int height) {
    // Calculate global index using faster dim3 multiplication
    const int x = blockIdx.x * blockDim.x + threadIdx.x;
    const int y = blockIdx.y * blockDim.y + threadIdx.y;

    if (x < width && y < height) {
        int ind = y * width + x; // Simplified multiplication for better readability
        uchar4 temp = out_image[ind];
        float value = in_image[ind];

        if (!isfinite(value)) {
            // Efficient operation by pre-computing factor
            float factor = 0.5f;
            temp.x *= factor;
            temp.y *= factor;
        }

        out_image[ind] = temp; // Move assignment outside conditional
    }
}