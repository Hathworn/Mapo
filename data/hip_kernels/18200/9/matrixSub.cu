#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void matrixSub(double *a, double *b, double *c, int cr, int cc){

long x = blockIdx.x * blockDim.x + threadIdx.x; // col
long y = blockIdx.y * blockDim.y + threadIdx.y; // row

if(x < cc && y < cr){
c[y * cc + x] = a[y * cc + x] - b[y * cc + x];
}

}