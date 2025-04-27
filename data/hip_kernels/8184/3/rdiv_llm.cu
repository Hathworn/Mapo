#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void rdiv(float * res, const unsigned int * fsum, const float * csum) {
    // Calculate unique global thread index directly
    int idx = blockDim.x * blockIdx.x + threadIdx.x;
    // Check if within bounds to prevent accessing out of bounds memory
    if (idx < N) {
        res[idx] = (float)fsum[idx] / csum[idx];
    }
}