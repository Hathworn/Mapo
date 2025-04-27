#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void cuImageBrighten(const float *dev_image, float *dev_out, int w, int h)
{
    // Use blockDim and gridDim for scalability
    int x = blockIdx.x * blockDim.x + threadIdx.x;
    int y = blockIdx.y * blockDim.y + threadIdx.y;
    
    // Condition to handle image bounds and avoid out of bounds memory access
    if (x < w && y < h) {
        int pos = x + w * y;
        dev_out[pos] = min(255.0f, dev_image[pos] + 50.0f);
    }
}