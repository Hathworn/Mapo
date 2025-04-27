```c
#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void PlotObserverScaleDownScaleKernel(float* history, int nbCurves, int size)
{
    // Compute global thread ID using block and grid dimensions
    int id = blockIdx.x * blockDim.x + threadIdx.x + blockIdx.y * blockDim.x * gridDim.x;

    // Boundary check to ensure thread does not access out-of-bounds memory
    if (id >= size) return;

    // Use only one memory access per value
    int baseAddress = 2 * id;
    float val1 = history[baseAddress];
    float val2 = history[baseAddress + nbCurves];

    // Store average directly to avoid extra instructions
    history[id] = (val1 + val2) * 0.5f;
}