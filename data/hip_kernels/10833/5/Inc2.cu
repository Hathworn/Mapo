#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void Inc2(float *Ad, float *Bd){
// CHECK: int tx = hipThreadIdx_x + hipBlockIdx_x * hipBlockDim_x;
int tx = threadIdx.x + blockIdx.x * blockDim.x;
if(tx < 1024){
for(int i=0;i<ITER;i++){
Ad[tx] = Ad[tx] + 1.0f;
for(int j=0;j<256;j++){
Bd[tx] = Ad[tx];
}
}
}
}