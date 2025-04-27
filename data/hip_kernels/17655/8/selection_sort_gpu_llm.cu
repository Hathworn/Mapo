#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void selection_sort_gpu(int b, int n, int m, int k, const float *dist, int *outi, float *out) {
    int batch_index = blockIdx.x;
    dist += m * n * batch_index;
    outi += m * n * batch_index;
    out += m * n * batch_index;
    
    int index = threadIdx.x;
    int stride = blockDim.x;
    
    // Optimize data copy to use shared memory
    __shared__ float shared_dist[1024];  // Assume maximum stride size
    __shared__ int shared_outi[1024];

    for (int j = index; j < m; j += stride) {
        for (int s = 0; s < n; ++s) {
            int idx = j * n + s;
            shared_dist[idx] = dist[idx];
            shared_outi[idx] = s;
        }
    }
    __syncthreads();

    float *p_dist;
    for (int j = index; j < m; j += stride) {
        p_dist = shared_dist + j * n;
        // Optimize selection sort with fewer swap operations
        for (int s = 0; s < k; ++s) {
            int min = s;
            for (int t = s + 1; t < n; ++t) {
                if (p_dist[t] < p_dist[min]) {
                    min = t;
                }
            }
            // Swap only if min index has changed
            if (min != s) {
                float tmp = p_dist[min];
                p_dist[min] = p_dist[s];
                p_dist[s] = tmp;
                int tmpi = shared_outi[j * n + min];
                shared_outi[j * n + min] = shared_outi[j * n + s];
                shared_outi[j * n + s] = tmpi;
            }
        }
    }

    // Copy shared memory back to global memory
    __syncthreads();
    for (int j = index; j < m; j += stride) {
        for (int s = 0; s < n; ++s) {
            int idx = j * n + s;
            out[idx] = shared_dist[idx];
            outi[idx] = shared_outi[idx];
        }
    }
}