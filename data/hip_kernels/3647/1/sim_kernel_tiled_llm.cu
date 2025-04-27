#include "hip/hip_runtime.h"
#include "includes.h"

#define IDX2D(a, i, stride, j) ((a)[(i)*(stride) + (j)])

__global__ void sim_kernel_tiled(double *z, double *v, size_t nx, size_t ny, double dx2inv, double dy2inv, double dt) {
    extern __shared__ double z_tile[];

    const int block_mesh_x = blockDim.x * blockIdx.x + 1;
    const int block_mesh_y = blockDim.y * blockIdx.y + 1;

    const int mesh_xx = block_mesh_x + threadIdx.x;
    const int mesh_xy = block_mesh_y + threadIdx.y;

    // Load z values into shared memory
    if (mesh_xx < nx && mesh_xy < ny)
        z_tile[threadIdx.y * blockDim.x + threadIdx.x] = IDX2D(z, mesh_xy, nx, mesh_xx);
    __syncthreads();

    if (mesh_xx >= nx-1 || mesh_xy >= ny-1)
        return;

    double ax, ay;
    // Compute ax using shared memory when possible
    ax = dx2inv * (
        (threadIdx.x > 0 ? IDX2D(z_tile, threadIdx.y, blockDim.x, threadIdx.x - 1) : IDX2D(z, mesh_xy, nx, mesh_xx - 1)) +
        (threadIdx.x < blockDim.x - 1 ? IDX2D(z_tile, threadIdx.y, blockDim.x, threadIdx.x + 1) : IDX2D(z, mesh_xy, nx, mesh_xx + 1)) -
        2.0 * z_tile[threadIdx.y * blockDim.x + threadIdx.x]
    );

    // Compute ay using shared memory when possible
    ay = dy2inv * (
        (threadIdx.y > 0 ? IDX2D(z_tile, threadIdx.y - 1, blockDim.x, threadIdx.x) : IDX2D(z, mesh_xy - 1, nx, mesh_xx)) +
        (threadIdx.y < blockDim.y - 1 ? IDX2D(z_tile, threadIdx.y + 1, blockDim.x, threadIdx.x) : IDX2D(z, mesh_xy + 1, nx, mesh_xx)) -
        2.0 * z_tile[threadIdx.y * blockDim.x + threadIdx.x]
    );

    // Update v and z values
    const double v_val = IDX2D(v, mesh_xy, nx, mesh_xx) += (ax + ay) / 2.0 * dt;
    IDX2D(z, mesh_xy, nx, mesh_xx) += dt * v_val;
}