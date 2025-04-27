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

        // Iterate only over valid points within the given stride
        for (int i = id; i < valid_points_num; i += stride) {
            int pid = valid_points[i];
            double d_x = static_cast<double>(trans_x[pid]);
            double d_y = static_cast<double>(trans_y[pid]);
            double d_z = static_cast<double>(trans_z[pid]);

            double tmp_sg = 0.0;

            // Unroll computation to prevent repetitive memory access
            for (int j = starting_voxel_id[i]; j < starting_voxel_id[i + 1]; j++) {
                int vid = voxel_id[j];
                double tmp_ex = e_x_cov_x[j];

                // Avoid invalid computations by checking for NaN and range
                if (!(tmp_ex > 1.0 || tmp_ex < 0.0 || tmp_ex != tmp_ex)) {
                    tmp_ex *= gauss_d1;

                    double centroid_dx = d_x - centroid_x[vid];
                    double centroid_dy = d_y - centroid_y[vid];
                    double centroid_dz = d_z - centroid_z[vid];

                    tmp_sg += (centroid_dx * cov_dxd_pi_mat0[j] + 
                               centroid_dy * cov_dxd_pi_mat1[j] + 
                               centroid_dz * cov_dxd_pi_mat2[j]) * tmp_ex;
                }
            }

            // Store result in score_gradients
            sg[i] = tmp_sg;
        }
    }
}