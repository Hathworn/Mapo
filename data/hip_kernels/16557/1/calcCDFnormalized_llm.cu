#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void calcCDFnormalized(const unsigned int *histo, float *cdf, size_t width, size_t height) {
    // Shared memory for histogram accumulation to minimize global memory access
    __shared__ float tempCDF[1024];
    
    // Initialize shared memory for each thread
    tempCDF[threadIdx.x] = static_cast<float>(histo[threadIdx.x]);
    __syncthreads();

    // Inclusive scan to accumulate values in shared memory
    for (int offset = 1; offset < blockDim.x; offset *= 2) {
        float val = 0.0f;
        if (threadIdx.x >= offset) {
            val = tempCDF[threadIdx.x - offset];
        }
        __syncthreads();
        tempCDF[threadIdx.x] += val;
        __syncthreads();
    }

    // Normalize and write result back to global memory
    cdf[threadIdx.x] = tempCDF[threadIdx.x] * (1.0f / static_cast<float>(width * height));
}