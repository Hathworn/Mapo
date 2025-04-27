#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void dist_calc(float *coord, int *close_num, int *close_flag, int *close_idx, int num_atom, int num_atom2) {
    // close_flag is a 1024 x num_atom2 int matrix initialized to 0.
    // close_idx: A num_atom x 200 int matrix, row i of which only the first close_num[i] elements are defined. (Otherwise it's -1).
    __shared__ float x_ref, y_ref, z_ref;
    __shared__ int temp[2048];

    // Calc distance
    for (int ii = blockIdx.x; ii < num_atom; ii += gridDim.x) {
        if (threadIdx.x == 0) {
            x_ref = coord[3 * ii];
            y_ref = coord[3 * ii + 1];
            z_ref = coord[3 * ii + 2];
        }
        int idy = ii % gridDim.x; // Determine row of close_flag this block updates
        __syncthreads();

        for (int jj = threadIdx.x; jj < num_atom; jj += blockDim.x) {
            float r2t = (coord[3 * jj] - x_ref) * (coord[3 * jj] - x_ref) +
                        (coord[3 * jj + 1] - y_ref) * (coord[3 * jj + 1] - y_ref) +
                        (coord[3 * jj + 2] - z_ref) * (coord[3 * jj + 2] - z_ref);

            if (r2t < 34.0) {
                close_flag[idy * num_atom2 + jj] = 1; // roughly 2 A + 2 A vdW + 2 * 1.8 A probe
            } else {
                close_flag[idy * num_atom2 + jj] = 0;
            }
            if (ii == jj) close_flag[idy * num_atom2 + jj] = 0;
        }
        __syncthreads();

        // Pre scan with optimized memory access
        int temp_sum = close_num[ii];
        int offset = 1;
        
        int idx = threadIdx.x;
        int idx2 = idx * 2;

        for (int jj = idx2; jj < num_atom2; jj += blockDim.x * 2) {
            temp[idx2] = close_flag[idy * num_atom2 + jj];
            temp[idx2 + 1] = close_flag[idy * num_atom2 + jj + 1];
        }
        
        for (int d = blockDim.x; d > 0; d >>= 1) { // up-sweep
            __syncthreads();
            if (idx < d) {
                int ai = offset * (idx2 + 1) - 1;
                int bi = offset * (idx2 + 2) - 1;
                temp[bi] += temp[ai];
            }
            offset *= 2;
        }
        
        __syncthreads();

        if (idx == 0) {
            close_num[ii] += temp[2 * blockDim.x - 1];
            temp[2 * blockDim.x - 1] = 0;
        }

        offset >>= 1;

        for (int d = 1; d < blockDim.x * 2; d *= 2) { // down-sweep
            __syncthreads();
            if (idx < d) {
                int ai = offset * (idx2 + 1) - 1;
                int bi = offset * (idx2 + 2) - 1;
                int t = temp[ai];
                temp[ai] = temp[bi];
                temp[bi] += t;
            }
            offset >>= 1;
        }

        __syncthreads();

        // Finally assign the indices
        if (close_flag[idy * num_atom2 + idx2] == 1) {
            close_idx[ii * 1024 + temp[idx2] + temp_sum] = idx2;
        }
        if (close_flag[idy * num_atom2 + idx2 + 1] == 1) {
            close_idx[ii * 1024 + temp[idx2 + 1] + temp_sum] = idx2 + 1;
        }
    }
}