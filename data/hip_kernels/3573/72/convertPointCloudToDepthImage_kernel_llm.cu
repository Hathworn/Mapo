#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void convertPointCloudToDepthImage_kernel(unsigned int *depth_image, const float4 *point_cloud, int n_cols, int n_rows, int n_points, float nodal_point_x, float nodal_point_y, float focal_length_x, float focal_length_y, const float *T, const float *R) {
    const int ind = blockIdx.x * blockDim.x + threadIdx.x;

    if (ind < n_points) {
        // Fetch point
        float4 point = point_cloud[ind];

        // Transform to camera coordinates
        float x = R[0] * point.x + R[1] * point.y + R[2] * point.z + T[0];
        float y = R[3] * point.x + R[4] * point.y + R[5] * point.z + T[1];
        float z = R[6] * point.x + R[7] * point.y + R[8] * point.z + T[2];

        float inv_z = __frcp_rn(z); // Fast reciprocal

        // Project to image coordinates
        int x_pix = __float2int_rn(focal_length_x * x * inv_z + nodal_point_x);
        int y_pix = __float2int_rn(focal_length_y * y * inv_z + nodal_point_y);

        // Check and update if point is valid
        if (x_pix >= 0 && x_pix < n_cols && y_pix >= 0 && y_pix < n_rows) {
            int ind_out = y_pix * n_cols + x_pix;
            atomicMin(&depth_image[ind_out], (unsigned int)(point.z * 1000.0f)); // Use atomicMin for proper concurrency
        }
    }
}