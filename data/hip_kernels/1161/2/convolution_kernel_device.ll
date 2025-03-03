; ModuleID = '../data/hip_kernels/1161/2/main.cu'
source_filename = "../data/hip_kernels/1161/2/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@_ZZ18convolution_kernelPhS_iiE12input_shared = internal unnamed_addr addrspace(3) global [10 x [10 x i8]] undef, align 16

; Function Attrs: argmemonly mustprogress nocallback nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p5i8(i64 immarg, i8 addrspace(5)* nocapture) #0

; Function Attrs: argmemonly mustprogress nocallback nofree nosync nounwind willreturn
declare void @llvm.lifetime.end.p5i8(i64 immarg, i8 addrspace(5)* nocapture) #0

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z18convolution_kernelPhS_ii(i8 addrspace(1)* nocapture readonly %0, i8 addrspace(1)* nocapture writeonly %1, i32 %2, i32 %3) local_unnamed_addr #1 {
  %5 = alloca [256 x i32], align 16, addrspace(5)
  %6 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %7 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !4
  %8 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %9 = shl i32 %8, 3
  %10 = add i32 %9, %6
  %11 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %12 = shl i32 %11, 3
  %13 = add i32 %12, %7
  %14 = add nsw i32 %10, -1
  %15 = add nsw i32 %13, -1
  %16 = icmp slt i32 %10, 1
  %17 = icmp ult i32 %6, 8
  %18 = icmp ult i32 %7, 8
  %19 = select i1 %17, i1 %18, i1 false
  %20 = icmp slt i32 %10, %2
  %21 = icmp slt i32 %13, %3
  %22 = select i1 %20, i1 %21, i1 false
  %23 = icmp sgt i32 %10, %2
  %24 = icmp slt i32 %13, 1
  %25 = icmp sgt i32 %13, %3
  %26 = mul nsw i32 %14, %3
  %27 = add nsw i32 %26, %15
  %28 = mul nsw i32 %27, 3
  %29 = getelementptr inbounds [10 x [10 x i8]], [10 x [10 x i8]] addrspace(3)* @_ZZ18convolution_kernelPhS_iiE12input_shared, i32 0, i32 %6, i32 %7
  %30 = select i1 %16, i1 %24, i1 false
  %31 = xor i1 %16, true
  %32 = select i1 %31, i1 true, i1 %25
  %33 = mul nsw i32 %15, 3
  %34 = icmp sle i32 %10, %2
  %35 = select i1 %34, i1 %24, i1 false
  %36 = icmp sgt i32 %15, %3
  %37 = select i1 %34, i1 %36, i1 false
  %38 = icmp sgt i32 %14, %2
  %39 = select i1 %38, i1 %24, i1 false
  %40 = xor i1 %38, true
  %41 = select i1 %40, i1 true, i1 %25
  %42 = add nsw i32 %2, -1
  %43 = mul nsw i32 %42, %3
  %44 = add nsw i32 %43, %15
  %45 = mul nsw i32 %44, 3
  %46 = add nsw i32 %3, -1
  %47 = add nsw i32 %46, %43
  %48 = mul nsw i32 %47, 3
  %49 = mul i32 %3, 3
  %50 = mul i32 %49, %42
  %51 = mul i32 %49, %10
  %52 = mul i32 %49, %14
  %53 = bitcast [256 x i32] addrspace(5)* %5 to i8 addrspace(5)*
  %54 = mul nsw i32 %10, %3
  %55 = add nsw i32 %54, %13
  %56 = mul nsw i32 %55, 3
  %57 = select i1 %16, i1 true, i1 %23
  %58 = select i1 %57, i1 true, i1 %24
  %59 = select i1 %58, i1 true, i1 %25
  br i1 %59, label %63, label %60

60:                                               ; preds = %4
  %61 = sext i32 %28 to i64
  %62 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %61
  br label %93

63:                                               ; preds = %4
  br i1 %30, label %93, label %64

64:                                               ; preds = %63
  br i1 %32, label %68, label %65

65:                                               ; preds = %64
  %66 = sext i32 %33 to i64
  %67 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %66
  br label %93

68:                                               ; preds = %64
  br i1 %16, label %69, label %73

69:                                               ; preds = %68
  %70 = add i32 %49, -3
  %71 = sext i32 %70 to i64
  %72 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %71
  br label %93

73:                                               ; preds = %68
  br i1 %35, label %74, label %77

74:                                               ; preds = %73
  %75 = sext i32 %52 to i64
  %76 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %75
  br label %93

77:                                               ; preds = %73
  br i1 %37, label %78, label %82

78:                                               ; preds = %77
  %79 = add i32 %51, -3
  %80 = sext i32 %79 to i64
  %81 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %80
  br label %93

82:                                               ; preds = %77
  br i1 %39, label %83, label %86

83:                                               ; preds = %82
  %84 = sext i32 %50 to i64
  %85 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %84
  br label %93

86:                                               ; preds = %82
  br i1 %41, label %90, label %87

87:                                               ; preds = %86
  %88 = sext i32 %45 to i64
  %89 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %88
  br label %93

90:                                               ; preds = %86
  %91 = sext i32 %48 to i64
  %92 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %91
  br label %93

93:                                               ; preds = %63, %69, %78, %87, %90, %83, %74, %65, %60
  %94 = phi i8 addrspace(1)* [ %72, %69 ], [ %81, %78 ], [ %89, %87 ], [ %92, %90 ], [ %85, %83 ], [ %76, %74 ], [ %67, %65 ], [ %62, %60 ], [ %0, %63 ]
  %95 = load i8, i8 addrspace(1)* %94, align 1, !tbaa !5
  store i8 %95, i8 addrspace(3)* %29, align 1, !tbaa !5
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  br i1 %19, label %96, label %276

96:                                               ; preds = %93
  call void @llvm.lifetime.start.p5i8(i64 1024, i8 addrspace(5)* %53) #4
  br label %97

