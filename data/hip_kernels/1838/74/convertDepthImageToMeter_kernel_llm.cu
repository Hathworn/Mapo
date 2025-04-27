#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void convertDepthImageToMeter_kernel(float *d_depth_image_meter, const unsigned int *d_depth_image_millimeter, int n_rows, int n_cols) {
    // Calculate global thread index
    const int x = blockIdx.x * blockDim.x + threadIdx.x;
    const int y = blockIdx.y * blockDim.y + threadIdx.y;
    
    // Check bounds
    if (x < n_cols && y < n_rows) {
        int ind = y * n_cols + x;
        unsigned int depth = d_depth_image_millimeter[ind];
        
        // Check for invalid depth and conversion
        d_depth_image_meter[ind] = (depth == 0xFFFFFFFF) ? nanf("") : static_cast<float>(depth) * 0.001f;
    }
}