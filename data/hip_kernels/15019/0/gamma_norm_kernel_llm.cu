#include "hip/hip_runtime.h"
#include "includes.h"

// Optimized kernel function
__global__ void gamma_norm_kernel(float* img, int image_height, int image_width, int image_step)
{
    // Calculate pixel positions using shared memory for better performance
    __shared__ int pixel_x_shared;
    __shared__ int pixel_y_shared;

    // Load pixel positions into shared memory
    if (threadIdx.x == 0) {
        pixel_x_shared = blockIdx.x * blockDim.y + threadIdx.y;
        pixel_y_shared = blockIdx.y * blockDim.z + threadIdx.z;
    }
    __syncthreads();

    // If current position is outside the image, stop here
    if(pixel_x_shared >= image_width || pixel_y_shared >= image_height)
    {
        return;
    }

    int channel = threadIdx.x;

    // Each row has image_step pixels and each pixel has three channels
    int in_pixel_idx = pixel_y_shared * image_step + pixel_x_shared * 3 + channel;

    // Finally perform the normalization
    img[in_pixel_idx] = sqrt(img[in_pixel_idx] / 256.0f);
}