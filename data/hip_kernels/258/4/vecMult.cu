#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void vecMult(float* a,float* b,float* c,const int N){
const int i = blockIdx.x*blockDim.x + threadIdx.x;
if(i<N)
c[i] = a[i]*b[i];
}