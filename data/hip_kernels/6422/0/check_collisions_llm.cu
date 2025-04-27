#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void check_collisions( float x1_robot, float y1_robot, float x2_robot, float y2_robot, float *x1_obs, float *y1_obs, float *x2_obs, float *y2_obs, bool *collisions, int *indexes)
{
    int obstacleId = blockIdx.x * blockDim.x + threadIdx.x; // Use global indexing for scalability

    // Access values only once for memory efficiency
    float x1o = x1_obs[obstacleId];
    float y1o = y1_obs[obstacleId];
    float x2o = x2_obs[obstacleId];
    float y2o = y2_obs[obstacleId];

    // Calculate collision using pre-loaded values
    bool xcol = ((x1o <= x1_robot && x1_robot <= x2o) || (x1o <= x2_robot && x2_robot <= x2o)) || (x1_robot <= x1o && x2_robot >= x2o);
    bool ycol = ((y1o <= y1_robot && y1_robot <= y2o) || (y1o <= y2_robot && y2_robot <= y2o)) || (y1_robot <= y1o && y2_robot >= y2o);

    collisions[obstacleId] = (xcol && ycol);
}