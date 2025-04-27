#include "hip/hip_runtime.h"
#include "includes.h"

#define BLOCK_DIM 16

__global__ void extract_with_interpolation(int nthreads, float *data, float *n_xy_coords, float *extracted_data, int n_max_coord, int channels, int height, int width) {
    // Calculate the unique thread index within the grid
    int index = blockIdx.x * blockDim.x + threadIdx.x;
    
    if (index < nthreads) {
        int n = index / n_max_coord;
        int nd = n * n_max_coord * channels;
        float x = n_xy_coords[index * 2];
        float y = n_xy_coords[index * 2 + 1];

        // Calculate floor values and bounds check
        int x0 = max(0, min(width - 1, static_cast<int>(floor(x))));
        int y0 = max(0, min(height - 1, static_cast<int>(floor(y))));
        int x1 = min(width - 1, x0 + 1);
        int y1 = min(height - 1, y0 + 1);

        // Calculate weights for interpolation
        float wx0 = static_cast<float>(x1) - x;
        float wx1 = x - x0;
        float wy0 = static_cast<float>(y1) - y;
        float wy1 = y - y0;

        if (x0 == x1) { wx0 = 1; wx1 = 0; }
        if (y0 == y1) { wy0 = 1; wy1 = 0; }

        for (int c = 0; c < channels; c++) {
            int nc = (n * channels + c) * height;
            // Bilinear interpolation formula
            extracted_data[nd + index % n_max_coord + n_max_coord * c] = 
                wy0 * wx0 * data[(nc + y0) * width + x0] +
                wy1 * wx0 * data[(nc + y1) * width + x0] +
                wy0 * wx1 * data[(nc + y0) * width + x1] +
                wy1 * wx1 * data[(nc + y1) * width + x1];
        }
    }
}