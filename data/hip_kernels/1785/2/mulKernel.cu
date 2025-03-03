#include "hip/hip_runtime.h"
#include "includes.h"



enum ComputeMode { ADD, SUB, MUL, DIV };
hipError_t computeWithCuda(int *c, const int *a, const int *b, unsigned int size, ComputeMode mode);

__global__ void mulKernel(float* c, const float* a, const float* b)
{
int i = threadIdx.x;
c[i] = a[i] * b[i];
}