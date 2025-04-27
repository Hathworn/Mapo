#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void g_One_backpropagation(float* _curDelta, float* _w, float* _nextDelta, int rows, int cols, int channels)
{
    int row = blockIdx.x;
    int channel = blockIdx.y;
    int tid = threadIdx.x; // Current thread index

    // Calculate skip once outside the loop
    int skip = channel * rows * cols + row * cols;
    float* curDelta = _curDelta + skip;
    float* nextDelta = _nextDelta + skip;
    float* w = _w + channel * cols;

    // Process data with shared memory to improve access efficiency
    __shared__ float shared_w[1024]; // Adjust size as needed based on `cols`
    if (tid < cols) {
        shared_w[tid] = w[tid];
    }
    __syncthreads(); // Ensure all threads have loaded weights into shared memory

    // Loop with stride to handle remaining elements
    for (int i = tid; i < cols; i += blockDim.x) {
        if (i < cols) {
            nextDelta[i] = curDelta[i] * shared_w[i];
        }
    }
}