#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void kernelA(int n, float *x, float *y) {
int index = blockIdx.x * blockDim.x + threadIdx.x;
int stride = blockDim.x * gridDim.x;
for (int i = index; i < n; i += stride) {
if (x[i] > y[i]) {
for (int j = 0; j < n / CONST; j++)
y[i] = x[j] + y[j];
} else {
for (int j = 0; j < n / CONST; j++)
y[i] = x[j] / y[j];
}
}
}