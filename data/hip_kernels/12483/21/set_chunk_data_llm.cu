#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void set_chunk_data(int x, int y, double dx, double dy, double* cell_x, double* cell_y, double* cell_dx, double* cell_dy, double* vertex_x, double* vertex_y, double* volume, double* x_area, double* y_area)
{
    const int gid = blockIdx.x * blockDim.x + threadIdx.x;

    // Use different variable to optimize logic separation and reduce checks
    int cellLimit = max(x, y);

    // Unroll conditions and use branching to reduce diverging
    if (gid < cellLimit) {
        if (gid < x) {
            cell_x[gid] = 0.5 * (vertex_x[gid] + vertex_x[gid + 1]);
            cell_dx[gid] = dx;
        }

        if (gid < y) {
            cell_y[gid] = 0.5 * (vertex_y[gid] + vertex_y[gid + 1]);
            cell_dy[gid] = dy;
        }
    }

    // Avoid redundant computation for each condition
    int xy = x * y;
    if (gid < xy) {
        volume[gid] = dx * dy;
    }

    int xyPlusY = (x + 1) * y;
    if (gid < xyPlusY) {
        x_area[gid] = dy;
    }

    int xTimesYPlusOne = x * (y + 1);
    if (gid < xTimesYPlusOne) {
        y_area[gid] = dx;
    }
}