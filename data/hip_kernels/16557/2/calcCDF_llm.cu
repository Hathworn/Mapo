#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void calcCDF(float *cdf, unsigned int *histo, int imageWidth, int imageHeight, int length) {
    // Use shared memory for fast access
    __shared__ float partialScan[SIZE_CDF];

    int i = threadIdx.x + blockDim.x * blockIdx.x;

    // Load histogram into shared memory and normalize
    if (i < SIZE_CDF && i < 256) {
        partialScan[i] = (float)histo[i] / (float)(imageWidth * imageHeight);
    }
    __syncthreads();

    // Hillis-Steele scan for prefix sum
    for (unsigned int stride = 1; stride <= SIZE_HISTO; stride *= 2) {
        unsigned int index = (threadIdx.x + 1) * stride * 2 - 1;
        if (index < SIZE_CDF && index < length) {
            partialScan[index] += partialScan[index - stride];
        }
        __syncthreads();
    }

    // Regularize the array using downsweep stage
    for (unsigned int stride = SIZE_HISTO / 2; stride > 0; stride /= 2) {
        __syncthreads();
        unsigned int index = (threadIdx.x + 1) * stride * 2 - 1;
        if (index + stride < SIZE_CDF && index + stride < length) {
            partialScan[index + stride] += partialScan[index];
        }
    }

    // Write the results back to the global memory
    __syncthreads();
    if (i < SIZE_CDF && i < 256) {
        cdf[i] = partialScan[i];  // Correct the output write
    }
}