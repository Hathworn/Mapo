```c
#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void inter_kernel(int NX, float *X, int NY, float *Y, int B, float *OUT)
{
    int i = blockIdx.x * blockDim.x + threadIdx.x; // Compute global index optimally
    int gridStride = gridDim.x * blockDim.x; // Add grid stride for loop optimization
    for (; i < (NX+NY)*B; i += gridStride) { // Use stride loop for better performance
        int b = i / (NX+NY);
        int j = i % (NX+NY);
        OUT[i] = (j < NX) ? X[b*NX + j] : Y[b*NY + j - NX]; // Use ternary operator for condition check
    }
}