#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void deinter_kernel(int NX, float *X, int NY, float *Y, int B, float *OUT)
{
    // Calculate the global index for the thread
    int i = (blockIdx.x + blockIdx.y * gridDim.x) * blockDim.x + threadIdx.x;

    if (i < (NX + NY) * B)
    {
        // Calculate batch index and local index
        int b = i / (NX + NY);
        int j = i % (NX + NY);

        // Avoid repeated memory accesses
        float *out_val = &OUT[i]; 

        // Process X array
        if (j < NX)
        {
            if (X) atomicAdd(&X[b * NX + j], *out_val); // Use atomicAdd for concurrent updates
        }
        else // Process Y array
        {
            if (Y) atomicAdd(&Y[b * NY + j - NX], *out_val); // Use atomicAdd for concurrent updates
        }
    }
}