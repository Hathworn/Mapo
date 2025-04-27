#include "hip/hip_runtime.h"
#include "includes.h"

texture<float, hipTextureType2D> tex_img;
texture<float, hipTextureType2D> tex_kernel;

__global__ void convolve(const int input_width, const int input_height, const int kernel_radius, float *output) {
    
    int row = blockIdx.x * blockDim.x + threadIdx.x;
    int col = blockIdx.y * blockDim.y + threadIdx.y;

    if ((col < input_height) && (row < input_width)) {
        float value = 0.0f;

        // Unroll loop to reduce overhead and improve parallel execution
        #pragma unroll
        for (int y = -kernel_radius; y <= kernel_radius; ++y) {
            #pragma unroll
            for (int x = -kernel_radius; x <= kernel_radius; ++x) {
                // Use texture fetches, leverage caching mechanism
                value += tex2D(tex_img, row + x, col + y) * tex2D(tex_kernel, x + kernel_radius, y + kernel_radius);
            }
        }

        int idx = col * input_width + row;
        output[idx] = value; // Coalesced write
    }
}