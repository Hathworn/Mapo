#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void GradientAverageKernel(float4 *D, float4 *TD, unsigned int *NEIGHBOR, unsigned int *NBOFFSETS, unsigned int *nNeighbors, unsigned int nVertices)
{
    int offset, soffset;
    float4 nbd, td;

    // Optimized cache for 4 elements per thread
    __shared__ float4 SI[4 * BLOCK_SIZE_AVGG];

    int vidxb = 4 * (blockIdx.x * blockDim.x) + threadIdx.x;
    int bidx = 4 * threadIdx.x;

    // Efficiently load shared memory
    for (int vidx = vidxb; vidx < vidxb + 4 * BLOCK_SIZE_AVGG && vidx < nVertices; vidx += BLOCK_SIZE_AVGG)
    {
        SI[bidx] = D[vidx];
        bidx++;
    }

    __syncthreads();

    bidx = 4 * threadIdx.x;
    // Process vertices in the block
    for (int vidx = vidxb; vidx < vidxb + 4 * BLOCK_SIZE_AVGG && vidx < nVertices; vidx += BLOCK_SIZE_AVGG)
    {
        offset = NBOFFSETS[vidx];
        int N = nNeighbors[vidx];

        td = SI[bidx++];

        // Accumulate neighbor values
        for (int n = 0; n < N; n++)
        {
            soffset = NEIGHBOR[offset + n];
            nbd = D[soffset];

            td.x += nbd.x;
            td.y += nbd.y;
            td.z += nbd.z;
        }

        // Average the accumulated values
        td.x /= (float)(N + 1);
        td.y /= (float)(N + 1);
        td.z /= (float)(N + 1);

        TD[vidx] = td;
    }
}