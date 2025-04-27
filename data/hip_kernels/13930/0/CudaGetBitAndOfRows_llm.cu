#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void CudaGetBitAndOfRows(unsigned int* table1D, unsigned int* row, int rowSize, int tableRowCount)
{
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    int totalSize = tableRowCount * rowSize;

    // Ensure within bounds and calculate once.
    if (idx < totalSize)
    {
        unsigned int rowValue = row[idx % rowSize]; // Read row element once
        table1D[idx] &= rowValue;                   // Use compound assignment
    }
}