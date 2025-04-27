#include "hip/hip_runtime.h"
#include "includes.h"

__device__ inline float stableSigmoid(float x) {
  if(x >= 0) {
    float z = expf(-x);
    return 1.0 / (1.0 + z);
  } else {
    float z = expf(x);
    return z / (1.0 + z);
  }
}

__global__ void gLSTMOutputBackward(float* outCell, float* outXW, float* outSU, float* outB, const float* cell, const float* xW, const float* sU, const float* b, const float* adj, size_t rows, size_t cols) {
  int j = blockIdx.x + blockIdx.y * gridDim.x; // optimized grid stride loop
  while (j < rows) {
    float* rowOutCell = outCell + j * cols;
    float* rowOutXW = outXW + j * cols * 4;
    float* rowOutSU = outSU + j * cols * 4;

    const float* rowCell = cell + j * cols;
    const float* xWrow = xW + j * cols * 4;
    const float* sUrow = sU + j * cols * 4;

    const float* rowAdj = adj + j * cols;

    int i = threadIdx.x + blockDim.x * blockIdx.z; // optimized block stride loop
    while (i < cols) {
      int k = i + 3 * cols;
      float go = stableSigmoid(xWrow[k] + sUrow[k] + b[k]);

      float t = tanhf(rowCell[i]);

      float adj = rowAdj[i];

      // dc/dc_{t-1}
      if(outCell)
        rowOutCell[i] += go * (1 - t * t) * adj;

      // dc/d(b_o) = dc/d(xW_f) ...
      float dcdxo = t * go * (1 - go) * adj;
      if(outXW)
        rowOutXW[k] += dcdxo;
      if(outSU)
        rowOutSU[k] += dcdxo;
      if(outB)
        atomicAdd(outB + k, dcdxo);

      i += blockDim.x * gridDim.z;
    }

    j += gridDim.x * gridDim.y;
  }
}