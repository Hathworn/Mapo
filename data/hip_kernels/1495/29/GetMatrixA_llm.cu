#include "hip/hip_runtime.h"
#include "includes.h"
__global__ static void GetMatrixA(int* OCTData, float* MatrixA, int NumPolynomial, int OneDataSize)
{
    // Simple thread index computation
    int id = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Early exit on ID exceeding boundaries
    if (id >= (NumPolynomial + 1) * (NumPolynomial + 1))
    {
        printf("Polynomial Fitting error!\n");
        return;
    }
    
    // Compute row and column indices
    int rowIndex = id % (NumPolynomial + 1);
    int colsIndex = id / (NumPolynomial + 1);
    
    // Reduce duplicate computation in loop
    float value = 0;
    float exponentRow = NumPolynomial - rowIndex;
    float exponentCol = NumPolynomial - colsIndex;
    
    for (int i = 0; i < OneDataSize; i++)
    {
        // Compute values once per iteration to avoid redundant operations
        float factor = (float)i / OneDataSize;
        value += pow(factor, exponentRow) * pow(factor, exponentCol);
    }
    
    // Store result in Matrix A
    MatrixA[id] = value;
}