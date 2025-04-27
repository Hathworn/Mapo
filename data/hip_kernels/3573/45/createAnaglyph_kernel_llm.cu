#include "hip/hip_runtime.h"
#include "includes.h"

__device__ static float rgbaToGray(uchar4 rgba) {
    return (0.299f * (float)rgba.x + 0.587f * (float)rgba.y +
            0.114f * (float)rgba.z);
}

__global__ void createAnaglyph_kernel(uchar4 *out_image, const uchar4 *left_image, const uchar4 *right_image, int width, int height, int pre_shift) {
    const int x = blockIdx.x * blockDim.x + threadIdx.x;
    const int y = blockIdx.y * blockDim.y + threadIdx.y;
    
    if (x < width && y < height) {
        uchar4 temp;
        int index = y * width + x; // Compute index once to avoid recomputation
        temp.x = rgbaToGray(left_image[index]);

        // Use ternary operator to simplify condition
        int x_right = x - pre_shift;
        if (x_right > 0 && x_right < width) {
            float gray_value = rgbaToGray(right_image[y * width + x_right]);
            temp.y = gray_value;
            temp.z = gray_value;
        } else {
            temp.y = 0;
            temp.z = 0;
        }

        temp.w = 255; // Alpha value always set to 255

        out_image[index] = temp;
    }
}