97:                                               ; preds = %97, %96
  %98 = phi i32 [ 0, %96 ], [ %162, %97 ]
  %99 = getelementptr inbounds [256 x i32], [256 x i32] addrspace(5)* %5, i32 0, i32 %98
  store i32 0, i32 addrspace(5)* %99, align 16, !tbaa !8
  %100 = or i32 %98, 1
  %101 = getelementptr inbounds [256 x i32], [256 x i32] addrspace(5)* %5, i32 0, i32 %100
  store i32 0, i32 addrspace(5)* %101, align 4, !tbaa !8
  %102 = or i32 %98, 2
  %103 = getelementptr inbounds [256 x i32], [256 x i32] addrspace(5)* %5, i32 0, i32 %102
  store i32 0, i32 addrspace(5)* %103, align 8, !tbaa !8
  %104 = or i32 %98, 3
  %105 = getelementptr inbounds [256 x i32], [256 x i32] addrspace(5)* %5, i32 0, i32 %104
  store i32 0, i32 addrspace(5)* %105, align 4, !tbaa !8
  %106 = or i32 %98, 4
  %107 = getelementptr inbounds [256 x i32], [256 x i32] addrspace(5)* %5, i32 0, i32 %106
  store i32 0, i32 addrspace(5)* %107, align 16, !tbaa !8
  %108 = or i32 %98, 5
  %109 = getelementptr inbounds [256 x i32], [256 x i32] addrspace(5)* %5, i32 0, i32 %108
  store i32 0, i32 addrspace(5)* %109, align 4, !tbaa !8
  %110 = or i32 %98, 6
  %111 = getelementptr inbounds [256 x i32], [256 x i32] addrspace(5)* %5, i32 0, i32 %110
  store i32 0, i32 addrspace(5)* %111, align 8, !tbaa !8
  %112 = or i32 %98, 7
  %113 = getelementptr inbounds [256 x i32], [256 x i32] addrspace(5)* %5, i32 0, i32 %112
  store i32 0, i32 addrspace(5)* %113, align 4, !tbaa !8
  %114 = or i32 %98, 8
  %115 = getelementptr inbounds [256 x i32], [256 x i32] addrspace(5)* %5, i32 0, i32 %114
  store i32 0, i32 addrspace(5)* %115, align 16, !tbaa !8
  %116 = or i32 %98, 9
  %117 = getelementptr inbounds [256 x i32], [256 x i32] addrspace(5)* %5, i32 0, i32 %116
  store i32 0, i32 addrspace(5)* %117, align 4, !tbaa !8
  %118 = or i32 %98, 10
  %119 = getelementptr inbounds [256 x i32], [256 x i32] addrspace(5)* %5, i32 0, i32 %118
  store i32 0, i32 addrspace(5)* %119, align 8, !tbaa !8
  %120 = or i32 %98, 11
  %121 = getelementptr inbounds [256 x i32], [256 x i32] addrspace(5)* %5, i32 0, i32 %120
  store i32 0, i32 addrspace(5)* %121, align 4, !tbaa !8
  %122 = or i32 %98, 12
  %123 = getelementptr inbounds [256 x i32], [256 x i32] addrspace(5)* %5, i32 0, i32 %122
  store i32 0, i32 addrspace(5)* %123, align 16, !tbaa !8
  %124 = or i32 %98, 13
  %125 = getelementptr inbounds [256 x i32], [256 x i32] addrspace(5)* %5, i32 0, i32 %124
  store i32 0, i32 addrspace(5)* %125, align 4, !tbaa !8
  %126 = or i32 %98, 14
  %127 = getelementptr inbounds [256 x i32], [256 x i32] addrspace(5)* %5, i32 0, i32 %126
  store i32 0, i32 addrspace(5)* %127, align 8, !tbaa !8
  %128 = or i32 %98, 15
  %129 = getelementptr inbounds [256 x i32], [256 x i32] addrspace(5)* %5, i32 0, i32 %128
  store i32 0, i32 addrspace(5)* %129, align 4, !tbaa !8
  %130 = or i32 %98, 16
  %131 = getelementptr inbounds [256 x i32], [256 x i32] addrspace(5)* %5, i32 0, i32 %130
  store i32 0, i32 addrspace(5)* %131, align 16, !tbaa !8
  %132 = or i32 %98, 17
  %133 = getelementptr inbounds [256 x i32], [256 x i32] addrspace(5)* %5, i32 0, i32 %132
  store i32 0, i32 addrspace(5)* %133, align 4, !tbaa !8
  %134 = or i32 %98, 18
  %135 = getelementptr inbounds [256 x i32], [256 x i32] addrspace(5)* %5, i32 0, i32 %134
  store i32 0, i32 addrspace(5)* %135, align 8, !tbaa !8
  %136 = or i32 %98, 19
  %137 = getelementptr inbounds [256 x i32], [256 x i32] addrspace(5)* %5, i32 0, i32 %136
  store i32 0, i32 addrspace(5)* %137, align 4, !tbaa !8
  %138 = or i32 %98, 20
  %139 = getelementptr inbounds [256 x i32], [256 x i32] addrspace(5)* %5, i32 0, i32 %138
  store i32 0, i32 addrspace(5)* %139, align 16, !tbaa !8
  %140 = or i32 %98, 21
  %141 = getelementptr inbounds [256 x i32], [256 x i32] addrspace(5)* %5, i32 0, i32 %140
  store i32 0, i32 addrspace(5)* %141, align 4, !tbaa !8
  %142 = or i32 %98, 22
  %143 = getelementptr inbounds [256 x i32], [256 x i32] addrspace(5)* %5, i32 0, i32 %142
  store i32 0, i32 addrspace(5)* %143, align 8, !tbaa !8
  %144 = or i32 %98, 23
  %145 = getelementptr inbounds [256 x i32], [256 x i32] addrspace(5)* %5, i32 0, i32 %144
  store i32 0, i32 addrspace(5)* %145, align 4, !tbaa !8
  %146 = or i32 %98, 24
  %147 = getelementptr inbounds [256 x i32], [256 x i32] addrspace(5)* %5, i32 0, i32 %146
  store i32 0, i32 addrspace(5)* %147, align 16, !tbaa !8
  %148 = or i32 %98, 25
  %149 = getelementptr inbounds [256 x i32], [256 x i32] addrspace(5)* %5, i32 0, i32 %148
  store i32 0, i32 addrspace(5)* %149, align 4, !tbaa !8
  %150 = or i32 %98, 26
  %151 = getelementptr inbounds [256 x i32], [256 x i32] addrspace(5)* %5, i32 0, i32 %150
  store i32 0, i32 addrspace(5)* %151, align 8, !tbaa !8
  %152 = or i32 %98, 27
  %153 = getelementptr inbounds [256 x i32], [256 x i32] addrspace(5)* %5, i32 0, i32 %152
  store i32 0, i32 addrspace(5)* %153, align 4, !tbaa !8
  %154 = or i32 %98, 28
  %155 = getelementptr inbounds [256 x i32], [256 x i32] addrspace(5)* %5, i32 0, i32 %154
  store i32 0, i32 addrspace(5)* %155, align 16, !tbaa !8
  %156 = or i32 %98, 29
  %157 = getelementptr inbounds [256 x i32], [256 x i32] addrspace(5)* %5, i32 0, i32 %156
  store i32 0, i32 addrspace(5)* %157, align 4, !tbaa !8
  %158 = or i32 %98, 30
  %159 = getelementptr inbounds [256 x i32], [256 x i32] addrspace(5)* %5, i32 0, i32 %158
  store i32 0, i32 addrspace(5)* %159, align 8, !tbaa !8
  %160 = or i32 %98, 31
  %161 = getelementptr inbounds [256 x i32], [256 x i32] addrspace(5)* %5, i32 0, i32 %160
  store i32 0, i32 addrspace(5)* %161, align 4, !tbaa !8
  %162 = add nuw nsw i32 %98, 32
  %163 = icmp eq i32 %162, 256
  br i1 %163, label %164, label %97, !llvm.loop !10

164:                                              ; preds = %97
  %165 = load i8, i8 addrspace(3)* %29, align 1, !tbaa !5
  %166 = zext i8 %165 to i32
  %167 = getelementptr inbounds [256 x i32], [256 x i32] addrspace(5)* %5, i32 0, i32 %166
  %168 = load i32, i32 addrspace(5)* %167, align 4, !tbaa !8
  %169 = add nsw i32 %168, 1
  store i32 %169, i32 addrspace(5)* %167, align 4, !tbaa !8
  %170 = add nuw nsw i32 %7, 1
  %171 = getelementptr inbounds [10 x [10 x i8]], [10 x [10 x i8]] addrspace(3)* @_ZZ18convolution_kernelPhS_iiE12input_shared, i32 0, i32 %6, i32 %170
  %172 = load i8, i8 addrspace(3)* %171, align 1, !tbaa !5
  %173 = zext i8 %172 to i32
  %174 = getelementptr inbounds [256 x i32], [256 x i32] addrspace(5)* %5, i32 0, i32 %173
  %175 = load i32, i32 addrspace(5)* %174, align 4, !tbaa !8
  %176 = add nsw i32 %175, 1
  store i32 %176, i32 addrspace(5)* %174, align 4, !tbaa !8
  %177 = add nuw nsw i32 %7, 2
  %178 = getelementptr inbounds [10 x [10 x i8]], [10 x [10 x i8]] addrspace(3)* @_ZZ18convolution_kernelPhS_iiE12input_shared, i32 0, i32 %6, i32 %177
  %179 = load i8, i8 addrspace(3)* %178, align 1, !tbaa !5
  %180 = zext i8 %179 to i32
  %181 = getelementptr inbounds [256 x i32], [256 x i32] addrspace(5)* %5, i32 0, i32 %180
  %182 = load i32, i32 addrspace(5)* %181, align 4, !tbaa !8
  %183 = add nsw i32 %182, 1
  store i32 %183, i32 addrspace(5)* %181, align 4, !tbaa !8
  %184 = add nuw nsw i32 %6, 1
  %185 = getelementptr inbounds [10 x [10 x i8]], [10 x [10 x i8]] addrspace(3)* @_ZZ18convolution_kernelPhS_iiE12input_shared, i32 0, i32 %184, i32 %7
  %186 = load i8, i8 addrspace(3)* %185, align 1, !tbaa !5
  %187 = zext i8 %186 to i32
  %188 = getelementptr inbounds [256 x i32], [256 x i32] addrspace(5)* %5, i32 0, i32 %187
  %189 = load i32, i32 addrspace(5)* %188, align 4, !tbaa !8
  %190 = add nsw i32 %189, 1
  store i32 %190, i32 addrspace(5)* %188, align 4, !tbaa !8
  %191 = getelementptr inbounds [10 x [10 x i8]], [10 x [10 x i8]] addrspace(3)* @_ZZ18convolution_kernelPhS_iiE12input_shared, i32 0, i32 %184, i32 %170
  %192 = load i8, i8 addrspace(3)* %191, align 1, !tbaa !5
  %193 = zext i8 %192 to i32
  %194 = getelementptr inbounds [256 x i32], [256 x i32] addrspace(5)* %5, i32 0, i32 %193
  %195 = load i32, i32 addrspace(5)* %194, align 4, !tbaa !8
  %196 = add nsw i32 %195, 1
  store i32 %196, i32 addrspace(5)* %194, align 4, !tbaa !8
  %197 = getelementptr inbounds [10 x [10 x i8]], [10 x [10 x i8]] addrspace(3)* @_ZZ18convolution_kernelPhS_iiE12input_shared, i32 0, i32 %184, i32 %177
  %198 = load i8, i8 addrspace(3)* %197, align 1, !tbaa !5
  %199 = zext i8 %198 to i32
  %200 = getelementptr inbounds [256 x i32], [256 x i32] addrspace(5)* %5, i32 0, i32 %199
  %201 = load i32, i32 addrspace(5)* %200, align 4, !tbaa !8
  %202 = add nsw i32 %201, 1
  store i32 %202, i32 addrspace(5)* %200, align 4, !tbaa !8
  %203 = add nuw nsw i32 %6, 2
  %204 = getelementptr inbounds [10 x [10 x i8]], [10 x [10 x i8]] addrspace(3)* @_ZZ18convolution_kernelPhS_iiE12input_shared, i32 0, i32 %203, i32 %7
  %205 = load i8, i8 addrspace(3)* %204, align 1, !tbaa !5
  %206 = zext i8 %205 to i32
  %207 = getelementptr inbounds [256 x i32], [256 x i32] addrspace(5)* %5, i32 0, i32 %206
  %208 = load i32, i32 addrspace(5)* %207, align 4, !tbaa !8
  %209 = add nsw i32 %208, 1
  store i32 %209, i32 addrspace(5)* %207, align 4, !tbaa !8
  %210 = getelementptr inbounds [10 x [10 x i8]], [10 x [10 x i8]] addrspace(3)* @_ZZ18convolution_kernelPhS_iiE12input_shared, i32 0, i32 %203, i32 %170
  %211 = load i8, i8 addrspace(3)* %210, align 1, !tbaa !5
  %212 = zext i8 %211 to i32
  %213 = getelementptr inbounds [256 x i32], [256 x i32] addrspace(5)* %5, i32 0, i32 %212
  %214 = load i32, i32 addrspace(5)* %213, align 4, !tbaa !8
  %215 = add nsw i32 %214, 1
  store i32 %215, i32 addrspace(5)* %213, align 4, !tbaa !8
  %216 = getelementptr inbounds [10 x [10 x i8]], [10 x [10 x i8]] addrspace(3)* @_ZZ18convolution_kernelPhS_iiE12input_shared, i32 0, i32 %203, i32 %177
  %217 = load i8, i8 addrspace(3)* %216, align 1, !tbaa !5
  %218 = zext i8 %217 to i32
  %219 = getelementptr inbounds [256 x i32], [256 x i32] addrspace(5)* %5, i32 0, i32 %218
  %220 = load i32, i32 addrspace(5)* %219, align 4, !tbaa !8
  %221 = add nsw i32 %220, 1
  store i32 %221, i32 addrspace(5)* %219, align 4, !tbaa !8
  br label %222

