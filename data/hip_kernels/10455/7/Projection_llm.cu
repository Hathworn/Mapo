#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void Projection(float2 *__restrict__ newVel, float2 *__restrict__ gradPressure, unsigned int simWidth)
{
    unsigned int x = blockIdx.x * blockDim.x + threadIdx.x;
    unsigned int y = blockIdx.y * blockDim.y + threadIdx.y;
    unsigned int index = y * simWidth + x; // Precompute index for reusability

    // Use shared memory for coalesced global memory access (optional, if beneficial)
    extern __shared__ float2 sharedMem[];
    sharedMem[threadIdx.y * blockDim.x + threadIdx.x] = gradPressure[index];
    __syncthreads();

    // Compute newVel with optimized global memory access
    newVel[index].x -= sharedMem[threadIdx.y * blockDim.x + threadIdx.x].x;
    newVel[index].y -= sharedMem[threadIdx.y * blockDim.x + threadIdx.x].y;
}