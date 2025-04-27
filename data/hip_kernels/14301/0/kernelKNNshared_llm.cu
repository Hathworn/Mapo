#include "hip/hip_runtime.h"
#include "includes.h"

__device__ float maxMetricPoints(const float* g_uquery, const float* g_vpoint, int pointdim, int signallength) {
    float r_u1, r_v1, r_d1, r_dim = 0;

    // Use pointer arithmetic instead of array indexing
    for (int d = 0; d < pointdim; d++) {
        r_u1 = g_uquery[d * signallength];
        r_v1 = g_vpoint[d * signallength];
        r_d1 = fabsf(r_v1 - r_u1);  // Use fabsf for absolute value
        r_dim = fmaxf(r_dim, r_d1); // Use fmaxf for maximum
    }
    return r_dim;
}

__device__ float insertPointKlist(int kth, float distance, int indexv, float* kdistances, int* kindexes) {
    int k = 0;
    // Simplify while loop using internal logic
    while (k < kth-1 && distance > kdistances[k]) { 
        k++;
    }
    // Use memmove instead of loop for shifting
    if (k < kth) {
        memmove(kdistances + k + 1, kdistances + k, (kth - k - 1) * sizeof(float));
        memmove(kindexes + k + 1, kindexes + k, (kth - k - 1) * sizeof(int));
        // Replace
        kdistances[k] = distance;
        kindexes[k] = indexv;
    }
    return kdistances[kth - 1];
}

__global__ void kernelKNNshared(const float* g_uquery, const float* g_vpointset, int *g_indexes, float* g_distances, const int pointdim, const int triallength, const int signallength, const int kth, const int exclude) {
    extern __shared__ char array[];
    float *kdistances = (float*)array;
    int *kindexes = (int*)(array + kth * blockDim.x * sizeof(float));

    const unsigned int tid = threadIdx.x + blockDim.x * blockIdx.x;
    const unsigned int itrial = tid / triallength;

    if (tid < signallength) {
        // Initialize shared memory with INFINITY
        for (int k = 0; k < kth; k++) {
            kdistances[threadIdx.x * kth + k] = INFINITY;
            kindexes[threadIdx.x * kth + k] = -1; // Initialize kindexes
        }

        __syncthreads();

        float r_kdist = INFINITY;
        unsigned int indexi = tid - triallength * itrial;

        for (int t = 0; t < triallength; t++) {
            int indexu = tid;
            int indexv = (t + itrial * triallength);
            int condition1 = indexi - exclude;
            int condition2 = indexi + exclude;
            
            // Reduce branching by calculating both conditions in one go
            if ((t < condition1) || (t > condition2)) {
                float temp_dist = maxMetricPoints(g_uquery + indexu, g_vpointset + indexv, pointdim, signallength);
                if (temp_dist <= r_kdist) {
                    r_kdist = insertPointKlist(kth, temp_dist, t, kdistances + threadIdx.x * kth, kindexes + threadIdx.x * kth);
                }
            }
        }
        
        __syncthreads();

        // COPY TO GLOBAL MEMORY
        for (int k = 0; k < kth; k++) {
            g_indexes[tid + k * signallength] = kindexes[threadIdx.x * kth + k];
            g_distances[tid + k * signallength] = kdistances[threadIdx.x * kth + k];
        }
    }
}