222:                                              ; preds = %271, %164
  %223 = phi i32 [ 0, %164 ], [ %269, %271 ]
  %224 = phi i32 [ 0, %164 ], [ %272, %271 ]
  %225 = getelementptr inbounds [256 x i32], [256 x i32] addrspace(5)* %5, i32 0, i32 %224
  %226 = load i32, i32 addrspace(5)* %225, align 16, !tbaa !8
  %227 = add nsw i32 %226, %223
  %228 = icmp sgt i32 %227, 4
  br i1 %228, label %274, label %229

229:                                              ; preds = %222
  %230 = or i32 %224, 1
  %231 = getelementptr inbounds [256 x i32], [256 x i32] addrspace(5)* %5, i32 0, i32 %230
  %232 = load i32, i32 addrspace(5)* %231, align 4, !tbaa !8
  %233 = add nsw i32 %232, %227
  %234 = icmp sgt i32 %233, 4
  br i1 %234, label %274, label %235

235:                                              ; preds = %229
  %236 = or i32 %224, 2
  %237 = getelementptr inbounds [256 x i32], [256 x i32] addrspace(5)* %5, i32 0, i32 %236
  %238 = load i32, i32 addrspace(5)* %237, align 8, !tbaa !8
  %239 = add nsw i32 %238, %233
  %240 = icmp sgt i32 %239, 4
  br i1 %240, label %274, label %241

241:                                              ; preds = %235
  %242 = or i32 %224, 3
  %243 = getelementptr inbounds [256 x i32], [256 x i32] addrspace(5)* %5, i32 0, i32 %242
  %244 = load i32, i32 addrspace(5)* %243, align 4, !tbaa !8
  %245 = add nsw i32 %244, %239
  %246 = icmp sgt i32 %245, 4
  br i1 %246, label %274, label %247

247:                                              ; preds = %241
  %248 = or i32 %224, 4
  %249 = getelementptr inbounds [256 x i32], [256 x i32] addrspace(5)* %5, i32 0, i32 %248
  %250 = load i32, i32 addrspace(5)* %249, align 16, !tbaa !8
  %251 = add nsw i32 %250, %245
  %252 = icmp sgt i32 %251, 4
  br i1 %252, label %274, label %253

253:                                              ; preds = %247
  %254 = or i32 %224, 5
  %255 = getelementptr inbounds [256 x i32], [256 x i32] addrspace(5)* %5, i32 0, i32 %254
  %256 = load i32, i32 addrspace(5)* %255, align 4, !tbaa !8
  %257 = add nsw i32 %256, %251
  %258 = icmp sgt i32 %257, 4
  br i1 %258, label %274, label %259

259:                                              ; preds = %253
  %260 = or i32 %224, 6
  %261 = getelementptr inbounds [256 x i32], [256 x i32] addrspace(5)* %5, i32 0, i32 %260
  %262 = load i32, i32 addrspace(5)* %261, align 8, !tbaa !8
  %263 = add nsw i32 %262, %257
  %264 = icmp sgt i32 %263, 4
  br i1 %264, label %274, label %265

265:                                              ; preds = %259
  %266 = or i32 %224, 7
  %267 = getelementptr inbounds [256 x i32], [256 x i32] addrspace(5)* %5, i32 0, i32 %266
  %268 = load i32, i32 addrspace(5)* %267, align 4, !tbaa !8
  %269 = add nsw i32 %268, %263
  %270 = icmp sgt i32 %269, 4
  br i1 %270, label %274, label %271

271:                                              ; preds = %265
  %272 = add nuw nsw i32 %224, 8
  %273 = icmp eq i32 %272, 256
  br i1 %273, label %274, label %222, !llvm.loop !12

274:                                              ; preds = %271, %265, %259, %253, %247, %241, %235, %229, %222
  %275 = phi i32 [ %224, %222 ], [ %230, %229 ], [ %236, %235 ], [ %242, %241 ], [ %248, %247 ], [ %254, %253 ], [ %260, %259 ], [ %266, %265 ], [ 256, %271 ]
  call void @llvm.lifetime.end.p5i8(i64 1024, i8 addrspace(5)* %53) #4
  br label %276

276:                                              ; preds = %274, %93
  %277 = phi i32 [ %275, %274 ], [ undef, %93 ]
  br i1 %22, label %278, label %282

278:                                              ; preds = %276
  %279 = trunc i32 %277 to i8
  %280 = sext i32 %56 to i64
  %281 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 %280
  store i8 %279, i8 addrspace(1)* %281, align 1, !tbaa !5
  br label %282

282:                                              ; preds = %278, %276
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  br i1 %59, label %286, label %283

283:                                              ; preds = %282
  %284 = add nsw i32 %28, 1
  %285 = sext i32 %284 to i64
  br label %314

286:                                              ; preds = %282
  br i1 %30, label %314, label %287

287:                                              ; preds = %286
  br i1 %32, label %291, label %288

288:                                              ; preds = %287
  %289 = add nsw i32 %33, 1
  %290 = sext i32 %289 to i64
  br label %314

291:                                              ; preds = %287
  br i1 %16, label %311, label %292

292:                                              ; preds = %291
  br i1 %35, label %308, label %293

293:                                              ; preds = %292
  br i1 %37, label %305, label %294

294:                                              ; preds = %293
  br i1 %39, label %302, label %295

295:                                              ; preds = %294
  br i1 %41, label %299, label %296

296:                                              ; preds = %295
  %297 = add nsw i32 %45, 1
  %298 = sext i32 %297 to i64
  br label %314

