#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kernel2DXp (double* dataOutput, double* dataInput, const double* weights, const int numSten, const int numStenLeft, const int numStenRight, const int nxLocal, const int nyLocal, const int BLOCK_X, const int nx)
{
    extern __shared__ int memory[];

    double* arrayLocal = (double*)&memory;
    double* weightsLocal = (double*)&arrayLocal[nxLocal * nyLocal];

    // Move the weights into shared memory
    #pragma unroll
    for (int k = 0; k < numSten; k++)
    {
        weightsLocal[k] = weights[k];
    }

    // True matrix index
    int globalIdx = blockDim.x * blockIdx.x + threadIdx.x;
    int globalIdy = blockDim.y * blockIdx.y + threadIdx.y;

    // Local matrix index
    int localIdx = threadIdx.x + numStenLeft;
    int localIdy = threadIdx.y;

    double sum = 0.0;

    // Load data to shared memory with proper boundary checks
    if (globalIdx < nx && globalIdy < nx / BLOCK_X) {
        // Interior
        arrayLocal[localIdy * nxLocal + localIdx] = dataInput[globalIdy * nx + globalIdx];

        if (blockIdx.x != 0 && threadIdx.x < numStenLeft) {
            arrayLocal[localIdy * nxLocal + threadIdx.x] = dataInput[globalIdy * nx + (globalIdx - numStenLeft)];
        }

        if (blockIdx.x != nx / BLOCK_X - 1 && threadIdx.x < numStenRight) {
            arrayLocal[localIdy * nxLocal + (localIdx + BLOCK_X)] = dataInput[globalIdy * nx + globalIdx + BLOCK_X];
        }

        __syncthreads();

        // Compute the stencil
        int stenSet = localIdy * nxLocal + threadIdx.x;
        #pragma unroll
        for (int k = 0; k < numSten; k++)
        {
            sum += weightsLocal[k] * arrayLocal[stenSet + k];
        }

        // Copy results to global memory
        if (globalIdx < nx && globalIdy < nx / BLOCK_X) {
            dataOutput[globalIdy * nx + globalIdx] = sum;
        }
    }
}