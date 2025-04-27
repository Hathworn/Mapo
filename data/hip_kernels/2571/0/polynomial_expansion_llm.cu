#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void polynomial_expansion(float* poly, int degree, int n, float* array)
{
    // Calculate global thread index
    int INX = blockIdx.x * blockDim.x + threadIdx.x;
    
    if (INX < n)
    {
        // Use shared memory for polynomial coefficients if they fit, to reduce global memory access time
        extern __shared__ float shared_poly[];
        if (threadIdx.x < degree + 1)
        {
            shared_poly[threadIdx.x] = poly[threadIdx.x];
        }
        __syncthreads();

        float val = 0.0f;
        float exp = 1.0f;
        
        for (int x = 0; x <= degree; ++x)
        {
            // Calculation using shared memory
            val += exp * shared_poly[x];
            exp *= array[INX];
        }

        // Store result back to global memory
        array[INX] = val;
    }
}