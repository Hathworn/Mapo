#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void modified_insertion_sort(float * dist, int dist_pitch, int * index, int index_pitch, int width, int height, int k) {
    // Column position
    unsigned int xIndex = blockIdx.x * blockDim.x + threadIdx.x;

    // Do nothing if we are out of bounds
    if (xIndex >= width) return;

    // Pointer shift
    float * p_dist = dist + xIndex;
    int * p_index = index + xIndex;

    // Initialize the first index
    p_index[0] = 0;

    // Go through all points
    for (int i = 1; i < height; ++i) {

        // Store current distance and associated index
        float curr_dist = p_dist[i * dist_pitch];
        int curr_index = i;

        // Skip the current value if its index is >= k 
        // and if it's higher than the k-th already sorted smallest value
        if (i >= k && curr_dist >= p_dist[(k - 1) * dist_pitch]) {
            continue;
        }

        // Shift values (and indexes) higher than the current distance to the right
        // Optimize by unrolling the loop for better performance
        int j = min(i, k - 1);
        #pragma unroll
        for (; j > 0 && p_dist[(j - 1) * dist_pitch] > curr_dist; --j) {
            p_dist[j * dist_pitch] = p_dist[(j - 1) * dist_pitch];
            p_index[j * index_pitch] = p_index[(j - 1) * index_pitch];
        }

        // Write the current distance and index at their position
        p_dist[j * dist_pitch] = curr_dist;
        p_index[j * index_pitch] = curr_index;
    }
}