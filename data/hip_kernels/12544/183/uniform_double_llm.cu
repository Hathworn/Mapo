#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void uniform_double(int n, double lower, double upper, double *result) {
    int i = blockIdx.x * blockDim.x + threadIdx.x;  // Simplified index calculation
    int totalThreads = gridDim.x * blockDim.x;

    while (i < n) {  // Use while instead of for-loop for clarity
        double u = result[i];
        result[i] = u * upper + (1 - u) * lower;
        i += totalThreads;  // Efficient index increment
    }
}