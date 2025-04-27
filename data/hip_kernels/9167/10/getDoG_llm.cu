#include "hip/hip_runtime.h"
#include "includes.h"
__device__ void generate2DGaussian(double * output, double sigma, int sz, bool normalize) {

    // Thread index handling for better readability
    const int colIdx = threadIdx.x;
    const int rowIdx = threadIdx.y;
    int linearIdx = rowIdx*sz + colIdx;

    // Pre-compute constants and distances
    double invTwoSigmaSq = 1.0 / (2.0 * sigma * sigma);
    int distx = colIdx - sz / 2;
    int disty = rowIdx - sz / 2;

    // Calculate Gaussian value
    output[linearIdx] = exp(-(distx * distx + disty * disty) * invTwoSigmaSq);

    if(normalize) {
        // Synchronize threads before normalization
        __syncthreads();

        // Use a local variable to accumulate the sum
        double sum = 0.0;
        for(int i = 0; i < sz*sz; i++) {
            sum += output[i];
        }

        // Normalize values
        __syncthreads(); // Ensure sum calculation is complete
        output[linearIdx] /= sum;
    }
}

__global__ void getDoG(double * output, double sigma, double sigmaratio) {

    // Calculate filter size
    int sz = ceil(sigma*3) * 2 + 1;

    // Calculate linear index
    int linearIdx = threadIdx.y * sz + threadIdx.x;
    if(linearIdx >= sz * sz) return;

    // Shared memory for Gaussian filters
    extern __shared__ double sharedMemory[];
    double* g1 = sharedMemory;
    double* g2 = sharedMemory + 900;

    // Generate Gaussians in shared memory
    generate2DGaussian(g1, sigma, sz, true);
    generate2DGaussian(g2, sigma * sigmaratio, sz, true);

    // Synchronize threads before applying DoG
    __syncthreads();

    // Compute Difference of Gaussians
    output[linearIdx] = g2[linearIdx] - g1[linearIdx];
}