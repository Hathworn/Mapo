#include "hip/hip_runtime.h"
#include "includes.h"

#ifndef _ICP_KERNEL_H_
#define _ICP_KERNEL_H_

#define TILE_WIDTH 256

#endif // #ifndef _ICP_KERNEL_H_

__global__ void CalculateDistanceAllPoints(double * data_x_d, double * data_y_d, double * data_z_d, double * transformed_data_x_d, double * transformed_data_y_d, double * transformed_data_z_d, int * index_d, double * distance_d, int size_data)
{
    int i = blockIdx.x * blockDim.x + threadIdx.x;

    if(i < size_data)
    {
        int index = index_d[i];

        // Calculate squared distances first to avoid repeated computation
        double dx = data_x_d[index] - transformed_data_x_d[i];
        double dy = data_y_d[index] - transformed_data_y_d[i];
        double dz = data_z_d[index] - transformed_data_z_d[i];

        // Use constant memory when possible and minimize expensive sqrt operation
        distance_d[i] = sqrt(dx * dx + dy * dy + dz * dz);
    }
}