#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void inter_kernel(int NX, float *X, int NY, float *Y, int B, float *out)
{
    // Calculate a unique global thread index
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Calculate the total number of elements
    int total_elements = (NX + NY) * B;
    
    // Ensure thread index is within bounds
    if (i < total_elements) {
        int b = i / (NX + NY); // Determine the batch index
        int j = i % (NX + NY); // Determine the local index within the batch

        // Conditionally load data from X or Y based on index
        if (j < NX) {
            out[i] = X[b * NX + j]; // Load from array X
        } else {
            out[i] = Y[b * NY + (j - NX)]; // Load from array Y
        }
    }
}