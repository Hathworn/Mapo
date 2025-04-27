#include "hip/hip_runtime.h"
#include "includes.h"

#define uint unsigned int

#ifdef __INTELLISENSE__
void __syncthreads();
#endif // __INTELLISENSE__

void InitCPUData(double** matrices, int size);
void FillHostMatrix(double** matrices, int size);
hipError_t InitGPUData(double** matrices, int **dSize, int size, int **dStride, int stride);
hipError_t CudaMemcpyMatrix(double** matrices, int size, hipMemcpyKind flag);

void ForwardElimination(double* matrix, int size);
void BackwardSubstitute(double* matrix, int size);

__global__ void ForwardEliminationColumn(double* matrix, int* size, int* row, int* stride, int* pivotRow)
{
    int _size = *size;
    int _row = *row;
    int _stride = *stride;
    int _pivotRow = *pivotRow;
    int startColumn = (blockIdx.x * blockDim.x + threadIdx.x) * _stride;

    double pivot = (double)matrix[_pivotRow * (_size + 1) + _pivotRow];
    double belowPivot = (double)matrix[_row * (_size + 1) + _pivotRow];
    double ratio = belowPivot / pivot;

    // Optimize memory access by reducing redundant calculations
    int rowOffset = _row * (_size + 1);
    int pivotRowOffset = _pivotRow * (_size + 1);

    for (int i = 0; i < _stride; ++i)
    {
        int colIndex = startColumn + i;
        if (colIndex < (_size + 1))
        {
            // Use precomputed row offset to access matrix elements
            matrix[rowOffset + colIndex] -= ratio * matrix[pivotRowOffset + colIndex];
        }
    }
}