299:                                              ; preds = %295
  %300 = add nsw i32 %48, 1
  %301 = sext i32 %300 to i64
  br label %314

302:                                              ; preds = %294
  %303 = add nsw i32 %50, 1
  %304 = sext i32 %303 to i64
  br label %314

305:                                              ; preds = %293
  %306 = add i32 %51, -2
  %307 = sext i32 %306 to i64
  br label %314

308:                                              ; preds = %292
  %309 = add nsw i32 %52, 1
  %310 = sext i32 %309 to i64
  br label %314

311:                                              ; preds = %291
  %312 = add i32 %49, -2
  %313 = sext i32 %312 to i64
  br label %314

314:                                              ; preds = %286, %311, %308, %305, %302, %299, %296, %288, %283
  %315 = phi i64 [ %313, %311 ], [ %310, %308 ], [ %307, %305 ], [ %304, %302 ], [ %301, %299 ], [ %298, %296 ], [ %290, %288 ], [ %285, %283 ], [ 1, %286 ]
  %316 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %315
  %317 = load i8, i8 addrspace(1)* %316, align 1, !tbaa !5
  store i8 %317, i8 addrspace(3)* %29, align 1, !tbaa !5
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  br i1 %19, label %318, label %498

318:                                              ; preds = %314
  call void @llvm.lifetime.start.p5i8(i64 1024, i8 addrspace(5)* %53) #4
  br label %319

319:                                              ; preds = %319, %318
  %320 = phi i32 [ 0, %318 ], [ %384, %319 ]
  %321 = getelementptr inbounds [256 x i32], [256 x i32] addrspace(5)* %5, i32 0, i32 %320
  store i32 0, i32 addrspace(5)* %321, align 16, !tbaa !8
  %322 = or i32 %320, 1
  %323 = getelementptr inbounds [256 x i32], [256 x i32] addrspace(5)* %5, i32 0, i32 %322
  store i32 0, i32 addrspace(5)* %323, align 4, !tbaa !8
  %324 = or i32 %320, 2
  %325 = getelementptr inbounds [256 x i32], [256 x i32] addrspace(5)* %5, i32 0, i32 %324
  store i32 0, i32 addrspace(5)* %325, align 8, !tbaa !8
  %326 = or i32 %320, 3
  %327 = getelementptr inbounds [256 x i32], [256 x i32] addrspace(5)* %5, i32 0, i32 %326
  store i32 0, i32 addrspace(5)* %327, align 4, !tbaa !8
  %328 = or i32 %320, 4
  %329 = getelementptr inbounds [256 x i32], [256 x i32] addrspace(5)* %5, i32 0, i32 %328
  store i32 0, i32 addrspace(5)* %329, align 16, !tbaa !8
  %330 = or i32 %320, 5
  %331 = getelementptr inbounds [256 x i32], [256 x i32] addrspace(5)* %5, i32 0, i32 %330
  store i32 0, i32 addrspace(5)* %331, align 4, !tbaa !8
  %332 = or i32 %320, 6
  %333 = getelementptr inbounds [256 x i32], [256 x i32] addrspace(5)* %5, i32 0, i32 %332
  store i32 0, i32 addrspace(5)* %333, align 8, !tbaa !8
  %334 = or i32 %320, 7
  %335 = getelementptr inbounds [256 x i32], [256 x i32] addrspace(5)* %5, i32 0, i32 %334
  store i32 0, i32 addrspace(5)* %335, align 4, !tbaa !8
  %336 = or i32 %320, 8
  %337 = getelementptr inbounds [256 x i32], [256 x i32] addrspace(5)* %5, i32 0, i32 %336
  store i32 0, i32 addrspace(5)* %337, align 16, !tbaa !8
  %338 = or i32 %320, 9
  %339 = getelementptr inbounds [256 x i32], [256 x i32] addrspace(5)* %5, i32 0, i32 %338
  store i32 0, i32 addrspace(5)* %339, align 4, !tbaa !8
  %340 = or i32 %320, 10
  %341 = getelementptr inbounds [256 x i32], [256 x i32] addrspace(5)* %5, i32 0, i32 %340
  store i32 0, i32 addrspace(5)* %341, align 8, !tbaa !8
  %342 = or i32 %320, 11
  %343 = getelementptr inbounds [256 x i32], [256 x i32] addrspace(5)* %5, i32 0, i32 %342
  store i32 0, i32 addrspace(5)* %343, align 4, !tbaa !8
  %344 = or i32 %320, 12
  %345 = getelementptr inbounds [256 x i32], [256 x i32] addrspace(5)* %5, i32 0, i32 %344
  store i32 0, i32 addrspace(5)* %345, align 16, !tbaa !8
  %346 = or i32 %320, 13
  %347 = getelementptr inbounds [256 x i32], [256 x i32] addrspace(5)* %5, i32 0, i32 %346
  store i32 0, i32 addrspace(5)* %347, align 4, !tbaa !8
  %348 = or i32 %320, 14
  %349 = getelementptr inbounds [256 x i32], [256 x i32] addrspace(5)* %5, i32 0, i32 %348
  store i32 0, i32 addrspace(5)* %349, align 8, !tbaa !8
  %350 = or i32 %320, 15
  %351 = getelementptr inbounds [256 x i32], [256 x i32] addrspace(5)* %5, i32 0, i32 %350
  store i32 0, i32 addrspace(5)* %351, align 4, !tbaa !8
  %352 = or i32 %320, 16
  %353 = getelementptr inbounds [256 x i32], [256 x i32] addrspace(5)* %5, i32 0, i32 %352
  store i32 0, i32 addrspace(5)* %353, align 16, !tbaa !8
  %354 = or i32 %320, 17
  %355 = getelementptr inbounds [256 x i32], [256 x i32] addrspace(5)* %5, i32 0, i32 %354
  store i32 0, i32 addrspace(5)* %355, align 4, !tbaa !8
  %356 = or i32 %320, 18
  %357 = getelementptr inbounds [256 x i32], [256 x i32] addrspace(5)* %5, i32 0, i32 %356
  store i32 0, i32 addrspace(5)* %357, align 8, !tbaa !8
  %358 = or i32 %320, 19
  %359 = getelementptr inbounds [256 x i32], [256 x i32] addrspace(5)* %5, i32 0, i32 %358
  store i32 0, i32 addrspace(5)* %359, align 4, !tbaa !8
  %360 = or i32 %320, 20
  %361 = getelementptr inbounds [256 x i32], [256 x i32] addrspace(5)* %5, i32 0, i32 %360
  store i32 0, i32 addrspace(5)* %361, align 16, !tbaa !8
  %362 = or i32 %320, 21
  %363 = getelementptr inbounds [256 x i32], [256 x i32] addrspace(5)* %5, i32 0, i32 %362
  store i32 0, i32 addrspace(5)* %363, align 4, !tbaa !8
  %364 = or i32 %320, 22
  %365 = getelementptr inbounds [256 x i32], [256 x i32] addrspace(5)* %5, i32 0, i32 %364
  store i32 0, i32 addrspace(5)* %365, align 8, !tbaa !8
  %366 = or i32 %320, 23
  %367 = getelementptr inbounds [256 x i32], [256 x i32] addrspace(5)* %5, i32 0, i32 %366
  store i32 0, i32 addrspace(5)* %367, align 4, !tbaa !8
  %368 = or i32 %320, 24
  %369 = getelementptr inbounds [256 x i32], [256 x i32] addrspace(5)* %5, i32 0, i32 %368
  store i32 0, i32 addrspace(5)* %369, align 16, !tbaa !8
  %370 = or i32 %320, 25
  %371 = getelementptr inbounds [256 x i32], [256 x i32] addrspace(5)* %5, i32 0, i32 %370
  store i32 0, i32 addrspace(5)* %371, align 4, !tbaa !8
  %372 = or i32 %320, 26
  %373 = getelementptr inbounds [256 x i32], [256 x i32] addrspace(5)* %5, i32 0, i32 %372
  store i32 0, i32 addrspace(5)* %373, align 8, !tbaa !8
  %374 = or i32 %320, 27
  %375 = getelementptr inbounds [256 x i32], [256 x i32] addrspace(5)* %5, i32 0, i32 %374
  store i32 0, i32 addrspace(5)* %375, align 4, !tbaa !8
  %376 = or i32 %320, 28
  %377 = getelementptr inbounds [256 x i32], [256 x i32] addrspace(5)* %5, i32 0, i32 %376
  store i32 0, i32 addrspace(5)* %377, align 16, !tbaa !8
  %378 = or i32 %320, 29
  %379 = getelementptr inbounds [256 x i32], [256 x i32] addrspace(5)* %5, i32 0, i32 %378
  store i32 0, i32 addrspace(5)* %379, align 4, !tbaa !8
  %380 = or i32 %320, 30
  %381 = getelementptr inbounds [256 x i32], [256 x i32] addrspace(5)* %5, i32 0, i32 %380
  store i32 0, i32 addrspace(5)* %381, align 8, !tbaa !8
  %382 = or i32 %320, 31
  %383 = getelementptr inbounds [256 x i32], [256 x i32] addrspace(5)* %5, i32 0, i32 %382
  store i32 0, i32 addrspace(5)* %383, align 4, !tbaa !8
  %384 = add nuw nsw i32 %320, 32
  %385 = icmp eq i32 %384, 256
  br i1 %385, label %386, label %319, !llvm.loop !10

