#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void compute_shared(const int* destination_offsets, const int* source_indices, const int* out_degrees, const int node_count, const float* input, float *output)
{
    int dest = blockDim.x*blockIdx.x + threadIdx.x;
    __shared__ int s_dest_off[BLOCK_SIZE + 1];

    // Check if destination is within bounds
    if (dest < node_count)
    {
        // Load destination offsets into shared memory
        s_dest_off[threadIdx.x] = destination_offsets[dest];
        if (threadIdx.x == BLOCK_SIZE - 1 || dest == node_count - 1) {
            s_dest_off[threadIdx.x + 1] = destination_offsets[dest + 1];
        }
        __syncthreads();

        int srcStart = s_dest_off[threadIdx.x];
        int srcEnd = s_dest_off[threadIdx.x + 1];
        float rank = 0.0f;

        // Optimize by unrolling loop if possible
        if (srcStart < srcEnd) {
            for (int srcIdx = srcStart; srcIdx < srcEnd; ++srcIdx) {
                int src = source_indices[srcIdx];
                float contrib = ((input[src] * DECAY) / out_degrees[src]);
                rank += contrib;
            }
        }
        // Update the output value
        output[dest] = rank + (1.0f - DECAY);
    }
}