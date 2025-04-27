#include "hip/hip_runtime.h"
#include "includes.h"

__device__ float maxMetricPoints(const float* g_uquery, const float* g_vpoint, int pointdim, int signallength) {
    float r_u1, r_v1, r_d1, r_dim = 0;

    #pragma unroll  // Optimize loop unrolling
    for (int d = 0; d < pointdim; d++) {
        r_u1 = g_uquery[d * signallength];
        r_v1 = g_vpoint[d * signallength];
        r_d1 = fabsf(r_v1 - r_u1);  // Use optimized absolute value function
        r_dim = fmaxf(r_dim, r_d1);  // Use optimized max function
    }
    return r_dim;
}

__global__ void kernelBFRSMultishared(const float* g_uquery, const float* g_vpointset, int *g_npoints, int pointdim, int triallength, int signallength, int exclude, const float* vecradius) {

    extern __shared__ char array[];
    int *s_npointsrange = (int*)array;
    float radius = 0;
    const unsigned int tid = threadIdx.x + blockDim.x * blockIdx.x;
    const unsigned int itrial = tid / triallength;

    if (tid < signallength) {
        s_npointsrange[threadIdx.x] = 0;
        __syncthreads();

        radius = vecradius[itrial];
        unsigned int indexi = tid - triallength * itrial;

        for (int t = 0; t < triallength; t++) {
            int indexv = t + itrial * triallength;
            int condition1 = indexi - exclude;
            int condition2 = indexi + exclude;

            if (t < condition1 || t > condition2) {
                float temp_dist = maxMetricPoints(g_uquery + tid, g_vpointset + indexv, pointdim, signallength);
                if (temp_dist <= radius) {
                    s_npointsrange[threadIdx.x]++;
                }
            }
        }

        __syncthreads();
        g_npoints[tid] = s_npointsrange[threadIdx.x];
    }
}