386:                                              ; preds = %319
  %387 = load i8, i8 addrspace(3)* %29, align 1, !tbaa !5
  %388 = zext i8 %387 to i32
  %389 = getelementptr inbounds [256 x i32], [256 x i32] addrspace(5)* %5, i32 0, i32 %388
  %390 = load i32, i32 addrspace(5)* %389, align 4, !tbaa !8
  %391 = add nsw i32 %390, 1
  store i32 %391, i32 addrspace(5)* %389, align 4, !tbaa !8
  %392 = add nuw nsw i32 %7, 1
  %393 = getelementptr inbounds [10 x [10 x i8]], [10 x [10 x i8]] addrspace(3)* @_ZZ18convolution_kernelPhS_iiE12input_shared, i32 0, i32 %6, i32 %392
  %394 = load i8, i8 addrspace(3)* %393, align 1, !tbaa !5
  %395 = zext i8 %394 to i32
  %396 = getelementptr inbounds [256 x i32], [256 x i32] addrspace(5)* %5, i32 0, i32 %395
  %397 = load i32, i32 addrspace(5)* %396, align 4, !tbaa !8
  %398 = add nsw i32 %397, 1
  store i32 %398, i32 addrspace(5)* %396, align 4, !tbaa !8
  %399 = add nuw nsw i32 %7, 2
  %400 = getelementptr inbounds [10 x [10 x i8]], [10 x [10 x i8]] addrspace(3)* @_ZZ18convolution_kernelPhS_iiE12input_shared, i32 0, i32 %6, i32 %399
  %401 = load i8, i8 addrspace(3)* %400, align 1, !tbaa !5
  %402 = zext i8 %401 to i32
  %403 = getelementptr inbounds [256 x i32], [256 x i32] addrspace(5)* %5, i32 0, i32 %402
  %404 = load i32, i32 addrspace(5)* %403, align 4, !tbaa !8
  %405 = add nsw i32 %404, 1
  store i32 %405, i32 addrspace(5)* %403, align 4, !tbaa !8
  %406 = add nuw nsw i32 %6, 1
  %407 = getelementptr inbounds [10 x [10 x i8]], [10 x [10 x i8]] addrspace(3)* @_ZZ18convolution_kernelPhS_iiE12input_shared, i32 0, i32 %406, i32 %7
  %408 = load i8, i8 addrspace(3)* %407, align 1, !tbaa !5
  %409 = zext i8 %408 to i32
  %410 = getelementptr inbounds [256 x i32], [256 x i32] addrspace(5)* %5, i32 0, i32 %409
  %411 = load i32, i32 addrspace(5)* %410, align 4, !tbaa !8
  %412 = add nsw i32 %411, 1
  store i32 %412, i32 addrspace(5)* %410, align 4, !tbaa !8
  %413 = getelementptr inbounds [10 x [10 x i8]], [10 x [10 x i8]] addrspace(3)* @_ZZ18convolution_kernelPhS_iiE12input_shared, i32 0, i32 %406, i32 %392
  %414 = load i8, i8 addrspace(3)* %413, align 1, !tbaa !5
  %415 = zext i8 %414 to i32
  %416 = getelementptr inbounds [256 x i32], [256 x i32] addrspace(5)* %5, i32 0, i32 %415
  %417 = load i32, i32 addrspace(5)* %416, align 4, !tbaa !8
  %418 = add nsw i32 %417, 1
  store i32 %418, i32 addrspace(5)* %416, align 4, !tbaa !8
  %419 = getelementptr inbounds [10 x [10 x i8]], [10 x [10 x i8]] addrspace(3)* @_ZZ18convolution_kernelPhS_iiE12input_shared, i32 0, i32 %406, i32 %399
  %420 = load i8, i8 addrspace(3)* %419, align 1, !tbaa !5
  %421 = zext i8 %420 to i32
  %422 = getelementptr inbounds [256 x i32], [256 x i32] addrspace(5)* %5, i32 0, i32 %421
  %423 = load i32, i32 addrspace(5)* %422, align 4, !tbaa !8
  %424 = add nsw i32 %423, 1
  store i32 %424, i32 addrspace(5)* %422, align 4, !tbaa !8
  %425 = add nuw nsw i32 %6, 2
  %426 = getelementptr inbounds [10 x [10 x i8]], [10 x [10 x i8]] addrspace(3)* @_ZZ18convolution_kernelPhS_iiE12input_shared, i32 0, i32 %425, i32 %7
  %427 = load i8, i8 addrspace(3)* %426, align 1, !tbaa !5
  %428 = zext i8 %427 to i32
  %429 = getelementptr inbounds [256 x i32], [256 x i32] addrspace(5)* %5, i32 0, i32 %428
  %430 = load i32, i32 addrspace(5)* %429, align 4, !tbaa !8
  %431 = add nsw i32 %430, 1
  store i32 %431, i32 addrspace(5)* %429, align 4, !tbaa !8
  %432 = getelementptr inbounds [10 x [10 x i8]], [10 x [10 x i8]] addrspace(3)* @_ZZ18convolution_kernelPhS_iiE12input_shared, i32 0, i32 %425, i32 %392
  %433 = load i8, i8 addrspace(3)* %432, align 1, !tbaa !5
  %434 = zext i8 %433 to i32
  %435 = getelementptr inbounds [256 x i32], [256 x i32] addrspace(5)* %5, i32 0, i32 %434
  %436 = load i32, i32 addrspace(5)* %435, align 4, !tbaa !8
  %437 = add nsw i32 %436, 1
  store i32 %437, i32 addrspace(5)* %435, align 4, !tbaa !8
  %438 = getelementptr inbounds [10 x [10 x i8]], [10 x [10 x i8]] addrspace(3)* @_ZZ18convolution_kernelPhS_iiE12input_shared, i32 0, i32 %425, i32 %399
  %439 = load i8, i8 addrspace(3)* %438, align 1, !tbaa !5
  %440 = zext i8 %439 to i32
  %441 = getelementptr inbounds [256 x i32], [256 x i32] addrspace(5)* %5, i32 0, i32 %440
  %442 = load i32, i32 addrspace(5)* %441, align 4, !tbaa !8
  %443 = add nsw i32 %442, 1
  store i32 %443, i32 addrspace(5)* %441, align 4, !tbaa !8
  br label %444

444:                                              ; preds = %493, %386
  %445 = phi i32 [ 0, %386 ], [ %491, %493 ]
  %446 = phi i32 [ 0, %386 ], [ %494, %493 ]
  %447 = getelementptr inbounds [256 x i32], [256 x i32] addrspace(5)* %5, i32 0, i32 %446
  %448 = load i32, i32 addrspace(5)* %447, align 16, !tbaa !8
  %449 = add nsw i32 %448, %445
  %450 = icmp sgt i32 %449, 4
  br i1 %450, label %496, label %451

451:                                              ; preds = %444
  %452 = or i32 %446, 1
  %453 = getelementptr inbounds [256 x i32], [256 x i32] addrspace(5)* %5, i32 0, i32 %452
  %454 = load i32, i32 addrspace(5)* %453, align 4, !tbaa !8
  %455 = add nsw i32 %454, %449
  %456 = icmp sgt i32 %455, 4
  br i1 %456, label %496, label %457

457:                                              ; preds = %451
  %458 = or i32 %446, 2
  %459 = getelementptr inbounds [256 x i32], [256 x i32] addrspace(5)* %5, i32 0, i32 %458
  %460 = load i32, i32 addrspace(5)* %459, align 8, !tbaa !8
  %461 = add nsw i32 %460, %455
  %462 = icmp sgt i32 %461, 4
  br i1 %462, label %496, label %463

