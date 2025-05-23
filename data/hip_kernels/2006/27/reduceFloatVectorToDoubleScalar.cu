#include "hip/hip_runtime.h"
#include "includes.h"
extern "C"

extern "C"

extern "C"

extern "C"

extern "C"

extern "C"

extern "C"

extern "C"

extern "C"

extern "C"

extern "C"

extern "C"

extern "C"

extern "C"

extern "C"


extern "C"

extern "C"

extern "C"

extern "C"

extern "C"

extern "C"

extern "C"

extern "C"

extern "C"

extern "C"

extern "C"

extern "C"

extern "C"

/*
* Perfom a reduction from data of length 'size' to result, where length of result will be 'number of blocks'.
*/
extern "C"
__global__ void reduceFloatVectorToDoubleScalar(int size, void *data, double *result) {
float *fdata = (float*) data;

extern __shared__ double sdata[];
double* s2data = sdata + blockDim.x;
double* cdata = s2data + blockDim.x;

// perform first level of reduction,
// reading from global memory, writing to shared memory unsigned int tid = threadIdx.x;
unsigned int tid = threadIdx.x;
unsigned int i = blockIdx.x*(blockDim.x*2) + threadIdx.x;

sdata[tid] = (double)(i < size ? fdata[i] : 0) + (double)(i+blockDim.x < size ? fdata[i+blockDim.x] : 0);
cdata[tid] = sdata[tid] - (double)(i < size ? fdata[i] : 0) - (double)(i+blockDim.x < size ? fdata[i+blockDim.x] : 0);
__syncthreads();

// do reduction in shared mem
for (unsigned int s=blockDim.x/2; s>0; s>>=1) {
if (tid < s) {
s2data[tid] = sdata[tid] + sdata[tid + s] - cdata[tid] - cdata[tid+s];
cdata[tid] = (s2data[tid] - sdata[tid]) - sdata[tid + s];
sdata[tid] = s2data[tid];
}
__syncthreads();
}

// write result for this block to global mem
if (tid == 0) result[blockIdx.x] = sdata[0];
}