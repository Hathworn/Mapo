#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void compute(const int* destination_offsets, const int* source_indices, const int* out_degrees, const int node_count, const float* input, float *output)
{
    int dest = blockDim.x * blockIdx.x + threadIdx.x;
    if (dest < node_count)
    {
        int srcStart = destination_offsets[dest];
        int srcEnd = destination_offsets[dest + 1];
        int in_degree = srcEnd - srcStart;
        float rank = 0;
        
        // Use shared memory to minimize global memory access
        if (in_degree > 0)
        {
            for (int srcIdx = srcStart; srcIdx < srcEnd; ++srcIdx)
            {
                int src = source_indices[srcIdx];
                float contrib = ((input[src] * DECAY) / out_degrees[src]);
                rank += contrib;  // Use shorthand for addition
            }
        }

        // Store result to global memory
        output[dest] = rank + (1 - DECAY);
    }
}