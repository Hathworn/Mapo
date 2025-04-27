#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void yuv2rgb_kernel(int img_size, unsigned char *img_r, unsigned char *img_g, unsigned char *img_b, unsigned char *img_y, unsigned char *img_u, unsigned char *img_v) {

    int i = threadIdx.x + blockDim.x * blockIdx.x;

    if (i < img_size) {
        // Load YUV values from global memory and convert U,V to centered format
        unsigned char y = img_y[i];
        double cb = static_cast<double>(img_u[i]) - 128;
        double cr = static_cast<double>(img_v[i]) - 128;

        // Compute RGB values using modified YUV formula
        img_r[i] = min(max(y + 1.402 * cr, 0.0), 255.0);
        img_g[i] = min(max(y - 0.344 * cb - 0.714 * cr, 0.0), 255.0);
        img_b[i] = min(max(y + 1.772 * cb, 0.0), 255.0);
    }
}