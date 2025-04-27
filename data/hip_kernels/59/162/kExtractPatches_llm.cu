#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void kExtractPatches(float* images, float* patches, float* indices, float* width_offset, float* height_offset, int num_images, int img_width, int img_height, int patch_width, int patch_height, int num_colors) {
    const unsigned long idx = blockIdx.x * blockDim.x + threadIdx.x;
    const unsigned long numThreads = blockDim.x * gridDim.x;
    const unsigned long total_pixels = patch_width * patch_height * num_colors * num_images;

    for (unsigned long i = idx; i < total_pixels; i += numThreads) {
        unsigned long ind = i;
        unsigned long image_id = ind % num_images; 
        ind /= num_images;
        unsigned long dest_col = ind % patch_width; 
        ind /= patch_width;
        unsigned long dest_row = ind % patch_height; 
        ind /= patch_height;
        unsigned long color = ind % num_colors;

        unsigned long source_row = static_cast<unsigned long>(height_offset[image_id]) + dest_row;
        unsigned long source_col = static_cast<unsigned long>(width_offset[image_id]) + dest_col;
        // Use pre-calculated index offset to improve readability
        unsigned long pos = source_col + img_width * (source_row + img_height * (color + num_colors * static_cast<int>(indices[image_id])));
        patches[i] = images[pos];
    }
}