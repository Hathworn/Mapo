#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void inter_kernel(int NX, float *X, int NY, float *Y, int B, float *OUT)
{
    // Calculate global index of the thread within the grid
    int i = blockIdx.x * blockDim.x + threadIdx.x; 
    // Total number of elements in the output array
    int total_elements = (NX + NY) * B;

    // Loop over multiple elements if the grid size is small
    for(int index = i; index < total_elements; index += blockDim.x * gridDim.x) {
        int b = index / (NX + NY); // Determine block number in batch
        int j = index % (NX + NY); // Determine local index within block

        // Copy from X array if within NX, else from Y array
        OUT[index] = (j < NX) ? X[b * NX + j] : Y[b * NY + j - NX];
    }
}