463:                                              ; preds = %457
  %464 = or i32 %446, 3
  %465 = getelementptr inbounds [256 x i32], [256 x i32] addrspace(5)* %5, i32 0, i32 %464
  %466 = load i32, i32 addrspace(5)* %465, align 4, !tbaa !8
  %467 = add nsw i32 %466, %461
  %468 = icmp sgt i32 %467, 4
  br i1 %468, label %496, label %469

469:                                              ; preds = %463
  %470 = or i32 %446, 4
  %471 = getelementptr inbounds [256 x i32], [256 x i32] addrspace(5)* %5, i32 0, i32 %470
  %472 = load i32, i32 addrspace(5)* %471, align 16, !tbaa !8
  %473 = add nsw i32 %472, %467
  %474 = icmp sgt i32 %473, 4
  br i1 %474, label %496, label %475

475:                                              ; preds = %469
  %476 = or i32 %446, 5
  %477 = getelementptr inbounds [256 x i32], [256 x i32] addrspace(5)* %5, i32 0, i32 %476
  %478 = load i32, i32 addrspace(5)* %477, align 4, !tbaa !8
  %479 = add nsw i32 %478, %473
  %480 = icmp sgt i32 %479, 4
  br i1 %480, label %496, label %481

481:                                              ; preds = %475
  %482 = or i32 %446, 6
  %483 = getelementptr inbounds [256 x i32], [256 x i32] addrspace(5)* %5, i32 0, i32 %482
  %484 = load i32, i32 addrspace(5)* %483, align 8, !tbaa !8
  %485 = add nsw i32 %484, %479
  %486 = icmp sgt i32 %485, 4
  br i1 %486, label %496, label %487

487:                                              ; preds = %481
  %488 = or i32 %446, 7
  %489 = getelementptr inbounds [256 x i32], [256 x i32] addrspace(5)* %5, i32 0, i32 %488
  %490 = load i32, i32 addrspace(5)* %489, align 4, !tbaa !8
  %491 = add nsw i32 %490, %485
  %492 = icmp sgt i32 %491, 4
  br i1 %492, label %496, label %493

493:                                              ; preds = %487
  %494 = add nuw nsw i32 %446, 8
  %495 = icmp eq i32 %494, 256
  br i1 %495, label %496, label %444, !llvm.loop !12

496:                                              ; preds = %493, %487, %481, %475, %469, %463, %457, %451, %444
  %497 = phi i32 [ %446, %444 ], [ %452, %451 ], [ %458, %457 ], [ %464, %463 ], [ %470, %469 ], [ %476, %475 ], [ %482, %481 ], [ %488, %487 ], [ 256, %493 ]
  call void @llvm.lifetime.end.p5i8(i64 1024, i8 addrspace(5)* %53) #4
  br label %498

498:                                              ; preds = %496, %314
  %499 = phi i32 [ %497, %496 ], [ %277, %314 ]
  br i1 %22, label %500, label %505

500:                                              ; preds = %498
  %501 = trunc i32 %499 to i8
  %502 = add nsw i32 %56, 1
  %503 = sext i32 %502 to i64
  %504 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 %503
  store i8 %501, i8 addrspace(1)* %504, align 1, !tbaa !5
  br label %505

505:                                              ; preds = %500, %498
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  br i1 %59, label %509, label %506

506:                                              ; preds = %505
  %507 = add nsw i32 %28, 2
  %508 = sext i32 %507 to i64
  br label %537

509:                                              ; preds = %505
  br i1 %30, label %537, label %510

510:                                              ; preds = %509
  br i1 %32, label %514, label %511

511:                                              ; preds = %510
  %512 = add nsw i32 %33, 2
  %513 = sext i32 %512 to i64
  br label %537

514:                                              ; preds = %510
  br i1 %16, label %534, label %515

515:                                              ; preds = %514
  br i1 %35, label %531, label %516

516:                                              ; preds = %515
  br i1 %37, label %528, label %517

517:                                              ; preds = %516
  br i1 %39, label %525, label %518

518:                                              ; preds = %517
  br i1 %41, label %522, label %519

519:                                              ; preds = %518
  %520 = add nsw i32 %45, 2
  %521 = sext i32 %520 to i64
  br label %537

522:                                              ; preds = %518
  %523 = add nsw i32 %48, 2
  %524 = sext i32 %523 to i64
  br label %537

525:                                              ; preds = %517
  %526 = add nsw i32 %50, 2
  %527 = sext i32 %526 to i64
  br label %537

528:                                              ; preds = %516
  %529 = add i32 %51, -1
  %530 = sext i32 %529 to i64
  br label %537

531:                                              ; preds = %515
  %532 = add nsw i32 %52, 2
  %533 = sext i32 %532 to i64
  br label %537

534:                                              ; preds = %514
  %535 = add i32 %49, -1
  %536 = sext i32 %535 to i64
  br label %537

537:                                              ; preds = %509, %534, %531, %528, %525, %522, %519, %511, %506
  %538 = phi i64 [ %536, %534 ], [ %533, %531 ], [ %530, %528 ], [ %527, %525 ], [ %524, %522 ], [ %521, %519 ], [ %513, %511 ], [ %508, %506 ], [ 2, %509 ]
  %539 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %538
  %540 = load i8, i8 addrspace(1)* %539, align 1, !tbaa !5
  store i8 %540, i8 addrspace(3)* %29, align 1, !tbaa !5
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  br i1 %19, label %541, label %721

541:                                              ; preds = %537
  call void @llvm.lifetime.start.p5i8(i64 1024, i8 addrspace(5)* %53) #4
  br label %542

