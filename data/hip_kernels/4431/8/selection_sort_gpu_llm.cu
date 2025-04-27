#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void selection_sort_gpu(int b, int n, int m, int k, const float *dist, int *outi, float *out) {
    int batch_index = blockIdx.x;
    dist += m * n * batch_index;
    outi += m * n * batch_index;
    out += m * n * batch_index;

    int index = threadIdx.x;
    int stride = blockDim.x;

    // Loop unrolling to improve memory access pattern
    for (int j = index; j < m; j += stride) {
        #pragma unroll 4
        for (int s = 0; s < n; ++s) {
            out[j * n + s] = dist[j * n + s];
            outi[j * n + s] = s;
        }
    }

    float *p_dist;
    for (int j = index; j < m; j += stride) {
        p_dist = out + j * n;
        // Optimized selection sort loop
        for (int s = 0; s < k; ++s) {
            int min = s;
            // Reduce the range of comparison
            for (int t = s + 1; t < n; ++t) {
                min = (p_dist[t] < p_dist[min]) ? t : min; 
            }
            if (min != s) {
                // Use a single swap operation
                float tmp = p_dist[s];
                p_dist[s] = p_dist[min];
                p_dist[min] = tmp;
                int tmpi = outi[j * n + s];
                outi[j * n + s] = outi[j * n + min];
                outi[j * n + min] = tmpi;
            }
        }
    }
}