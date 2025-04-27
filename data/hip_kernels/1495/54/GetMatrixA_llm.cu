#include "hip/hip_runtime.h"
#include "includes.h"

__global__ static void GetMatrixA(int* OCTData, float* MatrixA, int NumPolynomial, int OneDataSize)
{
    // Calculate global thread index
    int id = blockIdx.x * blockDim.x + threadIdx.x;

    // Exit if index exceeds expected bounds
    if (id >= (NumPolynomial + 1) * (NumPolynomial + 1))
    {
        printf("Polynomial Fitting issue!\n");
        return;
    }

    // Calculate row and column indices
    int rowIndex = id % (NumPolynomial + 1);
    int colsIndex = id / (NumPolynomial + 1);

    // Initialize accumulated value
    float value = 0.0f;

    // Precompute powers of index for performance
    int powerRow = NumPolynomial - rowIndex;
    int powerCol = NumPolynomial - colsIndex;

    // Sum across data points
    for (int i = 0; i < OneDataSize; i++)
    {
        // Directly use precomputed values to avoid repetitive work
        float normalized = (float)i / OneDataSize;
        float powerResult = pow(normalized, powerRow) * pow(normalized, powerCol);
        value += powerResult;
    }

    // Store result in MatrixA
    MatrixA[id] = value;
}