542:                                              ; preds = %542, %541
  %543 = phi i32 [ 0, %541 ], [ %607, %542 ]
  %544 = getelementptr inbounds [256 x i32], [256 x i32] addrspace(5)* %5, i32 0, i32 %543
  store i32 0, i32 addrspace(5)* %544, align 16, !tbaa !8
  %545 = or i32 %543, 1
  %546 = getelementptr inbounds [256 x i32], [256 x i32] addrspace(5)* %5, i32 0, i32 %545
  store i32 0, i32 addrspace(5)* %546, align 4, !tbaa !8
  %547 = or i32 %543, 2
  %548 = getelementptr inbounds [256 x i32], [256 x i32] addrspace(5)* %5, i32 0, i32 %547
  store i32 0, i32 addrspace(5)* %548, align 8, !tbaa !8
  %549 = or i32 %543, 3
  %550 = getelementptr inbounds [256 x i32], [256 x i32] addrspace(5)* %5, i32 0, i32 %549
  store i32 0, i32 addrspace(5)* %550, align 4, !tbaa !8
  %551 = or i32 %543, 4
  %552 = getelementptr inbounds [256 x i32], [256 x i32] addrspace(5)* %5, i32 0, i32 %551
  store i32 0, i32 addrspace(5)* %552, align 16, !tbaa !8
  %553 = or i32 %543, 5
  %554 = getelementptr inbounds [256 x i32], [256 x i32] addrspace(5)* %5, i32 0, i32 %553
  store i32 0, i32 addrspace(5)* %554, align 4, !tbaa !8
  %555 = or i32 %543, 6
  %556 = getelementptr inbounds [256 x i32], [256 x i32] addrspace(5)* %5, i32 0, i32 %555
  store i32 0, i32 addrspace(5)* %556, align 8, !tbaa !8
  %557 = or i32 %543, 7
  %558 = getelementptr inbounds [256 x i32], [256 x i32] addrspace(5)* %5, i32 0, i32 %557
  store i32 0, i32 addrspace(5)* %558, align 4, !tbaa !8
  %559 = or i32 %543, 8
  %560 = getelementptr inbounds [256 x i32], [256 x i32] addrspace(5)* %5, i32 0, i32 %559
  store i32 0, i32 addrspace(5)* %560, align 16, !tbaa !8
  %561 = or i32 %543, 9
  %562 = getelementptr inbounds [256 x i32], [256 x i32] addrspace(5)* %5, i32 0, i32 %561
  store i32 0, i32 addrspace(5)* %562, align 4, !tbaa !8
  %563 = or i32 %543, 10
  %564 = getelementptr inbounds [256 x i32], [256 x i32] addrspace(5)* %5, i32 0, i32 %563
  store i32 0, i32 addrspace(5)* %564, align 8, !tbaa !8
  %565 = or i32 %543, 11
  %566 = getelementptr inbounds [256 x i32], [256 x i32] addrspace(5)* %5, i32 0, i32 %565
  store i32 0, i32 addrspace(5)* %566, align 4, !tbaa !8
  %567 = or i32 %543, 12
  %568 = getelementptr inbounds [256 x i32], [256 x i32] addrspace(5)* %5, i32 0, i32 %567
  store i32 0, i32 addrspace(5)* %568, align 16, !tbaa !8
  %569 = or i32 %543, 13
  %570 = getelementptr inbounds [256 x i32], [256 x i32] addrspace(5)* %5, i32 0, i32 %569
  store i32 0, i32 addrspace(5)* %570, align 4, !tbaa !8
  %571 = or i32 %543, 14
  %572 = getelementptr inbounds [256 x i32], [256 x i32] addrspace(5)* %5, i32 0, i32 %571
  store i32 0, i32 addrspace(5)* %572, align 8, !tbaa !8
  %573 = or i32 %543, 15
  %574 = getelementptr inbounds [256 x i32], [256 x i32] addrspace(5)* %5, i32 0, i32 %573
  store i32 0, i32 addrspace(5)* %574, align 4, !tbaa !8
  %575 = or i32 %543, 16
  %576 = getelementptr inbounds [256 x i32], [256 x i32] addrspace(5)* %5, i32 0, i32 %575
  store i32 0, i32 addrspace(5)* %576, align 16, !tbaa !8
  %577 = or i32 %543, 17
  %578 = getelementptr inbounds [256 x i32], [256 x i32] addrspace(5)* %5, i32 0, i32 %577
  store i32 0, i32 addrspace(5)* %578, align 4, !tbaa !8
  %579 = or i32 %543, 18
  %580 = getelementptr inbounds [256 x i32], [256 x i32] addrspace(5)* %5, i32 0, i32 %579
  store i32 0, i32 addrspace(5)* %580, align 8, !tbaa !8
  %581 = or i32 %543, 19
  %582 = getelementptr inbounds [256 x i32], [256 x i32] addrspace(5)* %5, i32 0, i32 %581
  store i32 0, i32 addrspace(5)* %582, align 4, !tbaa !8
  %583 = or i32 %543, 20
  %584 = getelementptr inbounds [256 x i32], [256 x i32] addrspace(5)* %5, i32 0, i32 %583
  store i32 0, i32 addrspace(5)* %584, align 16, !tbaa !8
  %585 = or i32 %543, 21
  %586 = getelementptr inbounds [256 x i32], [256 x i32] addrspace(5)* %5, i32 0, i32 %585
  store i32 0, i32 addrspace(5)* %586, align 4, !tbaa !8
  %587 = or i32 %543, 22
  %588 = getelementptr inbounds [256 x i32], [256 x i32] addrspace(5)* %5, i32 0, i32 %587
  store i32 0, i32 addrspace(5)* %588, align 8, !tbaa !8
  %589 = or i32 %543, 23
  %590 = getelementptr inbounds [256 x i32], [256 x i32] addrspace(5)* %5, i32 0, i32 %589
  store i32 0, i32 addrspace(5)* %590, align 4, !tbaa !8
  %591 = or i32 %543, 24
  %592 = getelementptr inbounds [256 x i32], [256 x i32] addrspace(5)* %5, i32 0, i32 %591
  store i32 0, i32 addrspace(5)* %592, align 16, !tbaa !8
  %593 = or i32 %543, 25
  %594 = getelementptr inbounds [256 x i32], [256 x i32] addrspace(5)* %5, i32 0, i32 %593
  store i32 0, i32 addrspace(5)* %594, align 4, !tbaa !8
  %595 = or i32 %543, 26
  %596 = getelementptr inbounds [256 x i32], [256 x i32] addrspace(5)* %5, i32 0, i32 %595
  store i32 0, i32 addrspace(5)* %596, align 8, !tbaa !8
  %597 = or i32 %543, 27
  %598 = getelementptr inbounds [256 x i32], [256 x i32] addrspace(5)* %5, i32 0, i32 %597
  store i32 0, i32 addrspace(5)* %598, align 4, !tbaa !8
  %599 = or i32 %543, 28
  %600 = getelementptr inbounds [256 x i32], [256 x i32] addrspace(5)* %5, i32 0, i32 %599
  store i32 0, i32 addrspace(5)* %600, align 16, !tbaa !8
  %601 = or i32 %543, 29
  %602 = getelementptr inbounds [256 x i32], [256 x i32] addrspace(5)* %5, i32 0, i32 %601
  store i32 0, i32 addrspace(5)* %602, align 4, !tbaa !8
  %603 = or i32 %543, 30
  %604 = getelementptr inbounds [256 x i32], [256 x i32] addrspace(5)* %5, i32 0, i32 %603
  store i32 0, i32 addrspace(5)* %604, align 8, !tbaa !8
  %605 = or i32 %543, 31
  %606 = getelementptr inbounds [256 x i32], [256 x i32] addrspace(5)* %5, i32 0, i32 %605
  store i32 0, i32 addrspace(5)* %606, align 4, !tbaa !8
  %607 = add nuw nsw i32 %543, 32
  %608 = icmp eq i32 %607, 256
  br i1 %608, label %609, label %542, !llvm.loop !10

609:                                              ; preds = %542
  %610 = load i8, i8 addrspace(3)* %29, align 1, !tbaa !5
  %611 = zext i8 %610 to i32
  %612 = getelementptr inbounds [256 x i32], [256 x i32] addrspace(5)* %5, i32 0, i32 %611
  %613 = load i32, i32 addrspace(5)* %612, align 4, !tbaa !8
  %614 = add nsw i32 %613, 1
  store i32 %614, i32 addrspace(5)* %612, align 4, !tbaa !8
  %615 = add nuw nsw i32 %7, 1
  %616 = getelementptr inbounds [10 x [10 x i8]], [10 x [10 x i8]] addrspace(3)* @_ZZ18convolution_kernelPhS_iiE12input_shared, i32 0, i32 %6, i32 %615
  %617 = load i8, i8 addrspace(3)* %616, align 1, !tbaa !5
  %618 = zext i8 %617 to i32
  %619 = getelementptr inbounds [256 x i32], [256 x i32] addrspace(5)* %5, i32 0, i32 %618
  %620 = load i32, i32 addrspace(5)* %619, align 4, !tbaa !8
  %621 = add nsw i32 %620, 1
  store i32 %621, i32 addrspace(5)* %619, align 4, !tbaa !8
  %622 = add nuw nsw i32 %7, 2
  %623 = getelementptr inbounds [10 x [10 x i8]], [10 x [10 x i8]] addrspace(3)* @_ZZ18convolution_kernelPhS_iiE12input_shared, i32 0, i32 %6, i32 %622
  %624 = load i8, i8 addrspace(3)* %623, align 1, !tbaa !5
  %625 = zext i8 %624 to i32
  %626 = getelementptr inbounds [256 x i32], [256 x i32] addrspace(5)* %5, i32 0, i32 %625
  %627 = load i32, i32 addrspace(5)* %626, align 4, !tbaa !8
  %628 = add nsw i32 %627, 1
  store i32 %628, i32 addrspace(5)* %626, align 4, !tbaa !8
  %629 = add nuw nsw i32 %6, 1
  %630 = getelementptr inbounds [10 x [10 x i8]], [10 x [10 x i8]] addrspace(3)* @_ZZ18convolution_kernelPhS_iiE12input_shared, i32 0, i32 %629, i32 %7
  %631 = load i8, i8 addrspace(3)* %630, align 1, !tbaa !5
  %632 = zext i8 %631 to i32
  %633 = getelementptr inbounds [256 x i32], [256 x i32] addrspace(5)* %5, i32 0, i32 %632
  %634 = load i32, i32 addrspace(5)* %633, align 4, !tbaa !8
  %635 = add nsw i32 %634, 1
  store i32 %635, i32 addrspace(5)* %633, align 4, !tbaa !8
  %636 = getelementptr inbounds [10 x [10 x i8]], [10 x [10 x i8]] addrspace(3)* @_ZZ18convolution_kernelPhS_iiE12input_shared, i32 0, i32 %629, i32 %615
  %637 = load i8, i8 addrspace(3)* %636, align 1, !tbaa !5
  %638 = zext i8 %637 to i32
  %639 = getelementptr inbounds [256 x i32], [256 x i32] addrspace(5)* %5, i32 0, i32 %638
  %640 = load i32, i32 addrspace(5)* %639, align 4, !tbaa !8
  %641 = add nsw i32 %640, 1
  store i32 %641, i32 addrspace(5)* %639, align 4, !tbaa !8
  %642 = getelementptr inbounds [10 x [10 x i8]], [10 x [10 x i8]] addrspace(3)* @_ZZ18convolution_kernelPhS_iiE12input_shared, i32 0, i32 %629, i32 %622
  %643 = load i8, i8 addrspace(3)* %642, align 1, !tbaa !5
  %644 = zext i8 %643 to i32
  %645 = getelementptr inbounds [256 x i32], [256 x i32] addrspace(5)* %5, i32 0, i32 %644
  %646 = load i32, i32 addrspace(5)* %645, align 4, !tbaa !8
  %647 = add nsw i32 %646, 1
  store i32 %647, i32 addrspace(5)* %645, align 4, !tbaa !8
  %648 = add nuw nsw i32 %6, 2
  %649 = getelementptr inbounds [10 x [10 x i8]], [10 x [10 x i8]] addrspace(3)* @_ZZ18convolution_kernelPhS_iiE12input_shared, i32 0, i32 %648, i32 %7
  %650 = load i8, i8 addrspace(3)* %649, align 1, !tbaa !5
  %651 = zext i8 %650 to i32
  %652 = getelementptr inbounds [256 x i32], [256 x i32] addrspace(5)* %5, i32 0, i32 %651
  %653 = load i32, i32 addrspace(5)* %652, align 4, !tbaa !8
  %654 = add nsw i32 %653, 1
  store i32 %654, i32 addrspace(5)* %652, align 4, !tbaa !8
  %655 = getelementptr inbounds [10 x [10 x i8]], [10 x [10 x i8]] addrspace(3)* @_ZZ18convolution_kernelPhS_iiE12input_shared, i32 0, i32 %648, i32 %615
  %656 = load i8, i8 addrspace(3)* %655, align 1, !tbaa !5
  %657 = zext i8 %656 to i32
  %658 = getelementptr inbounds [256 x i32], [256 x i32] addrspace(5)* %5, i32 0, i32 %657
  %659 = load i32, i32 addrspace(5)* %658, align 4, !tbaa !8
  %660 = add nsw i32 %659, 1
  store i32 %660, i32 addrspace(5)* %658, align 4, !tbaa !8
  %661 = getelementptr inbounds [10 x [10 x i8]], [10 x [10 x i8]] addrspace(3)* @_ZZ18convolution_kernelPhS_iiE12input_shared, i32 0, i32 %648, i32 %622
  %662 = load i8, i8 addrspace(3)* %661, align 1, !tbaa !5
  %663 = zext i8 %662 to i32
  %664 = getelementptr inbounds [256 x i32], [256 x i32] addrspace(5)* %5, i32 0, i32 %663
  %665 = load i32, i32 addrspace(5)* %664, align 4, !tbaa !8
  %666 = add nsw i32 %665, 1
  store i32 %666, i32 addrspace(5)* %664, align 4, !tbaa !8
  br label %667

