#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void tonemap(float* __restrict__ d_x, float* __restrict__ d_y, float* __restrict__ d_log_Y, float* __restrict__ d_cdf_norm, float* __restrict__ d_r_new, float* __restrict__ d_g_new, float* __restrict__ d_b_new, float min_log_Y, float max_log_Y, float log_Y_range, int num_bins, int num_pixels_y, int num_pixels_x)
{
    int nx = num_pixels_x;
    int ny = num_pixels_y;
    int2 image_index_2d = make_int2(blockIdx.x * blockDim.x + threadIdx.x, blockIdx.y * blockDim.y + threadIdx.y);
    int image_index_1d = nx * image_index_2d.y + image_index_2d.x;

    // Improved boundary check
    if (image_index_2d.x >= nx || image_index_2d.y >= ny) return;

    // Use shared memory for frequent accesses
    __shared__ float shared_cdf_norm[1024];  // Assuming blockDim.x * blockDim.y <= 1024
    if (threadIdx.x < num_bins) {
        shared_cdf_norm[threadIdx.x] = d_cdf_norm[threadIdx.x];
    }
    __syncthreads();

    float x = d_x[image_index_1d];
    float y = d_y[image_index_1d];
    float log_Y = d_log_Y[image_index_1d];
    int bin_index = min(num_bins - 1, int(num_bins * (log_Y - min_log_Y) / log_Y_range));
    float Y_new = shared_cdf_norm[bin_index];

    // Pre-compute reciprocal for dividing multiple times
    float recip_y = 1.0f / y;
    float X_new = x * (Y_new * recip_y);
    float Z_new = (1.0f - x - y) * (Y_new * recip_y);

    // Constants for color transformation
    const float c0 = 3.2406f, c1 = -1.5372f, c2 = -0.4986f;
    const float c3 = -0.9689f, c4 = 1.8758f, c5 = 0.0415f;
    const float c6 = 0.0557f, c7 = -0.2040f, c8 = 1.0570f;

    float r_new = X_new * c0 + Y_new * c1 + Z_new * c2;
    float g_new = X_new * c3 + Y_new * c4 + Z_new * c5;
    float b_new = X_new * c6 + Y_new * c7 + Z_new * c8;

    d_r_new[image_index_1d] = r_new;
    d_g_new[image_index_1d] = g_new;
    d_b_new[image_index_1d] = b_new;
}