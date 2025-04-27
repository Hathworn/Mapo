#include "hip/hip_runtime.h"
#include "includes.h"

__device__ inline float stableSigmoid(float x) {
  if (x >= 0) {
    float z = expf(-x);
    return 1.0 / (1.0 + z);
  } else {
    float z = expf(x);
    return z / (1.0 + z);
  }
}

__global__ void gGRUFastBackward(float* outState, float* outXW, float* outSU, float* outB, const float* state, const float* xW, const float* sU, const float* b, const float* mask, const float* adj, size_t rows, size_t cols, bool final) {
  for (int bid = blockIdx.x; bid < rows; bid += gridDim.x) { // Optimize grid-stride loop
    float m = !mask || mask[bid];
    
    float* rowOutState = outState + bid * cols;
    float* rowOutXW = outXW + bid * cols * 3;
    float* rowOutSU = outSU + bid * cols * 3;

    const float* rowState = state + bid * cols;
    const float* rowXW = xW + bid * cols * 3;
    const float* rowSU = sU + bid * cols * 3;
    const float* rowAdj = adj + bid * cols;

    for (int tid = threadIdx.x; tid < cols; tid += blockDim.x) { // Optimize block-stride loop
      int i = tid;
      int k = i + cols;
      int l = i + 2 * cols;

      float r = stableSigmoid(rowXW[i] + rowSU[i] + b[i]);
      float z = stableSigmoid(rowXW[k] + rowSU[k] + b[k]);

      float h;
      if (final)
        h = tanhf(rowXW[l] + (rowSU[l] + b[l]) * r);
      else
        h = tanhf(rowXW[l] + rowSU[l] * r + b[l]);

      float adj = rowAdj[i];
      float t = (1 - z) * (1 - h * h);

      // df/ds
      if (outState)
        rowOutState[i] += (m * z - m + 1) * adj;

      // df/d(xW_r) ...
      float dfdxW_r = m * r * (1 - r) * t * adj;
      dfdxW_r *= final ? (rowSU[l] + b[l]) : rowSU[l];
      if (outXW)
        rowOutXW[i] += dfdxW_r;
      if (outSU)
        rowOutSU[i] += dfdxW_r;
      if (outB)
        atomicAdd(outB + i, dfdxW_r);

      // df/d(xW_z) ...
      float dfdxW_z = m * (1 - z) * z * (rowState[i] - h) * adj;
      if (outXW)
        rowOutXW[k] += dfdxW_z;
      if (outSU)
        rowOutSU[k] += dfdxW_z;
      if (outB)
        atomicAdd(outB + k, dfdxW_z);

      // df/d(xW_x) ...
      float dfdxW_x = m * t * adj;
      if (outXW)
        rowOutXW[l] += dfdxW_x;
      if (outSU)
        rowOutSU[l] += dfdxW_x * r;
      if (outB) {
        if (final)
          atomicAdd(outB + l, dfdxW_x * r);
        else
          atomicAdd(outB + l, dfdxW_x);
      }
    }
  }
}