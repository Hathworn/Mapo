#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void dyadicAdd(int * counter, const int length, const int shift)
{
    if (shift > 0) {
        unsigned int xIndex = blockDim.x * blockIdx.x + threadIdx.x;
        
        // Pre-calculate adds, simplifies calculation below
        int adds = 2 * shift;
        
        // Calculate the targeted index directly
        int Index = adds * (xIndex + 1) - 1;

        // Check boundary condition to prevent out-of-bounds access
        if (Index < length) {
            // Perform addition with a direct memory reference
            counter[Index] += counter[Index - shift];
        }
    }
}