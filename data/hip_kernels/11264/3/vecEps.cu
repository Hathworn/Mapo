#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void vecEps(float* a,const int N){
const int i = gridDim.x*blockDim.x*blockIdx.y +  blockIdx.x*blockDim.x + threadIdx.x;

if(a[i] < EPS && i < N)
a[i] = EPS;
}