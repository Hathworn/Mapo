#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void deinter_kernel(int NX, float *X, int NY, float *Y, int B, float *out)
{
int i = (blockIdx.x + blockIdx.y*gridDim.x) * blockDim.x + threadIdx.x;
if(i < (NX+NY)*B){
int b = i / (NX+NY);
int j = i % (NX+NY);
if (j < NX){
if (X) {
X[b*NX + j] += out[i];
}
} else {
if (Y) {
Y[b*NY + j - NX] += out[i];
}
}
}
}