#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void SubtractMulti(float *d_Result, float *d_Data, int width, int pitch, int height)
{
    // Calculate global indices for x, y, and z dimensions
    const int x = blockIdx.x * SUBTRACTM_W + threadIdx.x;
    const int y = blockIdx.y * SUBTRACTM_H + threadIdx.y;
    const int z = threadIdx.z;

    // Pre-compute index offsets outside the conditional check
    int sz = height * pitch;
    int p = z * sz + y * pitch + x;
    int p_offset = p + sz;

    // Check bounds before accessing data
    if (x < width && y < height && p_offset < width * height * pitch) {
        // Perform subtraction and store result
        d_Result[p] = d_Data[p] - d_Data[p_offset];
    }
}