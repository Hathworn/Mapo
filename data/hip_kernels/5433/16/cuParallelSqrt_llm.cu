#include "hip/hip_runtime.h"
#include "includes.h"

// Optimize global kernel for square root computation
__global__ void cuParallelSqrt(float *dist, int width, int k) {
    // Use a single dimension for linear indexing
    unsigned int index = blockIdx.x * blockDim.x + threadIdx.x;
    unsigned int stride = blockDim.x * gridDim.x;  // Calculate the stride for all threads
    unsigned int totalElements = width * k;

    // Loop over all elements in the 1D flattened array with stride
    for (unsigned int i = index; i < totalElements; i += stride) {
        dist[i] = sqrt(dist[i]);
    }
}