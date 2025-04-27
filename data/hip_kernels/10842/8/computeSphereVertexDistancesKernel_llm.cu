#include "hip/hip_runtime.h"
#include "includes.h"

// Reorganized kernel to optimize memory access and reduce redundant computation
__global__ void computeSphereVertexDistancesKernel(float4 *V, float *dist, unsigned int *NEIGHBOR, unsigned int *NBOFFSETS, unsigned int *nNeighbors, unsigned int nVertices, float circumference)
{
    int n, N;
    int offset, soffset;

    // Calculate global index and base vertex index
    int vidxb = 4 * (blockIdx.x * blockDim.x) + threadIdx.x;
    int basevert = 4 * (blockIdx.x * blockDim.x);

    int bidx = threadIdx.x;
    
    // Shared memory for caching vertex positions
    __shared__ float4 SI[4 * BLOCK_SIZE_CVD];

    // Load vertices into shared memory
    for (int vidx = vidxb; vidx < vidxb + 4 * BLOCK_SIZE_CVD; vidx += BLOCK_SIZE_CVD)
    {
        if (vidx < nVertices)
        {
            SI[bidx] = V[vidx];
            bidx += BLOCK_SIZE_CVD;
        }
    }
    __syncthreads();

    bidx = threadIdx.x;

    // Process vertices and compute distances
    for (int vidx = vidxb; vidx < vidxb + 4 * BLOCK_SIZE_CVD; vidx += BLOCK_SIZE_CVD)
    {
        if (vidx < nVertices)
        {
            offset = NBOFFSETS[vidx];
            N = nNeighbors[vidx];
            float4 tv = SI[bidx];

            bidx += BLOCK_SIZE_CVD;

            for (n = 0; n < N; n++)
            {
                soffset = NEIGHBOR[offset + n];
                int tab = soffset - basevert;
                float4 nv = (tab > 0 && tab < 4 * BLOCK_SIZE_CVD) ? SI[tab] : V[soffset];

                float dot = __fmaf_rn(tv.x, nv.x, __fmaf_rn(tv.y, nv.y, __fmul_rn(tv.z, nv.z)));
                float n1 = __fmaf_rn(tv.x, tv.x, __fmaf_rn(tv.y, tv.y, __fmul_rn(tv.z, tv.z)));
                float n2 = __fmaf_rn(nv.x, nv.x, __fmaf_rn(nv.y, nv.y, __fmul_rn(nv.z, nv.z)));
                float norm = __sqrtf(n1) * __sqrtf(n2);

                if (norm < 1.0e-7f || fabsf(dot) > norm)
                {
                    dist[offset + n] = 0.0f;
                }
                else
                {
                    dist[offset + n] = circumference * fabsf(acosf(dot / norm));
                }
            }
        }
    }
}