#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void reduce(float *gdata, float *out, size_t n){
__shared__ float sdata[BLOCK_SIZE];
int tid = threadIdx.x;
sdata[tid] = 0.0f;
size_t idx = threadIdx.x+blockDim.x*blockIdx.x;

while (idx < n) {  // grid stride loop to load data
sdata[tid] += gdata[idx];
idx += gridDim.x*blockDim.x;
}

for (unsigned int s=blockDim.x/2; s>0; s>>=1) {
__syncthreads();
if (tid < s)  // parallel sweep reduction
sdata[tid] += sdata[tid + s];
}
if (tid == 0) out[blockIdx.x] = sdata[0];
}