#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void computeSphereVertexDistancesKernel(float4 *V, float *dist, unsigned int *NEIGHBOR, unsigned int *NBOFFSETS, unsigned int *nNeighbors, unsigned int nVertices, float circumference)
{
    int n, N;
    int offset, soffset;

    // Calculate the vertex index using thread and block indices
    int vidxb = 4 * (blockIdx.x * blockDim.x) + threadIdx.x;
    int basevert = 4 * (blockIdx.x * blockDim.x);

    int vidx, tab;
    float4 nv, tv;
    float dot, n1, n2, norm;

    // Shared memory cache for vertices
    __shared__ float4 SI[4 * BLOCK_SIZE_CVD];

    // Thread index in block
    int bidx = threadIdx.x;
    // Load vertices into shared memory
    for (vidx = vidxb; vidx < vidxb + 4 * BLOCK_SIZE_CVD; vidx += BLOCK_SIZE_CVD)
    {
        if (vidx < nVertices)
        {
            SI[bidx] = V[vidx];
            bidx += BLOCK_SIZE_CVD;
        }
    }

    __syncthreads();

    bidx = threadIdx.x;
    // Process the vertices
    for (vidx = vidxb; vidx < vidxb + 4 * BLOCK_SIZE_CVD; vidx += BLOCK_SIZE_CVD)
    {
        if (vidx < nVertices)
        {
            offset = NBOFFSETS[vidx];
            N = nNeighbors[vidx];
            tv = SI[bidx];

            bidx += BLOCK_SIZE_CVD;

            for (n = 0; n < N; n++)
            {
                soffset = NEIGHBOR[offset + n];

                // Optimized neighbor vertex retrieval
                tab = soffset - basevert;
                nv = (tab >= 0 && tab < 4 * BLOCK_SIZE_CVD) ? SI[tab] : V[soffset];

                // Use FMA intrinsics to compute dot product and magnitudes
                dot = __fmul_rn(tv.x, nv.x);
                dot = __fadd_rn(dot, __fmul_rn(tv.y, nv.y));
                dot = __fadd_rn(dot, __fmul_rn(tv.z, nv.z));

                n1 = __fmul_rn(tv.x, tv.x);
                n1 = __fadd_rn(n1, __fmul_rn(tv.y, tv.y));
                n1 = __fadd_rn(n1, __fmul_rn(tv.z, tv.z));

                n2 = __fmul_rn(nv.x, nv.x);
                n2 = __fadd_rn(n2, __fmul_rn(nv.y, nv.y));
                n2 = __fadd_rn(n2, __fmul_rn(nv.z, nv.z));

                norm = __fmul_rn(__fsqrt_rn(n1), __fsqrt_rn(n2));

                // Numerical stability checks
                if (norm < 1.0e-7f || fabsf(dot) > norm)
                {
                    dist[offset + n] = 0.0f;
                }
                else
                {
                    dist[offset + n] = __fmul_rn(circumference, fabsf(acosf(dot / norm)));
                }
            }
        }
    }
}