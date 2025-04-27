#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void inter_kernel(int NX, float *X, int NY, float *Y, int B, float *OUT)
{
    // Calculate the global index for the current thread
    int i = blockIdx.x * blockDim.x + threadIdx.x + blockIdx.y * blockDim.x * gridDim.x;
    
    // Operate only within valid range
    if (i < (NX + NY) * B) {
        int b = i / (NX + NY);
        int j = i % (NX + NY);
        
        // Use conditional operator for concise array access
        OUT[i] = (j < NX) ? X[b * NX + j] : Y[b * NY + j - NX];
    }
}