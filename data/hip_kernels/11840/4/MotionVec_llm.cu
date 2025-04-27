#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void MotionVec(float *new_image_dev, float *old_image_dev, uchar4 *Image_dev, int w, int h)
{
    // Calculate global thread index
    const int ix = blockDim.x * blockIdx.x + threadIdx.x;
    const int iy = blockDim.y * blockIdx.y + threadIdx.y;

    // Ensure within bounds for safety
    if (ix >= w || iy >= h) return;
    
    // Compute the difference squared
    float diff = old_image_dev[w * iy + ix] - new_image_dev[w * iy + ix];
    diff *= diff;

    // Threshold for motion detection
    float threshold = 5000.0f;

    // Update image where motion exceeds threshold
    if (diff > threshold)
    {
        Image_dev[w * iy + ix] = make_uchar4(0, 0, 255, 0); // Simplified assignment
    }
}