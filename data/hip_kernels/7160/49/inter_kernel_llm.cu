#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void inter_kernel(int NX, float *X, int NY, float *Y, int B, float *OUT)
{
    // Calculate the unique index across grid and block dimensions
    int i = blockIdx.x * blockDim.x + threadIdx.x + blockIdx.y * gridDim.x * blockDim.x;

    // Only perform computations if i is within relevant bounds
    if(i < (NX + NY) * B) {
        int b = i / (NX + NY); // Batch computation by dividing i by (NX + NY)
        int j = i % (NX + NY); // Determine if we're within X or Y portion

        // Ternary operator for assignment based on index position j
        OUT[i] = (j < NX) ? X[b * NX + j] : Y[b * NY + j - NX];
    }
}