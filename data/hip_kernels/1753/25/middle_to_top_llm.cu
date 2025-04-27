#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void middle_to_top(float* data, const int nx, const int ny)
{
    // Calculate column position for each thread
    int c = threadIdx.x + blockIdx.x * blockDim.x;
    if (c < nx) {
        // Get the value in the top row
        float last_val = data[ny/2 * nx + c];
        // Iterate over rows from middle to top
        for (int r = ny - 1; r >= ny / 2; --r) {
            int idx = r * nx + c;
            float tmp = data[idx];
            data[idx] = last_val;
            last_val = tmp;
        }
    }
}