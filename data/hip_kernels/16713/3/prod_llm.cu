#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void prod(int taille, float* __restrict__ a, float b, float* __restrict__ c) {
    int index = threadIdx.x + blockDim.x * blockIdx.x;
    
    // Ensure index remains within bounds
    if (index < taille) {
        c[index] = a[index] * b;
    }
}