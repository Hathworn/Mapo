#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void shared4R24ops(float *A, float *B, float *C, const int N)
{
__shared__ float Smem[512];

int i = blockIdx.x * blockDim.x + threadIdx.x;

if (i < N)
Smem[threadIdx.x] = A[i];
__syncthreads();

float x;
if (i < N) {
x = (A[i]/3 + 17*B[i] - A[i]*A[i] + 3*B[i] - 4*A[i]*B[i] + B[i]*B[i]*7) / (A[i]/9 + 13*B[i]) ;
C[i] = x- 8 +Smem[(threadIdx.x+1)%512]*A[i] + 4*Smem[(threadIdx.x+2)%512]+3*B[i]*Smem[(threadIdx.x+3)%512]+A[i]*Smem[(threadIdx.x+4)%512];
}
}