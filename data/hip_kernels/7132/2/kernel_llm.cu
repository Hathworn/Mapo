#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void kernel(float* data, size_t from, size_t to, size_t min, size_t max, size_t NX)
{
    size_t i = min + blockIdx.x * blockDim.x + threadIdx.x;
    size_t grid_stride = gridDim.x * blockDim.x; // Use grid stride for efficient looping

    while (i < max) {
        size_t row = i / NX; // Precompute row index
        size_t col = i % NX; // Precompute column index

        // Avoid modulus check with simple comparison
        if (col != 0 && col != NX - 1) {
            data[to + i] = 0.2 * (
                data[from + i]
                + data[from + i - 1]
                + data[from + i + 1]
                + data[from + i - NX]
                + data[from + i + NX]);
        }
        i += grid_stride; // Move to the next position with grid stride
    }
}