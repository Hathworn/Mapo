#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void inter_kernel(int NX, float *X, int NY, float *Y, int B, float *OUT)
{
    int i = blockIdx.x * blockDim.x + threadIdx.x; // Simplify index calculation
    int totalSize = (NX + NY) * B; // Precompute total size
    if(i < totalSize){
        int b = i / (NX+NY); // Compute batch index
        int j = i % (NX+NY); // Compute index within batch
        OUT[i] = (j < NX) ? X[b*NX + j] : Y[b*NY + j - NX]; // Use ternary operator for conditional
    }
}