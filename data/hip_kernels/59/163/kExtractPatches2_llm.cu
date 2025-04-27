#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kExtractPatches2(float* images, float* patches, float* width_offset, float* height_offset, float* flip, int num_images, int img_width, int img_height, int patch_width, int patch_height, int num_colors) {
    // Calculate image, color, and destination indices more efficiently
    int image_id = blockIdx.z % num_images;
    int color = blockIdx.z / num_images;
    int dest_col = blockIdx.x * blockDim.x + threadIdx.x;
    int dest_row = blockIdx.y * blockDim.y + threadIdx.y;

    // Ensure threads operate only within valid patch dimensions
    if (dest_col < patch_width && dest_row < patch_height) {
        // Calculate source position with offset adjustments
        int source_row = static_cast<int>(height_offset[image_id]) + dest_row;
        int source_col = static_cast<int>(width_offset[image_id]) + dest_col;
        // Apply flip adjustment
        if (flip[image_id] > 0.5f) {
            source_col = img_width - source_col - 1;
        }

        // Calculate linear indices for source and destination
        unsigned long dest_index = image_id + num_images * (dest_col + patch_width * (dest_row + patch_height * color));
        unsigned long source_index = source_col + img_width * (source_row + img_height * (color + num_colors * image_id));

        // Copy image data into patches
        patches[dest_index] = images[source_index];
    }
}