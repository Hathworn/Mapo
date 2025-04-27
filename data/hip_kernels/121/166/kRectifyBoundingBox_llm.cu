#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void kRectifyBoundingBox(float* boxes, float* width_offset, float* height_offset, float* flip, int num_images, int patch_width, int patch_height, int num_locs) {

    // Calculate block-wide variables once
    int loc_id_start = blockIdx.x;
    int loc_id_step = gridDim.x;
    int image_id_start = threadIdx.x;
    int image_id_step = blockDim.x;

    for (int loc_id = loc_id_start; loc_id < num_locs; loc_id += loc_id_step) {
        // Precompute index computations
        float *xmin_block = boxes + num_images * loc_id;
        float *ymin_block = boxes + num_images * (loc_id + num_locs);
        float *xmax_block = boxes + num_images * (loc_id + num_locs * 2);
        float *ymax_block = boxes + num_images * (loc_id + num_locs * 3);
        
        for (int image_id = image_id_start; image_id < num_images; image_id += image_id_step) {
            // Use registers for frequently accessed values
            float flip_value = flip[image_id];
            float xmin, xmax, ymin, ymax, wo, ho;

            // Decide xmin and xmax based on flipping
            if (flip_value > 0.5) {
                xmin = 256.0 / patch_width - xmax_block[image_id];
                xmax = 256.0 / patch_width - xmin_block[image_id];
            } else {
                xmin = xmin_block[image_id];
                xmax = xmax_block[image_id];
            }

            // Directly fetch values from memory
            ymin = ymin_block[image_id];
            ymax = ymax_block[image_id];
            wo = width_offset[image_id];
            ho = height_offset[image_id];

            // Update bounding box coordinates efficiently
            xmin_block[image_id] = xmin - wo / patch_width;
            xmax_block[image_id] = xmax - wo / patch_width;
            ymin_block[image_id] = ymin - ho / patch_height;
            ymax_block[image_id] = ymax - ho / patch_height;
        }
    }
}