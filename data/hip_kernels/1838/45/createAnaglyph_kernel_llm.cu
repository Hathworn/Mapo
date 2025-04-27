#include "hip/hip_runtime.h"
#include "includes.h"

__device__ static float rgbaToGray(uchar4 rgba) {
    return (0.299f * (float)rgba.x + 0.587f * (float)rgba.y + 0.114f * (float)rgba.z);
}

__global__ void createAnaglyph_kernel(uchar4 *out_image, const uchar4 *left_image, const uchar4 *right_image, int width, int height, int pre_shift) {
    // Calculate the global x and y indices
    const int x = blockIdx.x * blockDim.x + threadIdx.x;
    const int y = blockIdx.y * blockDim.y + threadIdx.y;

    // If indices are within image bounds
    if (x < width && y < height) {
        // Use shared memory to reduce global memory accesses
        __shared__ uchar4 shared_left[1024];
        __shared__ uchar4 shared_right[1024];
        
        // Load left and right images into shared memory
        int idx = threadIdx.y * blockDim.x + threadIdx.x;
        shared_left[idx] = left_image[y * width + x];
        int x_right = x - pre_shift;
        if (x_right >= 0 && x_right < width) {
            shared_right[idx] = right_image[y * width + x_right];
        }

        __syncthreads();

        uchar4 temp;
        temp.x = rgbaToGray(shared_left[idx]);

        if (x_right >= 0 && x_right < width) {
            temp.y = rgbaToGray(shared_right[idx]);
            temp.z = temp.y;
        } else {
            temp.y = 0;
            temp.z = 0;
        }

        temp.w = 255;

        // Write back the result to global memory
        out_image[y * width + x] = temp;
    }
}