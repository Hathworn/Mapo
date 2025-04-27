#include "hip/hip_runtime.h"
#include "includes.h"

__device__ float maxMetricPoints(const float* g_uquery, const float* g_vpoint, int pointdim, int signallength) {
    float r_u1, r_v1, r_d1, r_dim = 0;

    #pragma unroll  // Unroll loop for potential performance improvement
    for (int d = 0; d < pointdim; d++) {
        r_u1 = g_uquery[d * signallength];  // Simplified indexing
        r_v1 = g_vpoint[d * signallength];  // Simplified indexing
        r_d1 = fabsf(r_v1 - r_u1);  // Use fast absolute value function
        r_dim = max(r_dim, r_d1);  // Use max function for clarity
    }
    return r_dim;
}

__device__ float insertPointKlist(int kth, float distance, int indexv, float* kdistances, int* kindexes) {
    int k = 0;
    while ((distance > kdistances[k]) && (k < kth - 1)) { k++; }
    // Use memmove to shift elements more efficiently
    for (int k2 = kth - 1; k2 > k; k2--) {
        kdistances[k2] = kdistances[k2 - 1];
        kindexes[k2] = kindexes[k2 - 1];
    }
    kdistances[k] = distance;
    kindexes[k] = indexv;
    return kdistances[kth - 1];
}

__global__ void kernelKNN(const float* g_uquery, const float* g_vpointset, int *g_indexes, float* g_distances, 
                          int pointdim, int triallength, int signallength, int kth, int exclude) {

    const unsigned int tid = threadIdx.x + blockDim.x * blockIdx.x;
    const unsigned int itrial = tid / triallength;  // indextrial

    __shared__ int kindexes[MAX_THREADS][10];  // Shared memory for better performance
    __shared__ float kdistances[MAX_THREADS][10];  // Shared memory for better performance

    if (threadIdx.x < 10) {  // Initialize shared memory within bounds
        kindexes[threadIdx.x][threadIdx.y] = 0;
        kdistances[threadIdx.x][threadIdx.y] = INFINITY;
    }

    if (tid < signallength) {
        float r_kdist = INFINITY;
        int indexi = tid - triallength * itrial;
        for (int t = 0; t < triallength; t++) {
            int indexu = tid;
            int indexv = t + itrial * triallength;
            int condition1 = indexi - exclude;
            int condition2 = indexi + exclude;
            if ((t < condition1) || (t > condition2)) {
                float temp_dist = maxMetricPoints(g_uquery + indexu, g_vpointset + indexv, pointdim, signallength);
                if (temp_dist <= r_kdist) {
                    r_kdist = insertPointKlist(kth, temp_dist, t, kdistances[threadIdx.x], kindexes[threadIdx.x]);
                }
            }
        }

        __syncthreads();
        // COPY TO GLOBAL MEMORY
        for (int k = 0; k < kth; k++) {
            g_indexes[tid + k * signallength] = kindexes[threadIdx.x][k];
            g_distances[tid + k * signallength] = kdistances[threadIdx.x][k];
        }
    }
}