#include "hip/hip_runtime.h"
#include "includes.h"
__device__ inline float stableLogit(float x) {
if(x >= 0) {
float z = expf(-x);
return 1.0 / (1.0 + z);
} else {
float z = expf(x);
return z / (1.0 + z);
}
}
__global__ void gLSTMCellForward(float* out, const float* cell, const float* xW, const float* sU, const float* b, const float* mask, size_t rows, size_t cols) {
for(int bid = 0; bid < rows; bid += gridDim.x) {
int j = bid + blockIdx.x;
if(j < rows) {
float m = !mask || mask[j];

float* rowOut = out + j * cols;
const float* rowCell = cell + j * cols;

const float* xWrow = xW + j * cols * 4;
const float* sUrow = sU + j * cols * 4;

for(int tid = 0; tid < cols; tid += blockDim.x) {
int i = tid + threadIdx.x;
if(i < cols) {
float gf = stableLogit(xWrow[i] + sUrow[i] + b[i]);

int k = i + cols;
float gi = stableLogit(xWrow[k] + sUrow[k] + b[k]);

int l = i + 2 * cols;
float gc = tanhf(xWrow[l] + sUrow[l] + b[l]);

float cout = gf * rowCell[i] + gi * gc;
rowOut[i] = m * cout + (1 - m) * rowCell[i];
}
}
}
}
}