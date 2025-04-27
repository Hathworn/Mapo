#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void convertKinectDisparityInPlace_kernel(float *d_disparity, int pitch, int width, int height, float depth_scale) {
    // Calculate the 2D position in the grid
    const int x = blockIdx.x * blockDim.x + threadIdx.x;
    const int y = blockIdx.y * blockDim.y + threadIdx.y;

    // Check if within image bounds
    if (x < width && y < height) {
        // Calculate the input pointer for the current position
        float *d_in = reinterpret_cast<float*>(reinterpret_cast<char*>(d_disparity) + y * pitch) + x;
        
        // Update disparity value or set to NaN
        *d_in = (*d_in == 0.0f) ? __int_as_float(0x7fffffff) : (-depth_scale / *d_in);  // Faster use of integer representation of NaN
    }
}