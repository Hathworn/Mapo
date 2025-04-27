#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void computeHessianListS0(float *trans_x, float *trans_y, float *trans_z, int *valid_points, int *starting_voxel_id, int *voxel_id, int valid_points_num, double *centroid_x, double *centroid_y, double *centroid_z, double *icov00, double *icov01, double *icov02, double *icov10, double *icov11, double *icov12, double *icov20, double *icov21, double *icov22, double *point_gradients, double *tmp_hessian, int valid_voxel_num)
{
    int id = threadIdx.x + blockIdx.x * blockDim.x; 
    int stride = blockDim.x * gridDim.x; 
    int col = blockIdx.y; 

    if (col < 6) {
        double *tmp_pg0 = point_gradients + col * valid_points_num;
        double *tmp_pg1 = tmp_pg0 + 6 * valid_points_num;
        double *tmp_pg2 = tmp_pg1 + 6 * valid_points_num;
        double *tmp_h = tmp_hessian + col * valid_voxel_num;

        // Use a shared memory buffer for centroids and inverse covariance
        __shared__ double s_centroid_x[256];
        __shared__ double s_centroid_y[256];
        __shared__ double s_centroid_z[256];
        __shared__ double s_icov00[256];
        __shared__ double s_icov01[256];
        __shared__ double s_icov02[256];
        __shared__ double s_icov10[256];
        __shared__ double s_icov11[256];
        __shared__ double s_icov12[256];
        __shared__ double s_icov20[256];
        __shared__ double s_icov21[256];
        __shared__ double s_icov22[256];

        for (int i = id; i < valid_points_num; i += stride) {
            int pid = valid_points[i];
            double d_x = static_cast<double>(trans_x[pid]);
            double d_y = static_cast<double>(trans_y[pid]);
            double d_z = static_cast<double>(trans_z[pid]);

            double pg0 = tmp_pg0[i];
            double pg1 = tmp_pg1[i];
            double pg2 = tmp_pg2[i];

            for (int j = starting_voxel_id[i]; j < starting_voxel_id[i + 1]; j++) {
                int vid = voxel_id[j];
                
                // Load data to shared memory (with bounds check)
                if (threadIdx.x < 256) {
                    s_centroid_x[threadIdx.x] = centroid_x[vid];
                    s_centroid_y[threadIdx.x] = centroid_y[vid];
                    s_centroid_z[threadIdx.x] = centroid_z[vid];
                    s_icov00[threadIdx.x] = icov00[vid];
                    s_icov01[threadIdx.x] = icov01[vid];
                    s_icov02[threadIdx.x] = icov02[vid];
                    s_icov10[threadIdx.x] = icov10[vid];
                    s_icov11[threadIdx.x] = icov11[vid];
                    s_icov12[threadIdx.x] = icov12[vid];
                    s_icov20[threadIdx.x] = icov20[vid];
                    s_icov21[threadIdx.x] = icov21[vid];
                    s_icov22[threadIdx.x] = icov22[vid];
                }
                __syncthreads();
                
                // Use shared memory
                tmp_h[j] = (d_x - s_centroid_x[threadIdx.x]) * (s_icov00[threadIdx.x] * pg0 + s_icov01[threadIdx.x] * pg1 + s_icov02[threadIdx.x] * pg2)
                         + (d_y - s_centroid_y[threadIdx.x]) * (s_icov10[threadIdx.x] * pg0 + s_icov11[threadIdx.x] * pg1 + s_icov12[threadIdx.x] * pg2)
                         + (d_z - s_centroid_z[threadIdx.x]) * (s_icov20[threadIdx.x] * pg0 + s_icov21[threadIdx.x] * pg1 + s_icov22[threadIdx.x] * pg2);
            }
        }
    }
}