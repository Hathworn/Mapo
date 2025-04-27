#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void solve(float* mat, float* b, float* x, int rows, int cols)
{
    int n = blockIdx.x * blockDim.x + threadIdx.x; // Use blockDim.x for flexibility
    if (n < rows) // Ensure bounds
    {
        float diag_val = mat[n * cols + n]; // Reuse memory access
        if (diag_val != 0) // Check for division by zero
        {
            x[n] = b[n] / diag_val;
        }
    }
}