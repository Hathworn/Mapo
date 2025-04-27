#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void somme(int taille, float *a, float *b, float *c) {
    // Efficient index calculation
    int index = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Early exit if index is out of bounds
    if (index < taille) {
        c[index] = a[index] + b[index];
    }
}