#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void colorInvalids_kernel(uchar4 *out_image, const float *in_image, int width, int height) {
    // Using blockIdx.x * blockDim.x + threadIdx.x for index calculation (replacing deprecated __mul24)
    const int x = blockIdx.x * blockDim.x + threadIdx.x;
    const int y = blockIdx.y * blockDim.y + threadIdx.y;

    if (x < width && y < height) {
        int ind = y * width + x; // Compute image index
        uchar4 temp = out_image[ind];
        float value = in_image[ind];

        if (!isfinite(value)) { // color invalid entries
            temp.x *= 0.5f; // Scale red component
            temp.y *= 0.5f; // Scale green component
        }

        out_image[ind] = temp; // Write back to output image
    }
}