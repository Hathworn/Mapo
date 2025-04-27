#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void inter_kernel(int NX, float *X, int NY, float *Y, int B, float *OUT)
{
    int i = blockIdx.x * blockDim.x + threadIdx.x + blockDim.x * gridDim.x * blockIdx.y;
    
    // Check boundary condition only once for efficiency
    if(i >= (NX + NY) * B) return;

    int b = i / (NX + NY);
    int j = i % (NX + NY);

    // Use a conditional operator for concise code
    OUT[i] = (j < NX) ? X[b * NX + j] : Y[b * NY + j - NX];
}