#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void markPotentialMatchedDepthPairKernel(hipTextureObject_t index_map, unsigned img_rows, unsigned img_cols, unsigned* reference_pixel_matched_indicator) {
    // Calculate global thread ID
    const auto x = blockIdx.x * blockDim.x + threadIdx.x;
    const auto y = blockIdx.y * blockDim.y + threadIdx.y;

    // Return if out of bounds
    if (x >= img_cols || y >= img_rows) return;

    // Compute offset for 1D array access
    const auto offset = y * img_cols + x;

    // Fetch the index value from the texture
    const auto surfel_index = tex2D<unsigned>(index_map, x, y);

    // Set indicator based on validity of surfel index
    reference_pixel_matched_indicator[offset] = (surfel_index != d_invalid_index) ? 1 : 0;
}