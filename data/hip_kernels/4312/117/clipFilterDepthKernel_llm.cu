#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void clipFilterDepthKernel(hipTextureObject_t raw_depth, const unsigned clip_img_rows, const unsigned clip_img_cols, const unsigned clip_near, const unsigned clip_far, const float sigma_s_inv_square, const float sigma_r_inv_square, hipSurfaceObject_t filter_depth) {
    // Parallel over the clipped image
    const auto x = threadIdx.x + blockDim.x * blockIdx.x;
    const auto y = threadIdx.y + blockDim.y * blockIdx.y;

    if (y >= clip_img_rows || x >= clip_img_cols) return;

    // Compute the center on raw depth
    constexpr auto half_width = 5; // Use constexpr for constants
    const auto raw_x = x + boundary_clip;
    const auto raw_y = y + boundary_clip;
    const unsigned short center_depth = tex2D<unsigned short>(raw_depth, raw_x, raw_y);

    // Use shared memory for window depth values
    __shared__ unsigned short window_depth[(2 * half_width + 1) * (2 * half_width + 1)];
    // Load the window depth values into shared memory
    const auto local_x = threadIdx.x;
    const auto local_y = threadIdx.y;

    for (int dy = -half_width; dy <= half_width; ++dy) {
        for (int dx = -half_width; dx <= half_width; ++dx) {
            const auto offset_y = raw_y + dy;
            const auto offset_x = raw_x + dx;
            const auto local_idx = (dy + half_width) * (2 * half_width + 1) + (dx + half_width);
            window_depth[local_idx] = tex2D<unsigned short>(raw_depth, offset_x, offset_y);
        }
    }
    __syncthreads(); // Ensure all threads have loaded their values

    // Iterate over the window using loaded values
    float sum_all = 0.0f;
    float sum_weight = 0.0f;

    for (int dy = -half_width; dy <= half_width; ++dy) {
        for (int dx = -half_width; dx <= half_width; ++dx) {
            const auto local_idx = (dy + half_width) * (2 * half_width + 1) + (dx + half_width);
            const unsigned short depth = window_depth[local_idx];
            const float depth_diff2 = (depth - center_depth) * (depth - center_depth);
            const float pixel_diff2 = dx * dx + dy * dy;
            const float this_weight = (depth > 0) * expf(-sigma_s_inv_square * pixel_diff2) * expf(-sigma_r_inv_square * depth_diff2);
            sum_weight += this_weight;
            sum_all += this_weight * depth;
        }
    }

    // Put back to the filtered depth
    unsigned short filtered_depth_value = __float2uint_rn(sum_all / sum_weight);
    if (filtered_depth_value < clip_near || filtered_depth_value > clip_far) filtered_depth_value = 0;
    surf2Dwrite(filtered_depth_value, filter_depth, x * sizeof(unsigned short), y);
}