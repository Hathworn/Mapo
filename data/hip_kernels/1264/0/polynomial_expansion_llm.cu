#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void polynomial_expansion (float* poly, int degree, int n, float* array)
{
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    if (idx < n)
    {
        float val = poly[0]; // Initialize with the first coefficient
        float exp = array[idx]; // Compute initial x
        for (int x = 1; x <= degree; ++x)
        {
            val += exp * poly[x]; // Multiply and accumulate
            exp *= array[idx]; // Increment power of x
        }
        array[idx] = val;
    }
}