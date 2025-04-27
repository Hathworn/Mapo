#include "hip/hip_runtime.h"
#include "includes.h"

#define IDX2D(a, i, stride, j) ((a)[(i)*(stride) + (j)])

__global__ void grayscale_kernel(double *z, unsigned char *output, size_t size, double z_min, double z_max) {
    // Calculate global thread index
    const int idx = threadIdx.x + blockDim.x * blockIdx.x;
    const int stride = blockDim.x * gridDim.x;

    // Use shared memory to optimize repeated calculations
    __shared__ double scaled[256]; // Assuming max blockDim.x value
    
    if (threadIdx.x < 256) {
        // Pre-compute the scaling factors
        scaled[threadIdx.x] = z_min + ((z_max - z_min) * threadIdx.x / 255.0);
    }
    __syncthreads();

    // Efficient iteration over the assigned data
    for (int i = idx; i < size; i += stride) {
        double value = z[i];
        int scaled_value = static_cast<int>((value - z_min) / (z_max - z_min) * 255);
        output[i] = (unsigned char) (fmin(fmax(scaled_value, 0), 255)); // Clamp to 0-255
    }
}