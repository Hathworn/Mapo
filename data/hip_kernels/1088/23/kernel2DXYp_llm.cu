#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kernel2DXYp(double* dataOutput, double* dataInput, double* boundaryTop, double* boundaryBottom, const double* weights, const int numSten, const int numStenHoriz, const int numStenLeft, const int numStenRight, const int numStenVert, const int numStenTop, const int numStenBottom, const int nxLocal, const int nyLocal, const int BLOCK_X, const int BLOCK_Y, const int nx, const int nyTile)
{
    extern __shared__ double sharedMemory[];

    double* arrayLocal = sharedMemory;
    double* weightsLocal = &arrayLocal[nxLocal * nyLocal];

    // Copy weights to shared memory
    #pragma unroll
    for (int k = 0; k < numSten; k++)
    {
        weightsLocal[k] = weights[k];
    }

    int globalIdx = blockDim.x * blockIdx.x + threadIdx.x;
    int globalIdy = blockDim.y * blockIdx.y + threadIdx.y;

    int localIdx = threadIdx.x + numStenLeft;
    int localIdy = threadIdx.y + numStenTop;

    double sum = 0.0;

    // Load data input to shared memory
    arrayLocal[localIdy * nxLocal + localIdx] = dataInput[globalIdy * nx + globalIdx];

    // Efficient boundary handling using shared memory
    if (threadIdx.x < numStenLeft)
    {
        int boundaryIdxLeft = (blockIdx.x == 0) ? nx - numStenLeft + threadIdx.x : globalIdx - numStenLeft;
        arrayLocal[localIdy * nxLocal + threadIdx.x] = dataInput[globalIdy * nx + boundaryIdxLeft];
    }

    if (threadIdx.x < numStenRight)
    {
        int boundaryIdxRight = (blockIdx.x == nx / BLOCK_X - 1) ? threadIdx.x : globalIdx + BLOCK_X;
        arrayLocal[localIdy * nxLocal + localIdx + BLOCK_X] = dataInput[globalIdy * nx + boundaryIdxRight];
    }

    if (threadIdx.y < numStenTop)
    {
        int boundaryIdxTop = (blockIdx.y == 0) ? threadIdx.y : globalIdy - numStenTop;
        arrayLocal[threadIdx.y * nxLocal + localIdx] = (blockIdx.y == 0) ? boundaryTop[threadIdx.y * nx + globalIdx] : dataInput[boundaryIdxTop * nx + globalIdx];
    }

    if (threadIdx.y < numStenBottom)
    {
        int boundaryIdxBottom = (blockIdx.y == nyTile / BLOCK_Y - 1) ? threadIdx.y : globalIdy + BLOCK_Y;
        arrayLocal[localIdy + BLOCK_Y * nxLocal + localIdx] = (blockIdx.y == nyTile / BLOCK_Y - 1) ? boundaryBottom[threadIdx.y * nx + globalIdx] : dataInput[boundaryIdxBottom * nx + globalIdx];
    }

    __syncthreads();

    int stenSet = (localIdy - numStenTop) * nxLocal + (localIdx - numStenLeft);
    int weight = 0;

    #pragma unroll
    for (int j = 0; j < numStenVert; j++)
    {
        int temp = j * nxLocal;
        #pragma unroll
        for (int i = 0; i < numStenHoriz; i++)
        {
            sum += weightsLocal[weight] * arrayLocal[stenSet + temp + i];
            weight++;
        }
    }

    dataOutput[globalIdy * nx + globalIdx] = sum;
}