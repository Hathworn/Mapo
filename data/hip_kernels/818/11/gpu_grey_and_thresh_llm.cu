#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void gpu_grey_and_thresh(unsigned char* Pout, unsigned char* Pin, int width, int height){
  
  int channels = 3;
  unsigned char thresh = 157;
  int col = threadIdx.x + blockIdx.x * blockDim.x;
  int row = threadIdx.y + blockIdx.y * blockDim.y;

  // Improved: Check pixel bounds early
  if (col >= width || row >= height) return;

  int gOffset = row * width + col;
  int rgbOffset = gOffset * channels;

  // Load RGB values once
  unsigned char r = Pin[rgbOffset];
  unsigned char g = Pin[rgbOffset + 1];
  unsigned char b = Pin[rgbOffset + 2];

  // Calculate grey value using integer arithmetic
  unsigned char gval = static_cast<unsigned char>(0.21f * r + 0.71f * g + 0.07f * b);

  // Use ternary operator for simplicity
  Pout[gOffset] = gval > thresh ? 255 : 0;
}