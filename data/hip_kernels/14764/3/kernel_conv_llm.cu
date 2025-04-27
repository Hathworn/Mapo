#include "hip/hip_runtime.h"
#include "includes.h"

__device__ void compute_conv(int row, int col, double2 *d_c, double *d_a, double2 *d_b, int *o_row_vect, int *o_col_vect, int ma, int na, int mb, int nb, int mc, int nc) {
    int count_row = o_row_vect[row];
    int count_col = o_col_vect[col];
    int k_row_idx = max(row - (ma - 1), 0); // Simplified calculation using max()
    int k_col_start_idx = max(col - (na - 1), 0); // Simplified calculation using max()
    int k_col_idx = k_col_start_idx;
    int i_row_idx = min(row, ma - 1); // Simplified calculation using min()
    int i_col_idx = min(col, na - 1); // Simplified calculation using min()
    int i_col_start_idx = i_col_idx;

    for (int row_idx = 0; row_idx < count_row; row_idx++) {
        for (int col_idx = 0; col_idx < count_col; col_idx++) {
            double a_val = d_a[i_col_idx + na * i_row_idx]; // Cache the value of d_a
            double2 b_val = d_b[k_col_idx + nb * k_row_idx]; // Cache the value of d_b
            d_c[col + nc * row].x += a_val * b_val.x; // Optimize repeated array access
            d_c[col + nc * row].y += a_val * b_val.y; // Optimize repeated array access

            k_col_idx++;
            i_col_idx--;
        }
        k_row_idx++;
        i_row_idx--;
        k_col_idx = k_col_start_idx;
        i_col_idx = i_col_start_idx;
    }
}

__global__ void kernel_conv(double2 *d_c, double *d_a, double2 *d_b, int *d_row_vect, int *d_col_vect, int ma, int na, int mb, int nb, int mc, int nc) {
    int idx = threadIdx.x + blockIdx.x * blockDim.x;
    int num_threads = gridDim.x * blockDim.x;

    for (int i = idx; i < (mc * nc); i += num_threads) {
        int rownum = i / nc;
        int colnum = i % nc;
        compute_conv(rownum, colnum, d_c, d_a, d_b, d_row_vect, d_col_vect, ma, na, mb, nb, mc, nc);
    }
}