#include "hip/hip_runtime.h"
#include "includes.h"

#define tileSize 32

//function for data initialization
void initialization( double *M,  double *N, int arow, int acol, int brow, int bcol);
//(for Debugging) prints out the input data
void printInput( double *M,  double *N, int arow, int acol, int brow,  int bcol);
//(for Debugging) prints out the output data
void printOutput( double *P_C,  double *P_G, int arow, int bcol);

//GPU kernels

__global__ void matrixTransposeSqr(double *P, double* M, int width, int height)
{
    unsigned int xIdx = blockDim.x * blockIdx.x + threadIdx.x;
    unsigned int yIdx = blockDim.y * blockIdx.y + threadIdx.y;

    // Use shared memory tiles for better memory coalescing
    __shared__ double tile[tileSize][tileSize];

    // Check for bounds and load data into shared memory
    if (xIdx < width && yIdx < height) {
        unsigned int inIdx = xIdx + width * yIdx;
        tile[threadIdx.y][threadIdx.x] = M[inIdx];
    }
    __syncthreads();

    // Transpose using shared memory
    xIdx = blockDim.y * blockIdx.y + threadIdx.x;
    yIdx = blockDim.x * blockIdx.x + threadIdx.y;

    if (xIdx < height && yIdx < width) {
        unsigned int outIdx = yIdx + height * xIdx;
        P[outIdx] = tile[threadIdx.x][threadIdx.y];
    }
}