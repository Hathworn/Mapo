#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void convertFloatToRGBA_kernel(uchar4 *out_image, const float *in_image, int width, int height) {
    const int x = blockIdx.x * blockDim.x + threadIdx.x;
    const int y = blockIdx.y * blockDim.y + threadIdx.y;
    if (x < width && y < height) {
        int IND = y * width + x;
        float val = in_image[IND];
        uchar4 temp;
        temp.x = temp.y = temp.z = static_cast<unsigned char>(val); // Use a static cast
        temp.w = 255; // Set alpha channel to 255
        out_image[IND] = temp;
    }
}