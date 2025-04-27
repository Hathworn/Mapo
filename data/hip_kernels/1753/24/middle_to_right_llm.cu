#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void middle_to_right(float* data, const int nx, const int ny) 
{
    // Cache thread index and stride for global memory access
    int r = blockIdx.y * blockDim.y + threadIdx.y;
    int stride = blockDim.y * gridDim.y;

    // Process data row by row
    for (; r < ny; r += stride) {
        float last_val = data[r * nx + nx / 2];
        
        // Use a reverse loop over columns starting from nx/2
        for (int c = nx - 1; c >= nx / 2; --c) {
            int idx = r * nx + c;
            float tmp = data[idx];
            data[idx] = last_val;
            last_val = tmp;
        }
    }
}