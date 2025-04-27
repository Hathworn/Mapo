#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void filterForegroundMaskKernel(hipTextureObject_t foreground_mask, unsigned mask_rows, unsigned mask_cols, const float sigma, hipSurfaceObject_t filter_mask) {
    // Calculate global thread coordinates
    const int x = threadIdx.x + blockDim.x * blockIdx.x;
    const int y = threadIdx.y + blockDim.y * blockIdx.y;

    // Early exit if thread is out of bounds
    if (x >= mask_cols || y >= mask_rows) return;

    // Calculate parameters for window search
    const int halfsize = __float2uint_ru(sigma) * 2;
    float total_weight = 0.0f;
    float total_value = 0.0f;

    // Iterate over neighboring pixels within a window
    for (int neighbor_y = max(0, y - halfsize); neighbor_y <= min(mask_rows - 1, y + halfsize); neighbor_y++) {
        for (int neighbor_x = max(0, x - halfsize); neighbor_x <= min(mask_cols - 1, x + halfsize); neighbor_x++) {
            // Retrieve the mask value at neighbor
            const unsigned char neighbor_foreground = tex2D<unsigned char>(foreground_mask, neighbor_x, neighbor_y);

            // Compute the gaussian weight
            const float diff_x_square = (neighbor_x - x) * (neighbor_x - x);
            const float diff_y_square = (neighbor_y - y) * (neighbor_y - y);
            const float weight = __expf(0.5f * (diff_x_square + diff_y_square) / (sigma * sigma));

            // Accumulate weight and value
            total_weight += weight;
            total_value += weight * float(1 - neighbor_foreground);
        }
    }

    // Compute the value locally
    const unsigned char foreground_indicator = tex2D<unsigned char>(foreground_mask, x, y);
    float filter_value = 0.0f;
    if (foreground_indicator == 0) {
        filter_value = total_value / (total_weight + 1e-3f); // Avoid division by zero
    }

    // Write the computed filter value to the surface
    surf2Dwrite(filter_value, filter_mask, x * sizeof(float), y);
}