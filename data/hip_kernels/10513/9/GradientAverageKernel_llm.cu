#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void GradientAverageKernel(float4 *D, float4 *TD, unsigned int *NEIGHBOR, unsigned int *NBOFFSETS, unsigned int *nNeighbors, unsigned int nVertices)
{
    int vidxb = 4 * (blockIdx.x * blockDim.x) + threadIdx.x;
    int vidx;
    float4 nbd, td;
    
    // Use shared memory to cache vertices data 
    __shared__ float4 SI[4 * BLOCK_SIZE_AVGG];
    
    int bidx = 4 * threadIdx.x;

    // Load vertices into shared memory (efficient memory access)
    for (vidx = vidxb; vidx < vidxb + 4 * BLOCK_SIZE_AVGG; vidx += BLOCK_SIZE_AVGG) {
        if (vidx < nVertices) {
            SI[bidx] = D[vidx];
            bidx++;
        }
    }

    __syncthreads();
    bidx = 4 * threadIdx.x;

    // Precompute vertex gradients using cached vertices
    for (vidx = vidxb; vidx < vidxb + 4 * BLOCK_SIZE_AVGG; vidx += BLOCK_SIZE_AVGG) {
        if (vidx < nVertices) {
            int offset = NBOFFSETS[vidx];
            int N = nNeighbors[vidx];
            
            td = SI[bidx++];
            
            for (int n = 0; n < N; n++) {
                int soffset = NEIGHBOR[offset + n];
                
                if (soffset >= vidxb && soffset < vidxb + 4 * BLOCK_SIZE_AVGG) { // Efficient shared memory access
                    nbd = SI[soffset - vidxb];
                } else {
                    nbd = D[soffset];
                }
                
                td.x += nbd.x;
                td.y += nbd.y;
                td.z += nbd.z;
            }
            
            td.x /= (float)(N + 1);
            td.y /= (float)(N + 1);
            td.z /= (float)(N + 1);
            
            TD[vidx] = td;
        }
    }
}