#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void GradientAverageKernel(float4 *D, float4 *TD, unsigned int *NEIGHBOR, unsigned int *NBOFFSETS, unsigned int *nNeighbors, unsigned int nVertices)
{
    int vidxb = 4 * (blockIdx.x * blockDim.x) + threadIdx.x;
    if (vidxb >= nVertices) return;  // Early exit if out of bounds

    __shared__ float4 SI[4 * BLOCK_SIZE_AVGG];

    int bidx = 4 * threadIdx.x;
    // Load into shared memory
    for (int vidx = vidxb; vidx < vidxb + 4 * BLOCK_SIZE_AVGG && vidx < nVertices; vidx += BLOCK_SIZE_AVGG)
    {
        SI[bidx] = D[vidx];
        bidx++;
    }
    
    __syncthreads();  // Ensure shared memory is fully populated before use

    bidx = 4 * threadIdx.x;
    // Main computation
    for (int vidx = vidxb; vidx < vidxb + 4 * BLOCK_SIZE_AVGG && vidx < nVertices; vidx += BLOCK_SIZE_AVGG)
    {
        int offset = NBOFFSETS[vidx];
        int N = nNeighbors[vidx];
        float4 td = SI[bidx++];

        for (int n = 0; n < N; n++)
        {
            int soffset = NEIGHBOR[offset + n];
            float4 nbd = D[soffset];
            td.x += nbd.x;
            td.y += nbd.y;
            td.z += nbd.z;
        }

        // Averaging the neighbors
        float invN = 1.0f / (N + 1);
        td.x *= invN;
        td.y *= invN;
        td.z *= invN;

        TD[vidx] = td;
    }
}