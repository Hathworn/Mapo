#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void glcm_calculation_45(int *A,int *glcm, const int nx, const int ny,int max){
int ix = threadIdx.x + blockIdx.x* blockDim.x;
int iy = threadIdx.y + blockIdx.y* blockDim.y;
unsigned int idx =iy*nx+ix;
int i;
int k=0;
for(i=1;i<nx;i++){
if(blockIdx.x==i && idx <((i+1)*nx)-1){
k=max*A[idx]+A[idx-(nx-1)];
atomicAdd(&glcm[k],1);
}
}
__syncthreads();
}