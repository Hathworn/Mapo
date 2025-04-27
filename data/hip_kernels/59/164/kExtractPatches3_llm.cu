#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void kExtractPatches3(float* images, float* patches, float* width_offset, float* height_offset, float* flip, int num_images, int img_width, int img_height, int patch_width, int patch_height, int num_colors) {

    int dest_col = blockIdx.x * blockDim.x + threadIdx.x;
    int dest_row = blockIdx.y * blockDim.y + threadIdx.y;
    
    // Ensure we stay within patch dimensions
    if (dest_col < patch_width && dest_row < patch_height) {
        // Precompute some variables outside the loop
        int patch_size = patch_width * patch_height;
        int img_size = img_width * img_height * num_colors;

        for (unsigned int b = blockIdx.z; b < num_colors * num_images; b += gridDim.z) {
            int color = b % num_colors;
            int image_id = b / num_colors;

            // Calculate source row and column considering potential flip
            int source_row = int(height_offset[image_id]) + dest_row;
            int source_col = int(width_offset[image_id]) + dest_col;
            source_col = (flip[image_id] > 0.5) ? (img_width - source_col - 1) : source_col;

            // Compute linear indices for source and destination
            unsigned long source_index = source_col + img_width * (source_row + img_height * (color + num_colors * image_id));
            unsigned long dest_index = dest_col + patch_width * (dest_row + patch_height * (color + num_colors * image_id));

            // Remove unnecessary synchronization
            patches[dest_index] = images[source_index];
        }
    }
}