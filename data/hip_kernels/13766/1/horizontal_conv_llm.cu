#include "hip/hip_runtime.h"
#include "includes.h"

using namespace std;

struct pixel //to store RGB values
{
    unsigned char r;
    unsigned char g;
    unsigned char b;
};

__device__ pixel padding(pixel* Pixel_val, int x_coord, int y_coord, int img_width, int img_height)
{
    pixel Px = {0, 0, 0}; // Initialize pixel to zero
    if (x_coord < img_width && y_coord < img_height && x_coord >= 0 && y_coord >= 0)
    {
        Px = Pixel_val[y_coord * img_width + x_coord];
    }
    return Px;
}

__global__ void horizontal_conv(pixel* Pixel_in, pixel* Pixel_out, int img_wd, int img_ht, float* kernel, int k)
{
    __shared__ float shared_kernel[256]; // Use shared memory for kernel

    size_t col = blockIdx.x * blockDim.x + threadIdx.x;
    size_t row = blockIdx.y * blockDim.y + threadIdx.y;
    size_t pix_idx = row * img_wd + col;

    if (threadIdx.x < k) {
        shared_kernel[threadIdx.x] = kernel[threadIdx.x]; // Load kernel into shared memory
    }
    __syncthreads(); // Ensure all threads have loaded the kernel

    float tmp_r = 0, tmp_g = 0, tmp_b = 0;
    if (row < img_ht && col < img_wd)
    {
        for (int l = 0; l < k; l++)
        {
            pixel pix_val = padding(Pixel_in, col + l - (k - 1) / 2, row, img_wd, img_ht);
            tmp_r += pix_val.r * shared_kernel[l];
            tmp_g += pix_val.g * shared_kernel[l];
            tmp_b += pix_val.b * shared_kernel[l];
        }
        Pixel_out[pix_idx].r = tmp_r;
        Pixel_out[pix_idx].g = tmp_g;
        Pixel_out[pix_idx].b = tmp_b;
    }
}