#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void filterDensityMapKernel(hipTextureObject_t density_map, unsigned rows, unsigned cols, hipSurfaceObject_t filter_density_map) {
    const auto x = threadIdx.x + blockIdx.x * blockDim.x;
    const auto y = threadIdx.y + blockIdx.y * blockDim.y;
    if (x >= cols || y >= rows) return;

    const auto half_width = 5;
    const float center_density = tex2D<float>(density_map, x, y);

    // Initialize sums as registers for better performance
    float sum_all = 0.0f;
    float sum_weight = 0.0f;

    // Optimize window search with combined loop to reduce redundant calculations
    for (int dy = -half_width; dy <= half_width; dy++) {
        int y_idx = y + dy;
        for (int dx = -half_width; dx <= half_width; dx++) {
            int x_idx = x + dx;
            const float density = tex2D<float>(density_map, x_idx, y_idx);
            const float value_diff2 = (center_density - density) * (center_density - density);
            const float pixel_diff2 = dx * dx + dy * dy;
            const float this_weight = (density > 0.0f) * expf(-0.04f * pixel_diff2) * expf(-100.0f * value_diff2);
            sum_weight += this_weight;
            sum_all += this_weight * density;
        }
    }

    // Calculate filter value and clip it to a suitable range
    float filter_density_value = sum_all / sum_weight;
    filter_density_value = fminf(fmaxf(filter_density_value, 0.0f), 1.0f);

    surf2Dwrite(filter_density_value, filter_density_map, x * sizeof(float), y);
}