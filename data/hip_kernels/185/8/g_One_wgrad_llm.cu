#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void g_One_wgrad(float* _inputs, float* _curDelta, float* _wgradTmp, int rows, int cols, int channels)
{
    int row = blockIdx.x;
    int channel = blockIdx.y;
    int threadId = threadIdx.x;
    
    int skip = channel * rows * cols + row * cols;
    float* inputs = _inputs + skip;
    float* curDelta = _curDelta + skip;
    float* wgradTmp = _wgradTmp + skip;

    // Calculate global index for this thread
    int id = threadId;
    
    // Loop with stride to cover all elements in cols
    for (; id < cols; id += blockDim.x) {
        // Efficient load and computation
        wgradTmp[id] = inputs[id] * curDelta[id];
    }
}