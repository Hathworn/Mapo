#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kAddScalar(float* a, float alpha, float* dest, unsigned int numEls) {
    // Calculate the global index
    const unsigned int idx = blockIdx.x * blockDim.x + threadIdx.x;

    // Optimize by using a conditional statement to reduce unnecessary iterations
    if (idx < numEls) {
        dest[idx] = a[idx] + alpha;
    }
}