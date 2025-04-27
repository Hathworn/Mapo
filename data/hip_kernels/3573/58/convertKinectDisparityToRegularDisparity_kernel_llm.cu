#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void convertKinectDisparityToRegularDisparity_kernel(float *d_regularDisparity, int d_regularDisparityPitch, 
                                                                const float *d_KinectDisparity, int d_KinectDisparityPitch, 
                                                                int width, int height) {

    // Calculate global thread indices
    const int x = blockIdx.x * blockDim.x + threadIdx.x;
    const int y = blockIdx.y * blockDim.y + threadIdx.y;

    // Ensure thread is within image boundaries
    if (x < width && y < height) {
        // Efficiently calculate input and output pointers
        const float *inputPtr = (const float*)((const char*)d_KinectDisparity + y * d_KinectDisparityPitch) + x;
        float *outputPtr = (float*)((char*)d_regularDisparity + y * d_regularDisparityPitch) + x;

        // Read input and compute output value
        float d_in = *inputPtr;
        float d_out = (d_in == 0.0f) ? nanf("") : -d_in;

        // Write computed output
        *outputPtr = d_out;
    }
}