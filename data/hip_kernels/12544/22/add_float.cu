#include "hip/hip_runtime.h"
#include "includes.h"
extern "C"

__global__ void add_float(int n, float *a, float *b, float *sum) {
int i = blockIdx.x * blockDim.x + threadIdx.x;
if (i < n) {
sum[i] = a[i] + b[i];
}

}