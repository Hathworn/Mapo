#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void convertKinectDisparityToRegularDisparity_kernel(float *d_regularDisparity, int d_regularDisparityPitch, const float *d_KinectDisparity, int d_KinectDisparityPitch, int width, int height) {
    const int x = blockIdx.x * blockDim.x + threadIdx.x;
    const int y = blockIdx.y * blockDim.y + threadIdx.y;

    // Ensure thread is within the image bounds
    if ((x < width) && (y < height)) {
        // Calculate disparity inputs and outputs
        float d_in = *reinterpret_cast<const float*>(
            reinterpret_cast<const char*>(d_KinectDisparity) + y * d_KinectDisparityPitch + x * sizeof(float));

        float d_out = (d_in == 0.0f) ? nanf("") : -d_in;

        *reinterpret_cast<float*>(
            reinterpret_cast<char*>(d_regularDisparity) + y * d_regularDisparityPitch + x * sizeof(float)) = d_out;
    }
}
```
