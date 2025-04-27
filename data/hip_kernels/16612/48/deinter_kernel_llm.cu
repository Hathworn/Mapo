#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void deinter_kernel(int NX, float *X, int NY, float *Y, int B, float *OUT)
{
    // Calculate global index
    int i = blockIdx.x * blockDim.x + threadIdx.x; 
    
    // Exit if index is out of bounds
    if (i >= (NX + NY) * B) return;
    
    // Calculate batch and offset indices
    int b = i / (NX + NY);
    int j = i % (NX + NY);

    // Atomic addition for handling potential race conditions
    if (j < NX) {
        if (X) atomicAdd(&X[b * NX + j], OUT[i]);
    } else {
        if (Y) atomicAdd(&Y[b * NY + j - NX], OUT[i]);
    }
}