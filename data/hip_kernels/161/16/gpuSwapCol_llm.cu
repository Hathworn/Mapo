#include "hip/hip_runtime.h"
#include "includes.h"
#define NTHREADS 512

__global__ void gpuSwapCol(int rows, float * dArray, int coli, int * dColj, int * dPivot)
{
    int rowIndex = blockIdx.x * blockDim.x + threadIdx.x;

    if(rowIndex < rows) { // Simplified boundary check
        int colj = coli + (*dColj); // Compute target column index
        float fholder = dArray[rowIndex+coli*rows]; // Use temporary for swap
        dArray[rowIndex+coli*rows] = dArray[rowIndex+colj*rows];
        dArray[rowIndex+colj*rows] = fholder;
    }

    // Handle pivot swapping using thread 0 in block 0
    if(rowIndex == 0) {
        int iholder = dPivot[coli];
        dPivot[coli] = dPivot[colj];
        dPivot[colj] = iholder;
    }
}