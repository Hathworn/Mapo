#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void add(int n, float *x, float *y) {
for (int i = 0; i < n; ++i) {
y[i] = x[i] + y[i];
}
}