667:                                              ; preds = %716, %609
  %668 = phi i32 [ 0, %609 ], [ %714, %716 ]
  %669 = phi i32 [ 0, %609 ], [ %717, %716 ]
  %670 = getelementptr inbounds [256 x i32], [256 x i32] addrspace(5)* %5, i32 0, i32 %669
  %671 = load i32, i32 addrspace(5)* %670, align 16, !tbaa !8
  %672 = add nsw i32 %671, %668
  %673 = icmp sgt i32 %672, 4
  br i1 %673, label %719, label %674

674:                                              ; preds = %667
  %675 = or i32 %669, 1
  %676 = getelementptr inbounds [256 x i32], [256 x i32] addrspace(5)* %5, i32 0, i32 %675
  %677 = load i32, i32 addrspace(5)* %676, align 4, !tbaa !8
  %678 = add nsw i32 %677, %672
  %679 = icmp sgt i32 %678, 4
  br i1 %679, label %719, label %680

680:                                              ; preds = %674
  %681 = or i32 %669, 2
  %682 = getelementptr inbounds [256 x i32], [256 x i32] addrspace(5)* %5, i32 0, i32 %681
  %683 = load i32, i32 addrspace(5)* %682, align 8, !tbaa !8
  %684 = add nsw i32 %683, %678
  %685 = icmp sgt i32 %684, 4
  br i1 %685, label %719, label %686

686:                                              ; preds = %680
  %687 = or i32 %669, 3
  %688 = getelementptr inbounds [256 x i32], [256 x i32] addrspace(5)* %5, i32 0, i32 %687
  %689 = load i32, i32 addrspace(5)* %688, align 4, !tbaa !8
  %690 = add nsw i32 %689, %684
  %691 = icmp sgt i32 %690, 4
  br i1 %691, label %719, label %692

692:                                              ; preds = %686
  %693 = or i32 %669, 4
  %694 = getelementptr inbounds [256 x i32], [256 x i32] addrspace(5)* %5, i32 0, i32 %693
  %695 = load i32, i32 addrspace(5)* %694, align 16, !tbaa !8
  %696 = add nsw i32 %695, %690
  %697 = icmp sgt i32 %696, 4
  br i1 %697, label %719, label %698

698:                                              ; preds = %692
  %699 = or i32 %669, 5
  %700 = getelementptr inbounds [256 x i32], [256 x i32] addrspace(5)* %5, i32 0, i32 %699
  %701 = load i32, i32 addrspace(5)* %700, align 4, !tbaa !8
  %702 = add nsw i32 %701, %696
  %703 = icmp sgt i32 %702, 4
  br i1 %703, label %719, label %704

704:                                              ; preds = %698
  %705 = or i32 %669, 6
  %706 = getelementptr inbounds [256 x i32], [256 x i32] addrspace(5)* %5, i32 0, i32 %705
  %707 = load i32, i32 addrspace(5)* %706, align 8, !tbaa !8
  %708 = add nsw i32 %707, %702
  %709 = icmp sgt i32 %708, 4
  br i1 %709, label %719, label %710

710:                                              ; preds = %704
  %711 = or i32 %669, 7
  %712 = getelementptr inbounds [256 x i32], [256 x i32] addrspace(5)* %5, i32 0, i32 %711
  %713 = load i32, i32 addrspace(5)* %712, align 4, !tbaa !8
  %714 = add nsw i32 %713, %708
  %715 = icmp sgt i32 %714, 4
  br i1 %715, label %719, label %716

716:                                              ; preds = %710
  %717 = add nuw nsw i32 %669, 8
  %718 = icmp eq i32 %717, 256
  br i1 %718, label %719, label %667, !llvm.loop !12

719:                                              ; preds = %716, %710, %704, %698, %692, %686, %680, %674, %667
  %720 = phi i32 [ %669, %667 ], [ %675, %674 ], [ %681, %680 ], [ %687, %686 ], [ %693, %692 ], [ %699, %698 ], [ %705, %704 ], [ %711, %710 ], [ 256, %716 ]
  call void @llvm.lifetime.end.p5i8(i64 1024, i8 addrspace(5)* %53) #4
  br label %721

721:                                              ; preds = %719, %537
  %722 = phi i32 [ %720, %719 ], [ %499, %537 ]
  br i1 %22, label %723, label %728

723:                                              ; preds = %721
  %724 = trunc i32 %722 to i8
  %725 = add nsw i32 %56, 2
  %726 = sext i32 %725 to i64
  %727 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 %726
  store i8 %724, i8 addrspace(1)* %727, align 1, !tbaa !5
  br label %728

728:                                              ; preds = %723, %721
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  ret void
}

; Function Attrs: convergent mustprogress nounwind willreturn
declare void @llvm.amdgcn.s.barrier() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #3

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.y() #3

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #3

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.y() #3

attributes #0 = { argmemonly mustprogress nocallback nofree nosync nounwind willreturn }
attributes #1 = { convergent mustprogress norecurse nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #2 = { convergent mustprogress nounwind willreturn }
attributes #3 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }
attributes #4 = { nounwind }

!llvm.module.flags = !{!0, !1}
!opencl.ocl.version = !{!2}
!llvm.ident = !{!3}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 1}
!2 = !{i32 2, i32 0}
!3 = !{!"clang version 15.0.0 (http://10.15.3.7/dcutoolkit/driverruntime/llvm-project.git 340750feeda88c9c2ce8ad481b11d9aa7f033d39)"}
!4 = !{i32 0, i32 1024}
!5 = !{!6, !6, i64 0}
!6 = !{!"omnipotent char", !7, i64 0}
!7 = !{!"Simple C++ TBAA"}
!8 = !{!9, !9, i64 0}
!9 = !{!"int", !6, i64 0}
!10 = distinct !{!10, !11}
!11 = !{!"llvm.loop.mustprogress"}
!12 = distinct !{!12, !11}
