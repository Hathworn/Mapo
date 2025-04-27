#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void kExtractPatches3(float* images, float* patches, float* width_offset, float* height_offset, float* flip, int num_images, int img_width, int img_height, int patch_width, int patch_height, int num_colors) {

    // Calculate destination pixel position
    int dest_col = blockIdx.x * blockDim.x + threadIdx.x;
    int dest_row = blockIdx.y * blockDim.y + threadIdx.y;

    // Boundary check for patch dimension
    if (dest_col < patch_width && dest_row < patch_height) {
        
        int num_batches = num_colors * num_images;

        // Iterate over each image batch using grid-stride loop
        for (unsigned int b = blockIdx.z; b < num_batches; b += gridDim.z) {
            int color    = b % num_colors;
            int image_id = b / num_colors;
            
            // Compute source row and column
            int source_row = __float2int_rn(height_offset[image_id]) + dest_row;
            int source_col = __float2int_rn(width_offset[image_id]) + dest_col;
            
            // Handle image flipping
            source_col = (flip[image_id] > 0.5f) ? (img_width - source_col - 1) : source_col;
            
            // Calculate indices in the images and patches arrays
            unsigned long source_index = source_col + img_width * (source_row + img_height * (color + num_colors * image_id));
            unsigned long dest_index = dest_col + patch_width * (dest_row + patch_height * (color + num_colors * image_id));
            
            // Assign patch value
            patches[dest_index] = images[source_index];
        }
    }
}