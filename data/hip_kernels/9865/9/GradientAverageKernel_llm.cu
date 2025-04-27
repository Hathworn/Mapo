#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void GradientAverageKernel(float4 *D, float4 *TD, unsigned int *NEIGHBOR, unsigned int *NBOFFSETS, unsigned int *nNeighbors, unsigned int nVertices)
{
    // Calculate starting index
    int vidxb = 4 * (blockIdx.x * blockDim.x) + threadIdx.x;

    // Shared memory for caching 4 elements per thread block
    __shared__ float4 SI[4 * BLOCK_SIZE_AVGG];
    
    // Thread index for accessing shared memory
    int bidx = 4 * threadIdx.x;
    
    // Cache vertices to shared memory
    for (int vidx = vidxb; vidx < vidxb + 4 * BLOCK_SIZE_AVGG; vidx += BLOCK_SIZE_AVGG) {
        if (vidx < nVertices) {
            SI[bidx] = D[vidx];
            bidx++;
        }
    }
    
    __syncthreads(); // Synchronize threads to ensure shared memory is fully populated
    
    bidx = 4 * threadIdx.x;
    
    // Process each vertex
    for (int vidx = vidxb; vidx < vidxb + 4 * BLOCK_SIZE_AVGG; vidx += BLOCK_SIZE_AVGG) {
        if (vidx < nVertices) {
            int offset = NBOFFSETS[vidx];
            int N = nNeighbors[vidx];
            float4 td = SI[bidx++];
            
            // Accumulate neighbor contributions
            for (int n = 0; n < N; n++) {
                int soffset = NEIGHBOR[offset + n];
                float4 nbd = D[soffset];
                
                td.x += nbd.x;
                td.y += nbd.y;
                td.z += nbd.z;
            }
            
            // Average and assign to output
            float invN = 1.0f / (float)(N + 1);
            td.x *= invN;
            td.y *= invN;
            td.z *= invN;
            
            TD[vidx] = td;
        }
    }
}