#include "hip/hip_runtime.h"
#include "includes.h"

// Constants used by the program
#define BLOCK_DIM                      16
#define DEBUG                          0

__global__ void cuInsertionSort(float *dist, long *ind, int width, int height, int k) {

    unsigned int xIndex = blockIdx.x * blockDim.x + threadIdx.x;

    if (xIndex < width) {
        float *p_dist = dist + xIndex;
        long *p_ind = ind + xIndex;

        float max_dist = p_dist[0];
        p_ind[0] = 1;

        // Sort first k elements
        for (int l = 1; l < k; l++) {
            long curr_row = l * width;
            float curr_dist = p_dist[curr_row];
            if (curr_dist < max_dist) {
                int i = l - 1;
                while (i >= 0 && p_dist[i * width] > curr_dist) {
                    p_dist[(i + 1) * width] = p_dist[i * width];
                    p_ind[(i + 1) * width] = p_ind[i * width];
                    i--;
                }
                p_dist[(i + 1) * width] = curr_dist;
                p_ind[(i + 1) * width] = l + 1;
                max_dist = p_dist[(k - 1) * width];
            } else {
                p_ind[l * width] = l + 1;
            }
            max_dist = p_dist[l * width];
        }

        // Insert elements into k-th sorted list
        for (int l = k; l < height; l++) {
            float curr_dist = p_dist[l * width];
            if (curr_dist < max_dist) {
                int i = k - 1;
                while (i >= 0 && p_dist[i * width] > curr_dist) {
                    p_dist[(i + 1) * width] = p_dist[i * width];
                    p_ind[(i + 1) * width] = p_ind[i * width];
                    i--;
                }
                p_dist[(i + 1) * width] = curr_dist;
                p_ind[(i + 1) * width] = l + 1;
                max_dist = p_dist[(k - 1) * width];
            }
        }
    }
}