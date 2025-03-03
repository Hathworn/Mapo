#include "hip/hip_runtime.h"
#include "includes.h"



//hipError_t addWithCuda(int *c, const int *a, const int *b, size_t size);

__global__ void kernel_example(int *c, const int *a, const int *b)
{
int i = threadIdx.x;
c[i] = a[i] + b[i];
}