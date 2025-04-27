#include "hip/hip_runtime.h"
#include "includes.h"
#define NTHREADS 512

__global__ void gpuSwapCol(int rows, float * dArray, int coli, int * dColj, int * dPivot)
{
    int rowIndex = blockIdx.x * blockDim.x + threadIdx.x;

    // Use shared memory for frequently accessed read-write variables (optimization)
    __shared__ int colj;
    __shared__ int iholder;

    if(threadIdx.x == 0) {
        colj = coli + (*dColj);
    }
    __syncthreads();

    if(rowIndex < rows) {  // Simplified condition
        float fholder = dArray[rowIndex + coli * rows];
        dArray[rowIndex + coli * rows] = dArray[rowIndex + colj * rows];
        dArray[rowIndex + colj * rows] = fholder;
    }

    // Synchronize here to ensure all threads are done before handling pivot
    __syncthreads();

    if(blockIdx.x == 0 && threadIdx.x == 0) {
        iholder = dPivot[coli];
        dPivot[coli] = dPivot[colj];
        dPivot[colj] = iholder;
    }
}