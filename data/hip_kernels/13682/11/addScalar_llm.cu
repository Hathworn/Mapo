#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void addScalar(int a, int b, int* ptrC)
{
    // Only execute the addition and print if it's the first thread
    if (threadIdx.x == 0 && blockIdx.x == 0)
    {
        *ptrC = a + b;
        printf("[GPU] %d + %d = %d", a, b, *ptrC);
    }
}