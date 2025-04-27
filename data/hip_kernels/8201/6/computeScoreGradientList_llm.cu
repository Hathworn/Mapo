#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void computeScoreGradientList(float *trans_x, float *trans_y, float *trans_z, int *valid_points, int *starting_voxel_id, int *voxel_id, int valid_points_num, double *centroid_x, double *centroid_y, double *centroid_z, int voxel_num, double *e_x_cov_x, double *cov_dxd_pi, double gauss_d1, int valid_voxel_num, double *score_gradients)
{
    int id = threadIdx.x + blockIdx.x * blockDim.x;
    int stride = blockDim.x * gridDim.x;
    int col = blockIdx.y;
    
    if (col < 6) {
        double *sg = score_gradients + col * valid_points_num;
        double *cov_dxd_pi_mat0 = cov_dxd_pi + col * valid_voxel_num;
        double *cov_dxd_pi_mat1 = cov_dxd_pi_mat0 + 6 * valid_voxel_num;
        double *cov_dxd_pi_mat2 = cov_dxd_pi_mat1 + 6 * valid_voxel_num;
        
        // Process multiple points per thread to increase parallelism
        for (int i = id; i < valid_points_num; i += stride) {
#pragma unroll 4 // Unrolling to improve throughput
            for (int p = 0; p < 4 && i + p < valid_points_num; p++) {
                int pid = valid_points[i + p];
                double d_x = static_cast<double>(trans_x[pid]);
                double d_y = static_cast<double>(trans_y[pid]);
                double d_z = static_cast<double>(trans_z[pid]);
                double tmp_sg = 0.0;

                // Restrict calculations to ensure coalesced memory access
                for (int j = starting_voxel_id[i + p]; j < starting_voxel_id[i + p + 1]; j++) {
                    int vid = voxel_id[j];
                    double tmp_ex = e_x_cov_x[j];

                    // Optimize conditional check to avoid NaN evaluation
                    if (tmp_ex >= 0 && tmp_ex <= 1) {
                        tmp_ex *= gauss_d1;
                        // Precompute index calculation for performance
                        double dx = d_x - centroid_x[vid];
                        double dy = d_y - centroid_y[vid];
                        double dz = d_z - centroid_z[vid];

                        // Accumulate result
                        tmp_sg += (dx * cov_dxd_pi_mat0[j] + dy * cov_dxd_pi_mat1[j] + dz * cov_dxd_pi_mat2[j]) * tmp_ex;
                    }
                }

                sg[i + p] = tmp_sg; // Store result
            }
        }
    }
}