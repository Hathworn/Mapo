#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void foregroundMaskUpsampleFilterKernel(hipTextureObject_t subsampled_mask, unsigned upsample_rows, unsigned upsample_cols, const float sigma, hipSurfaceObject_t upsampled_mask, hipSurfaceObject_t filter_mask) {
    const int x = threadIdx.x + blockDim.x * blockIdx.x;
    const int y = threadIdx.y + blockDim.y * blockIdx.y;

    // Return early if out of bounds
    if (x >= upsample_cols || y >= upsample_rows) return;

    const int halfsize = __float2uint_ru(sigma) * 2;
    float total_weight = 0.0f;
    float total_value = 0.0f;

    const auto subsampled_x = x / crf_subsample_rate;
    const auto subsampled_y = y / crf_subsample_rate;
    const unsigned char foreground_indicator = tex2D<unsigned char>(subsampled_mask, subsampled_x, subsampled_y);

    // Combine bounds check with accumulation
    for (int offset_y = -halfsize; offset_y <= halfsize; offset_y++) {
        const int neighbor_y = y + offset_y;
        for (int offset_x = -halfsize; offset_x <= halfsize; offset_x++) {
            const int neighbor_x = x + offset_x;

            // Check if neighbor is within bounds
            if (neighbor_x >= 0 && neighbor_x < upsample_cols && neighbor_y >= 0 && neighbor_y < upsample_rows) {
                const auto subsampled_neighbor_x = neighbor_x / crf_subsample_rate;
                const auto subsampled_neighbor_y = neighbor_y / crf_subsample_rate;

                // Retrieve the mask value at neighbor
                const unsigned char neighbor_foreground = tex2D<unsigned char>(subsampled_mask, subsampled_neighbor_x, subsampled_neighbor_y);

                // Compute the gaussian weight
                const float diff_x_square = offset_x * offset_x;
                const float diff_y_square = offset_y * offset_y;
                const float weight = __expf(0.5f * (diff_x_square + diff_y_square) / (sigma * sigma));
                
                // Accumulate the weight and value
                total_weight += weight;
                total_value += weight * float(1 - neighbor_foreground);
            }
        }
    }

    float filter_value = 0.0f;
    if (foreground_indicator == 0) {
        filter_value = total_value / (total_weight + 1e-3f);
    }

    // Write to the surfaces
    surf2Dwrite(foreground_indicator, upsampled_mask, x * sizeof(unsigned char), y);
    surf2Dwrite(filter_value, filter_mask, x * sizeof(float), y);
}