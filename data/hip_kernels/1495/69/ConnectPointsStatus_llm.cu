#include "hip/hip_runtime.h"
#include "includes.h"
__global__ static void ConnectPointsStatus(int* PointType_BestN, int* ConnectStatus, int size, int rows, int ChooseBestN, int ConnectRadius)
{
    int id = blockIdx.x * blockDim.x + threadIdx.x;
    if (id >= size * rows * ChooseBestN) 
        return;

    int sizeIndex = id / (rows * ChooseBestN);
    int tempID = id % (rows * ChooseBestN);
    int rowIndex = tempID / ChooseBestN;
    int chooseIndex = tempID % ChooseBestN;

    if (PointType_BestN[sizeIndex * rows * ChooseBestN + rowIndex * ChooseBestN + chooseIndex] == -1)
        return;
    
    int currentPoint = PointType_BestN[sizeIndex * rows * ChooseBestN + rowIndex * ChooseBestN + chooseIndex];
    int finalPos = min(rowIndex + ConnectRadius, rows);

    for (int i = rowIndex + 1; i < finalPos; i++) {
        int baseIndex = sizeIndex * rows * ChooseBestN + i * ChooseBestN;
        for (int j = 0; j < ChooseBestN; j++) {
            int nextPoint = PointType_BestN[baseIndex + j];
            if (nextPoint != -1) {
                int diffX = currentPoint - nextPoint;
                int diffY = i - rowIndex;
                int Radius = diffX * diffX + diffY * diffY;

                if (Radius < ConnectRadius * ConnectRadius) {
                    int index = sizeIndex * rows * ChooseBestN * ConnectRadius * ChooseBestN + 
                                rowIndex * ChooseBestN * ConnectRadius * ChooseBestN + 
                                chooseIndex * ConnectRadius * ChooseBestN + 
                                (i - rowIndex) * ChooseBestN + 
                                j;
                    ConnectStatus[index] = Radius;
                }
            }
        }
    }
}