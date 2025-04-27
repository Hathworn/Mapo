#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void ComputeOrientations(float *g_Data, float *d_Sift, int maxPts, int w, int h)
{
  __shared__ float data[16*15];
  __shared__ float hist[32];
  __shared__ float gauss[16];
  
  const int tx = threadIdx.x;
  const int bx = blockIdx.x;
  
  // Initialize histogram and load Gaussian values
  if (tx < 32) hist[tx] = 0.0f;
  if (tx < 15) gauss[tx] = expf(-1.0f/(2.0f*3.0f*3.0f)*(tx-7)*(tx-7));
  __syncthreads();
  
  int xp = max(min(static_cast<int>(d_Sift[bx + 0*maxPts] - 6.5f), w - 1), 0);
  int yp = max(min(static_cast<int>(d_Sift[bx + 1*maxPts] - 6.5f), h - 1), 0);
  int px = xp & 15;
  int x = tx - px;
  
  // Load data into shared memory
  for (int y=0; y<15; y++) {
    int memPos = 16*y + x;
    int xi = max(min(xp + x, w - 1), 0);
    int yi = max(min(yp + y, h - 1), 0);
    if (x >= 0 && x < 15)
      data[memPos] = g_Data[yi*w + xi];
  }
  __syncthreads();
  
  // Compute gradient and populate histogram
  for (int y=1; y<14; y++) {
    int memPos = 16*y + x;
    if (x >= 1 && x < 14) {
      float dy = data[memPos+16] - data[memPos-16];
      float dx = data[memPos+1] - data[memPos-1];
      int bin = static_cast<int>(16.0f * atan2f(dy, dx) / 3.1416f + 16.5f) % 32;
      float grad = sqrtf(dx*dx + dy*dy);
      atomicAdd(&hist[bin], grad * gauss[x] * gauss[y]);
    }
  }
  __syncthreads();
  
  // Find the peaks in the histogram
  if (tx < 32) {
    float v = hist[tx];
    hist[tx] = (v > hist[(tx + 1) % 32] && v >= hist[(tx + 31) % 32]) ? v : 0.0f;
  }
  __syncthreads();
  
  // Determine dominant orientations
  if (tx == 0) {
    float maxval1 = 0.0f;
    float maxval2 = 0.0f;
    int i1 = -1;
    int i2 = -1;
    for (int i = 0; i < 32; i++) {
      float v = hist[i];
      if (v > maxval1) {
        maxval2 = maxval1;
        maxval1 = v;
        i2 = i1;
        i1 = i;
      } else if (v > maxval2) {
        maxval2 = v;
        i2 = i;
      }
    }
  
    float val1 = hist[(i1 + 1) % 32];
    float val2 = hist[(i1 + 31) % 32];
    float peak = i1 + 0.5f * (val1 - val2) / (2.0f * maxval1 - val1 - val2);
    d_Sift[bx + 5*maxPts] = 11.25f * (peak < 0.0f ? peak + 32.0f : peak);
  
    if (maxval2 < 0.8f * maxval1)
      i2 = -1;
  
    if (i2 >= 0) {
      float val1 = hist[(i2 + 1) % 32];
      float val2 = hist[(i2 + 31) % 32];
      float peak = i2 + 0.5f * (val1 - val2) / (2.0f * maxval2 - val1 - val2);
      d_Sift[bx + 6*maxPts] = 11.25f * (peak < 0.0f ? peak + 32.0f : peak);
    } else {
      d_Sift[bx + 6*maxPts] = i2;
    }
  }
}