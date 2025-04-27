#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void strided_access(float* a, int s, int max) {
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    int index = idx * s; // Calculate index only once
    if (index < max) { // Change conditional logic for better readability
        a[index] += 1; // Use compound assignment operator
    }
}