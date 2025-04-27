#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void deinter_kernel(int NX, float *X, int NY, float *Y, int B, float *OUT)
{
    // Calculate the global index
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Ensure we only process valid indices
    if (i < (NX + NY) * B) {
        int b = i / (NX + NY);  // Batch index
        int j = i % (NX + NY);  // Element index
        
        // Update X or Y based on the element index
        if (j < NX) {
            if (X) atomicAdd(&X[b * NX + j], OUT[i]); // Use atomic to prevent race conditions
        } else {
            if (Y) atomicAdd(&Y[b * NY + j - NX], OUT[i]); // Use atomic to prevent race conditions
        }
    }
}