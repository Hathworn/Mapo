```c
#include "hip/hip_runtime.h"
#include "includes.h"

// Kernel to compute MatrixA
__global__ static void GetMatrixA(int* OCTData, float* MatrixA, int NumPolynomial, int OneDataSize)
{
    int id = blockIdx.x * blockDim.x + threadIdx.x;

    // Boundary check
    if (id >= (NumPolynomial + 1) * (NumPolynomial + 1))
    {
        printf("Polynomial fitting issue!\n");
        return;
    }

    // Calculate indices
    int rowIndex = id % (NumPolynomial + 1);
    int colsIndex = id / (NumPolynomial + 1);

    // Accumulate values
    float value = 0.0f;
    float FirstValue, SecondValue;
    float polyRow = NumPolynomial - rowIndex;
    float polyCol = NumPolynomial - colsIndex;
    
    // Unroll loop for performance improvement
    for (int i = 0; i < OneDataSize; i += 4)
    {
        FirstValue = SecondValue = (float)i / OneDataSize;
        value += powf(FirstValue, polyRow) * powf(SecondValue, polyCol);
        
        if (i + 1 < OneDataSize)
        {
            FirstValue = SecondValue = (float)(i + 1) / OneDataSize;
            value += powf(FirstValue, polyRow) * powf(SecondValue, polyCol);
        }
        
        if (i + 2 < OneDataSize)
        {
            FirstValue = SecondValue = (float)(i + 2) / OneDataSize;
            value += powf(FirstValue, polyRow) * powf(SecondValue, polyCol);
        }
        
        if (i + 3 < OneDataSize)
        {
            FirstValue = SecondValue = (float)(i + 3) / OneDataSize;
            value += powf(FirstValue, polyRow) * powf(SecondValue, polyCol);
        }
    }
    
    MatrixA[id] = value;
}