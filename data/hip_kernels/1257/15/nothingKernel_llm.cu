#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void nothingKernel()
{
  // This kernel does nothing and requires no optimization.
  // For future optimizations, add computational code here if necessary.
}