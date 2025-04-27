#include "hip/hip_runtime.h"
#include "includes.h"

#define DEG2RAD 0.01745329252f // Define DEG2RAD for degree to radian conversion

__device__ int getGlobalIdx_2D_2D()
{
    int blockId = blockIdx.x + blockIdx.y * gridDim.x;
    int threadId = blockId * (blockDim.x * blockDim.y) 
                   + (threadIdx.y * blockDim.x) 
                   + threadIdx.x;
    return threadId;
}

__global__ void CudaTransform(unsigned char* dev_img, unsigned int *dev_accu, int w, int h){

    // Calculate index which this thread has to process
    unsigned int index = getGlobalIdx_2D_2D();

    // Check index is within image bounds
    if(index < (w * h)){
        // Calculate parameters
        float hough_h = (sqrtf(2.0f) * max(w, h)) / 2.0f; // Use max to decide width or height
        float center_x = w / 2.0f;
        float center_y = h / 2.0f;

        // Calculate coordinates for corresponding index in entire image
        int x = index % w;
        int y = index / w;

        if(dev_img[index] > 250){ // Check if the pixel is white (grayscale value > 250)
            for(int t = 0; t < 180; t++){ // Iterate through the parameter space from 0° to 180°
                
                // Use native trigonometric functions for performance
                float r = ( (x - center_x) * cosf(t * DEG2RAD) ) + ( (y - center_y) * sinf(t * DEG2RAD) );
                
                // Atomic increment for histogram bin
                atomicAdd(&(dev_accu[ (int)((roundf(r + hough_h) * 180.0f)) + t ]), 1);
            }
        }
    }
}