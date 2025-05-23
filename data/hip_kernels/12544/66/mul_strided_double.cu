#include "hip/hip_runtime.h"
#include "includes.h"
extern "C"



__global__ void mul_strided_double(int n,int xOffset,int yOffset, double *dx, double *dy,int incx,int incy,double *result) {
for (int i = blockIdx.x * blockDim.x + threadIdx.x; i < n; i += blockDim.x * gridDim.x) {
if(i >= xOffset && i >= yOffset &&  i % incx == 0 && i % incy == 0)
result[i] = dy[i] * dx[i];
}

}