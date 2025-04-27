```c
#include "hip/hip_runtime.h"
#include "includes.h"

__device__ void generate2DGaussian(double *output, double sigma, int sz, bool normalize) {
    // Compute coordinates and index
    const int colIdx = threadIdx.x;
    const int rowIdx = threadIdx.y;
    int linearIdx = rowIdx * sz + colIdx;

    // Calculate distance from center and assign Gaussian value
    int distx = colIdx - sz / 2;
    int disty = rowIdx - sz / 2;
    double gaussValue = exp(-(distx * distx + disty * disty) / (2.0 * sigma * sigma));
    output[linearIdx] = gaussValue;

    // Optional normalization
    if (normalize) {
        // Synchronize threads before summing
        __syncthreads();

        // Optimize sum calculation using a single thread
        if (linearIdx == 0) {
            double sum = 0.0;
            for (int i = 0; i < sz * sz; ++i) {
                sum += output[i];
            }
            // Store sum for normalization
            output[sz * sz] = sum;
        }

        // Synchronize before normalization
        __syncthreads();

        // Normalize using precomputed sum
        double sum = output[sz * sz];
        output[linearIdx] /= sum;
    }
}

__global__ void getGaussian(double *output, double sigma) {
    int sz = ceil(sigma * 3) * 2 + 1;
    if (threadIdx.y * sz + threadIdx.x >= sz * sz) return;  // Boundary check

    generate2DGaussian(output, sigma, sz, false);
}