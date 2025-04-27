#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kRectifyBoundingBox( float* boxes, float* width_offset, float* height_offset, float* flip, int num_images, int patch_width, int patch_height, int num_locs) {
    int loc_id = blockIdx.x * blockDim.x + threadIdx.x; // Optimize: calculate global index for location
    if (loc_id < num_locs) { // Optimize: boundary check for location index
        float *xmin_block = boxes + num_images * loc_id,
              *ymin_block = boxes + num_images * (loc_id + num_locs),
              *xmax_block = boxes + num_images * (loc_id + num_locs * 2),
              *ymax_block = boxes + num_images * (loc_id + num_locs * 3);

        int image_id = threadIdx.x; // Optimize: use threadIdx for image offset
        while (image_id < num_images) { // Optimize: loop optimization by while condition
            float xmin = (flip[image_id] > 0.5f) ? (256.0f / patch_width - xmax_block[image_id]) : xmin_block[image_id],
                  xmax = (flip[image_id] > 0.5f) ? (256.0f / patch_width - xmin_block[image_id]) : xmax_block[image_id];

            float wo = width_offset[image_id], ho = height_offset[image_id];
            xmin_block[image_id] = xmin - wo / patch_width;
            xmax_block[image_id] = xmax - wo / patch_width;

            ymin_block[image_id] = ymin_block[image_id] - ho / patch_height;
            ymax_block[image_id] = ymax_block[image_id] - ho / patch_height;

            image_id += blockDim.x; // Move to next image
        }
    }
}