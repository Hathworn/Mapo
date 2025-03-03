#include "hip/hip_runtime.h"
#include "includes.h"


#define _SIZE_ 1000000

/*
hipError_t addWithCuda(int *c, const int *a, const int *b, unsigned int size);

*/


__global__ void addKernel(int *c, const int *a, const int *b)
{
int i = threadIdx.x;
c[i] = a[i] + b[i];
}