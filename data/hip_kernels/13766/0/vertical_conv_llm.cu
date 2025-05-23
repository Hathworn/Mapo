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
    pixel Px;
    Px.r = 0; Px.g = 0; Px.b = 0;
    if (x_coord < img_width && y_coord < img_height && x_coord >= 0 && y_coord >= 0)
    {
        Px = Pixel_val[y_coord * img_width + x_coord];
    }
    return Px;
}

__global__ void vertical_conv(pixel* Pixel_in_v, pixel* Pixel_out_v, int img_wd_v, int img_ht_v, float* kernel_v, int k_v)
{
    // Use register variables for temporary output storage
    float tmp_r = 0, tmp_g = 0, tmp_b = 0;
  
    // Calculate unique global index for each thread
    size_t col = blockIdx.x * blockDim.x + threadIdx.x;
    size_t row = blockIdx.y * blockDim.y + threadIdx.y;
  
    // Calculate pixel index for flat array access
    size_t pix_idx_v = row * img_wd_v + col;
  
    // Bounds check to ensure valid pixel processing
    if (row < img_ht_v && col < img_wd_v)
    {
        #pragma unroll // Unroll the loop for better performance
        for (int l = 0; l < k_v; l++)
        {
            pixel pix_val = padding(Pixel_in_v, col, (row + l - (k_v - 1) / 2), img_wd_v, img_ht_v);
            tmp_r += pix_val.r * kernel_v[l];
            tmp_b += pix_val.b * kernel_v[l];
            tmp_g += pix_val.g * kernel_v[l];
        }
      
        // Write results to global memory
        Pixel_out_v[pix_idx_v].r = tmp_r;
        Pixel_out_v[pix_idx_v].g = tmp_g;
        Pixel_out_v[pix_idx_v].b = tmp_b;
    }
}