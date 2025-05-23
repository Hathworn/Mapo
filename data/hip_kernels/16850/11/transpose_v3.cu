#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void transpose_v3(float* a,float* b, int n){

int tx = threadIdx.x;
int ty = threadIdx.y;

int bx = blockIdx.x;
int by = blockIdx.y;

int i = bx*BX + tx;
int j = by*BY + ty;

__shared__ float tile[BY][BX+1]; //Very slight modification to avoid bank conflict in shared mem

if(i >= n || j >= n) return;

tile[ty][tx] = a[j*n+i];

__syncthreads();

i = by*BY + tx;
j = bx*BX + ty;

b[j*n+i] = tile[tx][ty];

}