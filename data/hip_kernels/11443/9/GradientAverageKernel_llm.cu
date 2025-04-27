#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void GradientAverageKernel(float4 *D, float4 *TD, unsigned int *NEIGHBOR, unsigned int *NBOFFSETS, unsigned int *nNeighbors, unsigned int nVertices)
{
    // Calculate global vertex index
    int vidxb = 4 * (blockIdx.x * blockDim.x) + threadIdx.x;

    // Shared memory for caching data
    __shared__ float4 SI[4 * BLOCK_SIZE_AVGG];

    int bidx = 4 * threadIdx.x;

    // Cache vertices data into shared memory
    for (int vidx = vidxb; vidx < vidxb + 4 * BLOCK_SIZE_AVGG; vidx += BLOCK_SIZE_AVGG)
    {
        if (vidx < nVertices)
        {
            SI[bidx] = D[vidx];
            bidx++;
        }
    }

    __syncthreads();

    bidx = 4 * threadIdx.x;

    // Process each vertex in the block
    for (int vidx = vidxb; vidx < vidxb + 4 * BLOCK_SIZE_AVGG; vidx += BLOCK_SIZE_AVGG)
    {
        if (vidx < nVertices)
        {
            int offset = NBOFFSETS[vidx];
            int N = nNeighbors[vidx];

            float4 td = SI[bidx++];
            float4 nbd;

            // Accumulate neighbors data
            for (int n = 0; n < N; n++)
            {
                int soffset = NEIGHBOR[offset + n];
                if (soffset < nVertices) // Ensure valid access memory
                {
                    nbd = D[soffset];
                    td.x += nbd.x;
                    td.y += nbd.y;
                    td.z += nbd.z;
                }
            }

            // Compute average
            float invNplus1 = 1.0f / (float)(N + 1);
            td.x *= invNplus1;
            td.y *= invNplus1;
            td.z *= invNplus1;

            // Store result
            TD[vidx] = td;
        }
    }
}