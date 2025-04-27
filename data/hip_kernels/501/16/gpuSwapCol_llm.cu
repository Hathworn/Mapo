#include "hip/hip_runtime.h"
#include "includes.h"
#define NTHREADS 512

__global__ void gpuSwapCol(int rows, float * dArray, int coli, int * dColj, int * dPivot)
{
    int rowIndex = blockIdx.x * blockDim.x + threadIdx.x;

    // Ensure within bounds
    if(rowIndex >= rows)
        return;

    int colj = coli + (*dColj);
    
    // Pre-calculate memory offsets
    int offsetColi = rowIndex + coli * rows;
    int offsetColj = rowIndex + colj * rows;

    // Swap elements
    float fholder = dArray[offsetColi];
    dArray[offsetColi] = dArray[offsetColj];
    dArray[offsetColj] = fholder;

    // Swap pivot entries using a single thread
    if((blockIdx.x == 0) && (threadIdx.x == 0)) {
        int iholder = dPivot[coli];
        dPivot[coli] = dPivot[colj];
        dPivot[colj] = iholder;
    }
}