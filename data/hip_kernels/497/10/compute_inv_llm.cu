#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void compute_inv(const int* __restrict__ destination_offsets, const int* __restrict__ source_indices, const float* __restrict__ out_degrees, const int node_count, const float* __restrict__ input, float* __restrict__ output)
{
    int dest = blockDim.x * blockIdx.x + threadIdx.x;
    
    if (dest < node_count)
    {
        int srcStart = destination_offsets[dest];
        int srcEnd = destination_offsets[dest + 1];
        int in_degree = srcEnd - srcStart;
        float rank = 0.0f;

        // Use a local variable for DECAY to avoid multiple loads
        const float decay_local = DECAY;

        // Optimize by checking in-degree once
        if (in_degree > 0)
        {
            #pragma unroll
            for (int srcIdx = srcStart; srcIdx < srcEnd; ++srcIdx)
            {
                int src = source_indices[srcIdx];
                // Minimize memory fetch and repeat calculations
                float input_src = input[src];
                float out_degree_src = out_degrees[src];
                float contrib = (input_src * decay_local) * out_degree_src;
                rank += contrib;
            }
        }
        
        // Calculate rank with a precomputed constant part
        output[dest] = rank + (1.0f - decay_local);
    }
}