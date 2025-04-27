#include "hip/hip_runtime.h"
#include "includes.h"
#define BLOCK_DIM 16

__global__ void cuInsertionSort(float *dist, int *ind, int width, int height, int k) {
    // Get unique thread index
    unsigned int xIndex = blockIdx.x * blockDim.x + threadIdx.x;
    
    if (xIndex < width) {
        float *p_dist = dist + xIndex;
        int *p_ind = ind + xIndex;
        float max_dist = p_dist[0];
        p_ind[0] = 1;

        // Part 1: Sort first k elements
        for (int l = 1; l < k; l++) {
            int curr_row = l * width;
            float curr_dist = p_dist[curr_row];
            if (curr_dist < max_dist) {
                int i = l - 1;
                for (int a = 0; a < l - 1; a++) {
                    if (p_dist[a * width] > curr_dist) {
                        i = a;
                        break;
                    }
                }
                for (int j = l; j > i; j--) {
                    p_dist[j * width] = p_dist[(j - 1) * width];
                    p_ind[j * width] = p_ind[(j - 1) * width];
                }
                p_dist[i * width] = curr_dist;
                p_ind[i * width] = l + 1;
            } else {
                p_ind[l * width] = l + 1;
            }
            // Update max distance
            max_dist = p_dist[curr_row];
        }

        // Part 2: Insert elements into k-th sorted elements
        int max_row = (k - 1) * width;
        for (int l = k; l < height; l++) {
            float curr_dist = p_dist[l * width];
            if (curr_dist < max_dist) {
                int i = k - 1;
                for (int a = 0; a < k - 1; a++) {
                    if (p_dist[a * width] > curr_dist) {
                        i = a;
                        break;
                    }
                }
                for (int j = k - 1; j > i; j--) {
                    p_dist[j * width] = p_dist[(j - 1) * width];
                    p_ind[j * width] = p_ind[(j - 1) * width];
                }
                p_dist[i * width] = curr_dist;
                p_ind[i * width] = l + 1;
                // Update max distance
                max_dist = p_dist[max_row];
            }
        }
    }
}