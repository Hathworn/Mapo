#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void _adagrad32(int n, double eps, float *dw2, float *dw) {
int i = threadIdx.x + blockIdx.x * blockDim.x;
while (i < n) {
dw2[i] += dw[i] * dw[i];
dw[i] /= sqrt(dw2[i] + eps);
i += blockDim.x * gridDim.x;
}
}