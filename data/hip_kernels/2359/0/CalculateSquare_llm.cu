#include "hip/hip_runtime.h"
#include "includes.h"

#define ARRAY_SIZE 200
#define ARRAY_BYTES ARRAY_SIZE * sizeof(float)

__global__ void CalculateSquare(float* p_out, float* p_in)
{
    // Calculate the global index for larger grids
    int index = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Ensure index is within bounds
    if (index < ARRAY_SIZE) {
        float valueToSquare = p_in[index];
        p_out[index] = valueToSquare * valueToSquare;
    }
}