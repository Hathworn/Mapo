#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void pointGenKernel(float* points, float* dirs, int nBBS0, int nelems, float minimum, float step) {
    int blockId = blockIdx.y * (gridDim.x / nBBS0) + blockIdx.x;
    int k = blockId / nBBS0;
    int i = threadIdx.x + (blockIdx.x % nBBS0) * blockDim.x;
    int j = threadIdx.y + blockIdx.y * blockDim.y;

    // Ensure within bounds
    if (i < nelems && j < nelems && k < nelems) {
        // Precompute common expressions
        float iStep = i * step;
        float jStep = j * step;
        float kStep = k * step;
        
        float x = minimum + iStep;
        float y = minimum + jStep;
        float z = minimum + kStep;

        int id = i + j * nelems + k * nelems * nelems;

        // Set points and dirs
        points[3 * id + 0] = x;
        points[3 * id + 1] = y;
        points[3 * id + 2] = z;

        dirs[3 * id + 0] = x - 10.f;
        dirs[3 * id + 1] = y - 10.f;
        dirs[3 * id + 2] = z - 10.f;
    }
}