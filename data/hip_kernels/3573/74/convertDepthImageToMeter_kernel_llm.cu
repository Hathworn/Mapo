#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void convertDepthImageToMeter_kernel(float *d_depth_image_meter, const unsigned int *d_depth_image_millimeter, int n_rows, int n_cols) {

    // Calculate index using flattened 2D grid and block indexes
    const int ind = blockIdx.y * blockDim.y * n_cols + blockIdx.x * blockDim.x + threadIdx.y * n_cols + threadIdx.x;

    // Check if index is within image bounds
    if (ind < n_rows * n_cols) {
        unsigned int depth = d_depth_image_millimeter[ind];
        // Perform conversion from millimeters to meters
        d_depth_image_meter[ind] = (depth == 4294967295) ? nanf("") : (float)depth / 1000.0f;
    }
}