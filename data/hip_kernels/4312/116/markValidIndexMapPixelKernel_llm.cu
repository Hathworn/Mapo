#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void markValidIndexMapPixelKernel(hipTextureObject_t index_map, int validity_halfsize, unsigned img_rows, unsigned img_cols, unsigned char* flatten_validity_indicator) {
    const auto x_center = threadIdx.x + blockDim.x * blockIdx.x;
    const auto y_center = threadIdx.y + blockDim.y * blockIdx.y;
    if (x_center >= img_cols || y_center >= img_rows) return;
    const auto offset = x_center + y_center * img_cols;

    // Only depend on this pixel
    if (validity_halfsize <= 0) {
        const auto surfel_index = tex2D<unsigned>(index_map, x_center, y_center);
        flatten_validity_indicator[offset] = (surfel_index != 0xFFFFFFFF);
        return;
    }

    // Perform a window search when halfsize is at least 1
    unsigned char validity = 1;
    for (auto y = max(0, y_center - validity_halfsize); y <= min((int)img_rows - 1, y_center + validity_halfsize); y++) {
        for (auto x = max(0, x_center - validity_halfsize); x <= min((int)img_cols - 1, x_center + validity_halfsize); x++) {
            if (tex2D<unsigned>(index_map, x, y) == 0xFFFFFFFF) {
                validity = 0;
                break; // Exit early if invalid pixel found
            }
        }
        if (validity == 0) break; // No need to continue checking
    }

    // Save it
    flatten_validity_indicator[offset] = validity;
}