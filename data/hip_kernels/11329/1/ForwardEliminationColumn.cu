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
int _size			= *size;
int _row			= *row;
int _stride			= *stride;
int _pivotRow		= *pivotRow;
int startColumn		= (blockIdx.x * blockDim.x + threadIdx.x) * _stride;

double pivot		= (double)matrix[_pivotRow * (_size + 1) + _pivotRow];
double belowPivot	= (double)matrix[_row * (_size + 1) + _pivotRow];

double ratio		= belowPivot / pivot;

for (int i = 0; i < _stride; ++i)
{
if (startColumn + i < (_size + 1))
{
matrix[_row * (_size + 1) + startColumn + i] -= (ratio * matrix[_pivotRow * (_size + 1) + startColumn + i]);
__syncthreads();
}
}
}