#include "hip/hip_runtime.h"
#include "includes.h"

#define tileSize 32

//function for data initialization
void initialization(double *M, double *N, int arow, int acol, int brow, int bcol);
//(for Debugging) prints out the input data
void printInput(double *M, double *N, int arow, int acol, int brow, int bcol);
//(for Debugging) prints out the output data
void printOutput(double *P_C, double *P_G, int arow, int bcol);

// Optimized GPU kernel
__global__ void matrixTransposeSqr(double *P, double *M, int width, int height)
{
    // Use shared memory to optimize memory access
    __shared__ double tile[tileSize][tileSize + 1]; // Avoid bank conflicts

    // Calculate indices
    unsigned int xIdx = blockDim.x * blockIdx.x + threadIdx.x;
    unsigned int yIdx = blockDim.y * blockIdx.y + threadIdx.y;

    // Load data into shared memory
    if (xIdx < width && yIdx < height)
    {
        unsigned int inIdx = xIdx + width * yIdx;
        tile[threadIdx.y][threadIdx.x] = M[inIdx];
    }

    __syncthreads();

    // Transpose and store data back to global memory
    xIdx = blockDim.y * blockIdx.y + threadIdx.x;
    yIdx = blockDim.x * blockIdx.x + threadIdx.y;

    if (xIdx < height && yIdx < width)
    {
        unsigned int outIdx = xIdx + height * yIdx;
        P[outIdx] = tile[threadIdx.x][threadIdx.y];
    }
}