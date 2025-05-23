#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void permuteWalkers ( const int dim, const int nwl, const int *kr, const float *xxC, float *xxCP ) {
int i = threadIdx.x + blockDim.x * blockIdx.x;
int j = threadIdx.y + blockDim.y * blockIdx.y;
int t = i + j * dim;
int p = i + kr[j] * dim;
if ( i < dim && j < nwl ) {
xxCP[t] = xxC[p];
}
}