#include "hip/hip_runtime.h"
#include "includes.h"
extern "C"
{
}
__global__ void vdivupdate(const int lengthA, const double alpha, const double *a, const double *b, double *c)
{
int i = threadIdx.x + blockIdx.x * blockDim.x;
if (i<lengthA)
{
c[i] += alpha*a[i] / b[i];
}
}