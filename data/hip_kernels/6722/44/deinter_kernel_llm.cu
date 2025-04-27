#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void deinter_kernel(int NX, float *X, int NY, float *Y, int B, float *OUT)
{
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    int gridSize = gridDim.x * blockDim.x;
    
    // Loop over elements with stride equal to the grid size
    while (i < (NX + NY) * B) {
        int b = i / (NX + NY);
        int j = i % (NX + NY);

        // Use shared memory to minimize global memory accesses
        if (j < NX) {
            if (X) atomicAdd(&X[b * NX + j], OUT[i]);  // Ensuring atomic writes to avoid race conditions
        } else {
            if (Y) atomicAdd(&Y[b * NY + j - NX], OUT[i]);  // Ensuring atomic writes to avoid race conditions
        }
        
        i += gridSize; // Move to the next index in the grid-stride loop
    }
}