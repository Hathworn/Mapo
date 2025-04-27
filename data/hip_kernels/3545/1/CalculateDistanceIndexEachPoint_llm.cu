#include "hip/hip_runtime.h"
#include "includes.h"

#ifndef _ICP_KERNEL_H_
#define _ICP_KERNEL_H_

#define TILE_WIDTH 256

__global__ void CalculateDistanceIndexEachPoint(double point_x, double point_y, double point_z, double *data_x_d, double *data_y_d, double *data_z_d, int *bin_index_d, double *distance_d, int size_data) 
{
    int index = blockDim.x * blockIdx.x + threadIdx.x;
    
    // Check if index is within data bounds
    if (index < size_data) {
        double dx = data_x_d[index] - point_x;  // Calculate x distance
        double dy = data_y_d[index] - point_y;  // Calculate y distance
        double dz = data_z_d[index] - point_z;  // Calculate z distance

        // Store computed distance
        distance_d[index] = sqrt(dx * dx + dy * dy + dz * dz); 

        // Assign index
        bin_index_d[index] = index; 
    }
}

#endif // #ifndef _ICP_KERNEL_H_