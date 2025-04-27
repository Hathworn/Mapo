#include "hip/hip_runtime.h"
#include "includes.h"

// Optimize to use shared memory and avoid redundant calculations.
__global__ void set_chunk_data_vertices(int x, int y, int halo_depth, double dx, double dy, double x_min, double y_min, double* vertex_x, double* vertex_y, double* vertex_dx, double* vertex_dy) {
    extern __shared__ double shared_mem[];
    double* shared_vertex_x_min = shared_mem;
    double* shared_vertex_y_min = shared_mem + blockDim.x;
    
    const int gid = blockIdx.x * blockDim.x + threadIdx.x;
    
    if(threadIdx.x == 0) {
        shared_vertex_x_min[0] = x_min - dx * halo_depth;
        shared_vertex_y_min[0] = y_min - dy * halo_depth;
    }
    
    __syncthreads();
    
    if (gid < x+1) {
        double local_x_min = shared_vertex_x_min[0];
        vertex_x[gid] = local_x_min + dx * gid;
        vertex_dx[gid] = dx; // Write once outside if condition
    }
    
    if (gid < y+1) {
        double local_y_min = shared_vertex_y_min[0];
        vertex_y[gid] = local_y_min + dy * gid;
        vertex_dy[gid] = dy; // Write once outside if condition
    }
}
```
