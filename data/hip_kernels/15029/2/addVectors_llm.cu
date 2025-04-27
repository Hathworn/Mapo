#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void addVectors(const int entries, const float *a, const float *b, float *ab) {
    // Calculate global index using blockDim
    int index = blockDim.x * blockIdx.x + threadIdx.x; 

    // Ensure the index is within bounds
    if (index < entries) {
        ab[index] = a[index] + b[index];
    }
}