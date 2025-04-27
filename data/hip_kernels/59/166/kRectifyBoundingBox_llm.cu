#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kRectifyBoundingBox(float* boxes, float* width_offset, float* height_offset, float* flip, int num_images, int patch_width, int patch_height, int num_locs) {
    int loc_id = blockIdx.x * blockDim.x + threadIdx.x;

    if (loc_id < num_locs) {
        float *xmin_block = boxes + num_images * loc_id,
        *ymin_block = boxes + num_images * (loc_id + num_locs),
        *xmax_block = boxes + num_images * (loc_id + num_locs * 2),
        *ymax_block = boxes + num_images * (loc_id + num_locs * 3);

        for (int image_id = threadIdx.y; image_id < num_images; image_id += blockDim.y) {
            float xmin = (flip[image_id] > 0.5f) ? (256.f / patch_width - xmax_block[image_id]) : xmin_block[image_id];
            float xmax = (flip[image_id] > 0.5f) ? (256.f / patch_width - xmin_block[image_id]) : xmax_block[image_id];
            float ymin = ymin_block[image_id];
            float ymax = ymax_block[image_id];
            float wo = width_offset[image_id];
            float ho = height_offset[image_id];

            // Precomputing division outside the loop
            float patch_width_inv = 1.f / patch_width;
            float patch_height_inv = 1.f / patch_height;

            xmin_block[image_id] = xmin - wo * patch_width_inv;
            xmax_block[image_id] = xmax - wo * patch_width_inv;
            ymin_block[image_id] = ymin - ho * patch_height_inv;
            ymax_block[image_id] = ymax - ho * patch_height_inv;
        }
    }
}