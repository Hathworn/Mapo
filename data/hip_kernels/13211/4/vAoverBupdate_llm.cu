#include "hip/hip_runtime.h"
#include "includes.h"
extern "C"
{
}

__global__ void vAoverBupdate(const int lengthA, const double alpha, const double *gradc, const double *a, const double *b, double *gradn)
{
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    
    if (i < lengthA)
    {
        double bi = b[i];  // Load b[i] once and reuse
        double term = alpha * gradc[i] * a[i] / (bi * bi);  // Explicitly compute term

        gradn[i] -= term;  // Apply update
    }
}