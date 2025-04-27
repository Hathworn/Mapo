#include "hip/hip_runtime.h"
#include "includes.h"

using namespace std;

__device__ int getGlobalIdx_2D_2D()
{
    int blockId = blockIdx.x + blockIdx.y * gridDim.x;
    int threadId = blockId * (blockDim.x * blockDim.y)
                 + (threadIdx.y * blockDim.x)
                 + threadIdx.x;
    return threadId;
}

__global__ void matrixSquareElementWiseKernel(float* in, float* out, int n, int m){
    // Calculate unique index for this thread
    int index = blockIdx.y * gridDim.x * blockDim.x * blockDim.y + blockIdx.x * blockDim.x * blockDim.y +
                threadIdx.y * blockDim.x + threadIdx.x;
    
    // Ensure index is within bounds before operation
    if (index < n*m){
        // Perform square operation
        out[index] = in[index] * in[index];
    }
}