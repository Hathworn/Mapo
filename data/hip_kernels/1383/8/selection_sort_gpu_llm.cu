#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void selection_sort_gpu(int b, int n, int m, int k, const float *dist, int *outi, float *out) {
    int batch_index = blockIdx.x;
    dist += m * n * batch_index;
    outi += m * n * batch_index;
    out += m * n * batch_index;

    int index = threadIdx.x;
    int stride = blockDim.x;

    // Coalesced memory access for copying
    for (int j = index; j < m; j += stride) {
        for (int s = 0; s < n; ++s) {
            float dist_value = dist[j * n + s];
            out[j * n + s] = dist_value;
            outi[j * n + s] = s;
        }
    }

    // Reduce divergent branches by reordering loops
    for (int j = index; j < m; j += stride) {
        float *p_dist = out + j * n;
        for (int s = 0; s < k; ++s) {
            int min = s;
            float minValue = p_dist[s];
            for (int t = s + 1; t < n; ++t) {
                float tmpValue = p_dist[t];
                if (tmpValue < minValue) {
                    min = t;
                    minValue = tmpValue;
                }
            }
            // Swap only if needed
            if (min != s) {
                p_dist[min] = p_dist[s];
                p_dist[s] = minValue;
                int tmpi = outi[j * n + min];
                outi[j * n + min] = outi[j * n + s];
                outi[j * n + s] = tmpi;
            }
        }
    }
}