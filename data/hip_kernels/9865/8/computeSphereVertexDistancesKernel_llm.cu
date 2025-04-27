#include "hip/hip_runtime.h"
#include "includes.h"
#define BLOCK_SIZE_CVD 128

__global__ void computeSphereVertexDistancesKernel(float4 *V, float *dist, unsigned int *NEIGHBOR, unsigned int *NBOFFSETS, unsigned int *nNeighbors, unsigned int nVertices, float circumference)
{
    int n, N;
    int offset, soffset;

    // Calculate global vertex index
    int vidxb = 4*(blockIdx.x * blockDim.x) + threadIdx.x;
    int basevert = 4*(blockIdx.x * blockDim.x);

    int vidx, tab;
    float4 nv, tv;
    float dot, n1, n2, norm;

    // Cache vertices in shared memory for block
    __shared__ float4 SI[4*BLOCK_SIZE_CVD];

    int bidx = threadIdx.x;
    // Load vertices into shared memory
    for (vidx = vidxb; vidx < vidxb + 4*BLOCK_SIZE_CVD; vidx += BLOCK_SIZE_CVD) {
        if (vidx < nVertices) {
            SI[bidx] = V[vidx];
            bidx += BLOCK_SIZE_CVD;
        }
    }

    // Ensure all threads complete loading
    __syncthreads();

    bidx = threadIdx.x;
    // Iterate over vertices for calculations
    for (vidx = vidxb; vidx < vidxb + 4*BLOCK_SIZE_CVD; vidx += BLOCK_SIZE_CVD) {
        if (vidx < nVertices) {
            offset = NBOFFSETS[vidx];
            N = nNeighbors[vidx];
            tv = SI[bidx];
            bidx += BLOCK_SIZE_CVD;

            for (n = 0; n < N; n++) {
                soffset = NEIGHBOR[offset + n];

                // Prefer shared memory when possible
                tab = soffset - basevert;
                nv = (tab >= 0 && tab < 4*BLOCK_SIZE_CVD) ? SI[tab] : V[soffset];

                // Use FMAD instructions for dot product calculation
                dot = __fmaf_rn(tv.x, nv.x, __fmaf_rn(tv.y, nv.y, __fmul_rn(tv.z, nv.z)));

                // Use FMAD instructions for norm calculations
                n1 = __fmaf_rn(tv.x, tv.x, __fmaf_rn(tv.y, tv.y, __fmul_rn(tv.z, tv.z)));
                n2 = __fmaf_rn(nv.x, nv.x, __fmaf_rn(nv.y, nv.y, __fmul_rn(nv.z, nv.z)));

                // Calculate norm using fast multiplication
                norm = __fmul_rn(__frsqrt_rn(n1), __frsqrt_rn(n2));

                // Efficient threshold checks and distance assignment
                if (norm >= 1.0e-7f) {
                    float scaled_dot = __fmul_rn(dot, __frcp_rn(norm));
                    dist[offset + n] = (fabsf(scaled_dot) <= 1.0f) ? __fmul_rn(circumference, fabsf(acosf(scaled_dot))) : 0.0f;
                } else {
                    dist[offset + n] = 0.0f;
                }
            }
        }
    }
}