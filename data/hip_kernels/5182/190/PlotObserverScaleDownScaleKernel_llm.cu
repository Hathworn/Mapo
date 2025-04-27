#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void PlotObserverScaleDownScaleKernel(float* history, int nbCurves, int size)
{
    // Use blockIdx.x with 2D grid configuration and calculate index more efficiently
    int id = blockDim.x * (blockIdx.x + blockIdx.y * gridDim.x) + threadIdx.x;

    if (id >= size) return;

    // Pre-calculate base address and optimize memory access
    int baseAddress1 = id;
    int baseAddress2 = baseAddress1 + nbCurves;
    
    // Simplify average calculation
    history[baseAddress1] = (history[baseAddress1] + history[baseAddress2]) * 0.5f;
}