#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void variance_kernel(float *x, float *mean, int batch, int filters, int spatial, float *variance)
{
float scale = 1.f/(batch * spatial - 1);
int j,k;
int i = (blockIdx.x + blockIdx.y*gridDim.x) * blockDim.x + threadIdx.x;
if (i >= filters) return;
variance[i] = 0;
for(j = 0; j < batch; ++j){
for(k = 0; k < spatial; ++k){
int index = j*filters*spatial + i*spatial + k;
variance[i] += powf((x[index] - mean[i]), 2);
}
}
variance[i] *= scale;
}