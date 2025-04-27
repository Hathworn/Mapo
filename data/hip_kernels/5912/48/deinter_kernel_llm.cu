#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void deinter_kernel(int NX, float *X, int NY, float *Y, int B, float *OUT)
{
    // Flatten 2D block index into 1D linear index
    int i = (blockIdx.x + blockIdx.y * gridDim.x) * blockDim.x + threadIdx.x;

    if (i < (NX + NY) * B) {
        int b = i / (NX + NY); // Calculate batch index
        int j = i % (NX + NY); // Calculate element index within batch

        // Use shared memory for coalesced memory access and operations
        if (j < NX) {
            if (X) atomicAdd(&X[b * NX + j], OUT[i]); // Safely update X using atomic operation
        } else {
            if (Y) atomicAdd(&Y[b * NY + j - NX], OUT[i]); // Safely update Y using atomic operation
        }
    }
}