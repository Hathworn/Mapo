#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void selection_sort_gpu(int b, int n, int m, int k, float *dist, int *idx, float *val) {
    int batch_index = blockIdx.x;
    dist += m * n * batch_index;
    idx += m * k * batch_index;
    val += m * k * batch_index;

    int index = threadIdx.x;
    int stride = blockDim.x;

    // Pre-fetch data to shared memory for faster access
    extern __shared__ float shared_dist[];
    for (int j = index; j < m; j += stride) {
        float *p_dist = dist + j * n;

        // Load current row into shared memory
        for (int t = index; t < n; t += stride) {
            shared_dist[j * n + t] = p_dist[t];
        }
        __syncthreads();

        // Perform selection sort on shared memory for the first k elements
        for (int s = 0; s < k; ++s) {
            int min = s;
            for (int t = s + 1; t < n; ++t) {
                if (shared_dist[j * n + t] < shared_dist[j * n + min]) {
                    min = t;
                }
            }
            // Write results back to global memory
            idx[j * n + s] = min;
            val[j * n + s] = shared_dist[j * n + min];

            // Swap min-th and s-th element in shared memory
            float tmp = shared_dist[j * n + min];
            shared_dist[j * n + min] = shared_dist[j * n + s];
            shared_dist[j * n + s] = tmp;
        }
        __syncthreads(); // Ensure all threads have committed changes
    }
}