; ModuleID = '../data/hip_kernels/553/1/main.cu'
source_filename = "../data/hip_kernels/553/1/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@_ZZ11myCudaCountPKcPiiE3BIT = internal unnamed_addr addrspace(3) global [256 x [8 x i32]] undef, align 16
@_ZZ11myCudaCountPKcPiiE4iBIT = internal unnamed_addr addrspace(3) global [256 x i32] undef, align 16

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z11myCudaCountPKcPii(i8 addrspace(1)* nocapture readonly %0, i32 addrspace(1)* nocapture writeonly %1, i32 %2) local_unnamed_addr #0 {
  %4 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %5 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %6 = icmp eq i32 %5, 1
  %7 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %8 = getelementptr i8, i8 addrspace(4)* %7, i64 4
  %9 = bitcast i8 addrspace(4)* %8 to i16 addrspace(4)*
  %10 = load i16, i16 addrspace(4)* %9, align 4, !range !4, !invariant.load !5
  %11 = zext i16 %10 to i32
  %12 = mul i32 %4, %11
  %13 = add i32 %12, 128
  %14 = select i1 %6, i32 %13, i32 %12
  %15 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %16 = add nsw i32 %14, %15
  %17 = shl nsw i32 %16, 2
  %18 = icmp slt i32 %17, %2
  br i1 %18, label %19, label %233

19:                                               ; preds = %3
  %20 = sext i32 %17 to i64
  %21 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %20
  %22 = load i8, i8 addrspace(1)* %21, align 1, !tbaa !7, !amdgpu.noclobber !5
  %23 = icmp sgt i8 %22, 32
  %24 = add nuw nsw i32 %17, 1
  %25 = icmp slt i32 %24, %2
  br i1 %25, label %26, label %33

26:                                               ; preds = %19
  %27 = select i1 %23, i32 2, i32 1
  %28 = sext i32 %24 to i64
  %29 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %28
  %30 = load i8, i8 addrspace(1)* %29, align 1, !tbaa !7, !amdgpu.noclobber !5
  %31 = icmp slt i8 %30, 33
  %32 = select i1 %31, i32 0, i32 %27
  br label %33

33:                                               ; preds = %26, %19
  %34 = phi i32 [ %32, %26 ], [ 0, %19 ]
  %35 = add nuw nsw i32 %17, 2
  %36 = icmp slt i32 %35, %2
  br i1 %36, label %37, label %44

37:                                               ; preds = %33
  %38 = add nuw nsw i32 %34, 1
  %39 = sext i32 %35 to i64
  %40 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %39
  %41 = load i8, i8 addrspace(1)* %40, align 1, !tbaa !7, !amdgpu.noclobber !5
  %42 = icmp slt i8 %41, 33
  %43 = select i1 %42, i32 0, i32 %38
  br label %44

44:                                               ; preds = %37, %33
  %45 = phi i32 [ %43, %37 ], [ 0, %33 ]
  %46 = add nuw nsw i32 %17, 3
  %47 = icmp slt i32 %46, %2
  br i1 %47, label %48, label %55

48:                                               ; preds = %44
  %49 = add nuw nsw i32 %45, 1
  %50 = sext i32 %46 to i64
  %51 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %50
  %52 = load i8, i8 addrspace(1)* %51, align 1, !tbaa !7, !amdgpu.noclobber !5
  %53 = icmp slt i8 %52, 33
  %54 = select i1 %53, i32 0, i32 %49
  br label %55

55:                                               ; preds = %48, %44
  %56 = phi i32 [ %54, %48 ], [ 0, %44 ]
  %57 = sub nsw i32 3, %56
  %58 = getelementptr inbounds [256 x i32], [256 x i32] addrspace(3)* @_ZZ11myCudaCountPKcPiiE4iBIT, i32 0, i32 %15
  store i32 %57, i32 addrspace(3)* %58, align 4, !tbaa !10
  %59 = lshr i32 %56, 2
  %60 = and i32 %59, 63
  %61 = getelementptr inbounds [256 x [8 x i32]], [256 x [8 x i32]] addrspace(3)* @_ZZ11myCudaCountPKcPiiE3BIT, i32 0, i32 %15, i32 0
  store i32 %60, i32 addrspace(3)* %61, align 16, !tbaa !10
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %62 = load i32, i32 addrspace(3)* %61, align 16, !tbaa !10
  %63 = add nsw i32 %15, -1
  %64 = icmp eq i32 %15, 0
  br i1 %64, label %73, label %65

65:                                               ; preds = %55
  %66 = icmp eq i32 %62, 0
  br i1 %66, label %73, label %67

67:                                               ; preds = %65
  %68 = getelementptr inbounds [256 x [8 x i32]], [256 x [8 x i32]] addrspace(3)* @_ZZ11myCudaCountPKcPiiE3BIT, i32 0, i32 %63, i32 0
  %69 = load i32, i32 addrspace(3)* %68, align 16, !tbaa !10
  %70 = icmp eq i32 %69, 0
  %71 = add nsw i32 %69, %62
  %72 = select i1 %70, i32 0, i32 %71
  br label %73

73:                                               ; preds = %67, %55, %65
  %74 = phi i32 [ 0, %65 ], [ %62, %55 ], [ %72, %67 ]
  %75 = getelementptr inbounds [256 x [8 x i32]], [256 x [8 x i32]] addrspace(3)* @_ZZ11myCudaCountPKcPiiE3BIT, i32 0, i32 %15, i32 1
  store i32 %74, i32 addrspace(3)* %75, align 4, !tbaa !10
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %76 = add nsw i32 %15, -2
  %77 = icmp ugt i32 %15, 1
  br i1 %77, label %78, label %86

78:                                               ; preds = %73
  %79 = icmp eq i32 %74, 0
  br i1 %79, label %86, label %80

80:                                               ; preds = %78
  %81 = getelementptr inbounds [256 x [8 x i32]], [256 x [8 x i32]] addrspace(3)* @_ZZ11myCudaCountPKcPiiE3BIT, i32 0, i32 %76, i32 1
  %82 = load i32, i32 addrspace(3)* %81, align 4, !tbaa !10
  %83 = icmp eq i32 %82, 0
  %84 = add nsw i32 %82, %74
  %85 = select i1 %83, i32 0, i32 %84
  br label %86

86:                                               ; preds = %80, %78, %73
  %87 = phi i32 [ %74, %73 ], [ 0, %78 ], [ %85, %80 ]
  %88 = getelementptr inbounds [256 x [8 x i32]], [256 x [8 x i32]] addrspace(3)* @_ZZ11myCudaCountPKcPiiE3BIT, i32 0, i32 %15, i32 2
  store i32 %87, i32 addrspace(3)* %88, align 8, !tbaa !10
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %89 = add nsw i32 %15, -4
  %90 = icmp ugt i32 %15, 3
  br i1 %90, label %91, label %99

91:                                               ; preds = %86
  %92 = icmp eq i32 %87, 0
  br i1 %92, label %99, label %93

93:                                               ; preds = %91
  %94 = getelementptr inbounds [256 x [8 x i32]], [256 x [8 x i32]] addrspace(3)* @_ZZ11myCudaCountPKcPiiE3BIT, i32 0, i32 %89, i32 2
  %95 = load i32, i32 addrspace(3)* %94, align 8, !tbaa !10
  %96 = icmp eq i32 %95, 0
  %97 = add nsw i32 %95, %87
  %98 = select i1 %96, i32 0, i32 %97
  br label %99

99:                                               ; preds = %93, %91, %86
  %100 = phi i32 [ %87, %86 ], [ 0, %91 ], [ %98, %93 ]
  %101 = getelementptr inbounds [256 x [8 x i32]], [256 x [8 x i32]] addrspace(3)* @_ZZ11myCudaCountPKcPiiE3BIT, i32 0, i32 %15, i32 3
  store i32 %100, i32 addrspace(3)* %101, align 4, !tbaa !10
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %102 = add nsw i32 %15, -8
  %103 = icmp ugt i32 %15, 7
  br i1 %103, label %104, label %112

104:                                              ; preds = %99
  %105 = icmp eq i32 %100, 0
  br i1 %105, label %112, label %106

106:                                              ; preds = %104
  %107 = getelementptr inbounds [256 x [8 x i32]], [256 x [8 x i32]] addrspace(3)* @_ZZ11myCudaCountPKcPiiE3BIT, i32 0, i32 %102, i32 3
  %108 = load i32, i32 addrspace(3)* %107, align 4, !tbaa !10
  %109 = icmp eq i32 %108, 0
  %110 = add nsw i32 %108, %100
  %111 = select i1 %109, i32 0, i32 %110
  br label %112

112:                                              ; preds = %106, %104, %99
  %113 = phi i32 [ %100, %99 ], [ 0, %104 ], [ %111, %106 ]
  %114 = getelementptr inbounds [256 x [8 x i32]], [256 x [8 x i32]] addrspace(3)* @_ZZ11myCudaCountPKcPiiE3BIT, i32 0, i32 %15, i32 4
  store i32 %113, i32 addrspace(3)* %114, align 16, !tbaa !10
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %115 = add nsw i32 %15, -16
  %116 = icmp ugt i32 %15, 15
  br i1 %116, label %117, label %125

117:                                              ; preds = %112
  %118 = icmp eq i32 %113, 0
  br i1 %118, label %125, label %119

119:                                              ; preds = %117
  %120 = getelementptr inbounds [256 x [8 x i32]], [256 x [8 x i32]] addrspace(3)* @_ZZ11myCudaCountPKcPiiE3BIT, i32 0, i32 %115, i32 4
  %121 = load i32, i32 addrspace(3)* %120, align 16, !tbaa !10
  %122 = icmp eq i32 %121, 0
  %123 = add nsw i32 %121, %113
  %124 = select i1 %122, i32 0, i32 %123
  br label %125

125:                                              ; preds = %119, %117, %112
  %126 = phi i32 [ %113, %112 ], [ 0, %117 ], [ %124, %119 ]
  %127 = getelementptr inbounds [256 x [8 x i32]], [256 x [8 x i32]] addrspace(3)* @_ZZ11myCudaCountPKcPiiE3BIT, i32 0, i32 %15, i32 5
  store i32 %126, i32 addrspace(3)* %127, align 4, !tbaa !10
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %128 = add nsw i32 %15, -32
  %129 = icmp ugt i32 %15, 31
  br i1 %129, label %130, label %138

130:                                              ; preds = %125
  %131 = icmp eq i32 %126, 0
  br i1 %131, label %138, label %132

132:                                              ; preds = %130
  %133 = getelementptr inbounds [256 x [8 x i32]], [256 x [8 x i32]] addrspace(3)* @_ZZ11myCudaCountPKcPiiE3BIT, i32 0, i32 %128, i32 5
  %134 = load i32, i32 addrspace(3)* %133, align 4, !tbaa !10
  %135 = icmp eq i32 %134, 0
  %136 = add nsw i32 %134, %126
  %137 = select i1 %135, i32 0, i32 %136
  br label %138

138:                                              ; preds = %132, %130, %125
  %139 = phi i32 [ %126, %125 ], [ 0, %130 ], [ %137, %132 ]
  %140 = getelementptr inbounds [256 x [8 x i32]], [256 x [8 x i32]] addrspace(3)* @_ZZ11myCudaCountPKcPiiE3BIT, i32 0, i32 %15, i32 6
  store i32 %139, i32 addrspace(3)* %140, align 8, !tbaa !10
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %141 = add nsw i32 %15, -64
  %142 = icmp ugt i32 %15, 63
  br i1 %142, label %143, label %151

143:                                              ; preds = %138
  %144 = icmp eq i32 %139, 0
  br i1 %144, label %151, label %145

145:                                              ; preds = %143
  %146 = getelementptr inbounds [256 x [8 x i32]], [256 x [8 x i32]] addrspace(3)* @_ZZ11myCudaCountPKcPiiE3BIT, i32 0, i32 %141, i32 6
  %147 = load i32, i32 addrspace(3)* %146, align 8, !tbaa !10
  %148 = icmp eq i32 %147, 0
  %149 = add nsw i32 %147, %139
  %150 = select i1 %148, i32 0, i32 %149
  br label %151

151:                                              ; preds = %145, %143, %138
  %152 = phi i32 [ %139, %138 ], [ 0, %143 ], [ %150, %145 ]
  %153 = getelementptr inbounds [256 x [8 x i32]], [256 x [8 x i32]] addrspace(3)* @_ZZ11myCudaCountPKcPiiE3BIT, i32 0, i32 %15, i32 7
  store i32 %152, i32 addrspace(3)* %153, align 4, !tbaa !10
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %154 = icmp eq i32 %15, 0
  br i1 %154, label %161, label %155

155:                                              ; preds = %151
  %156 = add nsw i32 %15, -1
  %157 = getelementptr inbounds [256 x [8 x i32]], [256 x [8 x i32]] addrspace(3)* @_ZZ11myCudaCountPKcPiiE3BIT, i32 0, i32 %156, i32 7
  %158 = load i32, i32 addrspace(3)* %157, align 4, !tbaa !10
  %159 = sub nsw i32 %156, %158
  %160 = icmp sgt i32 %159, -1
  br i1 %160, label %164, label %161, !llvm.loop !12

161:                                              ; preds = %155, %164, %169, %174, %179, %184, %189, %194, %151
  %162 = phi i32 [ -1, %151 ], [ %159, %155 ], [ %167, %164 ], [ %172, %169 ], [ %177, %174 ], [ %182, %179 ], [ %187, %184 ], [ %192, %189 ], [ %197, %194 ]
  %163 = phi i1 [ false, %151 ], [ %160, %155 ], [ %168, %164 ], [ %173, %169 ], [ %178, %174 ], [ %183, %179 ], [ %188, %184 ], [ %193, %189 ], [ %198, %194 ]
  br i1 %163, label %199, label %205

164:                                              ; preds = %155
  %165 = getelementptr inbounds [256 x [8 x i32]], [256 x [8 x i32]] addrspace(3)* @_ZZ11myCudaCountPKcPiiE3BIT, i32 0, i32 %159, i32 6
  %166 = load i32, i32 addrspace(3)* %165, align 8, !tbaa !10
  %167 = sub nsw i32 %159, %166
  %168 = icmp sgt i32 %167, -1
  br i1 %168, label %169, label %161, !llvm.loop !12

169:                                              ; preds = %164
  %170 = getelementptr inbounds [256 x [8 x i32]], [256 x [8 x i32]] addrspace(3)* @_ZZ11myCudaCountPKcPiiE3BIT, i32 0, i32 %167, i32 5
  %171 = load i32, i32 addrspace(3)* %170, align 4, !tbaa !10
  %172 = sub nsw i32 %167, %171
  %173 = icmp sgt i32 %172, -1
  br i1 %173, label %174, label %161, !llvm.loop !12

174:                                              ; preds = %169
  %175 = getelementptr inbounds [256 x [8 x i32]], [256 x [8 x i32]] addrspace(3)* @_ZZ11myCudaCountPKcPiiE3BIT, i32 0, i32 %172, i32 4
  %176 = load i32, i32 addrspace(3)* %175, align 16, !tbaa !10
  %177 = sub nsw i32 %172, %176
  %178 = icmp sgt i32 %177, -1
  br i1 %178, label %179, label %161, !llvm.loop !12

179:                                              ; preds = %174
  %180 = getelementptr inbounds [256 x [8 x i32]], [256 x [8 x i32]] addrspace(3)* @_ZZ11myCudaCountPKcPiiE3BIT, i32 0, i32 %177, i32 3
  %181 = load i32, i32 addrspace(3)* %180, align 4, !tbaa !10
  %182 = sub nsw i32 %177, %181
  %183 = icmp sgt i32 %182, -1
  br i1 %183, label %184, label %161, !llvm.loop !12

184:                                              ; preds = %179
  %185 = getelementptr inbounds [256 x [8 x i32]], [256 x [8 x i32]] addrspace(3)* @_ZZ11myCudaCountPKcPiiE3BIT, i32 0, i32 %182, i32 2
  %186 = load i32, i32 addrspace(3)* %185, align 8, !tbaa !10
  %187 = sub nsw i32 %182, %186
  %188 = icmp sgt i32 %187, -1
  br i1 %188, label %189, label %161, !llvm.loop !12

189:                                              ; preds = %184
  %190 = getelementptr inbounds [256 x [8 x i32]], [256 x [8 x i32]] addrspace(3)* @_ZZ11myCudaCountPKcPiiE3BIT, i32 0, i32 %187, i32 1
  %191 = load i32, i32 addrspace(3)* %190, align 4, !tbaa !10
  %192 = sub nsw i32 %187, %191
  %193 = icmp sgt i32 %192, -1
  br i1 %193, label %194, label %161, !llvm.loop !12

194:                                              ; preds = %189
  %195 = getelementptr inbounds [256 x [8 x i32]], [256 x [8 x i32]] addrspace(3)* @_ZZ11myCudaCountPKcPiiE3BIT, i32 0, i32 %192, i32 0
  %196 = load i32, i32 addrspace(3)* %195, align 16, !tbaa !10
  %197 = sub nsw i32 %192, %196
  %198 = icmp sgt i32 %197, -1
  br label %161

199:                                              ; preds = %161
  %200 = add nsw i32 %162, %14
  %201 = shl nsw i32 %200, 2
  %202 = getelementptr inbounds [256 x i32], [256 x i32] addrspace(3)* @_ZZ11myCudaCountPKcPiiE4iBIT, i32 0, i32 %162
  %203 = load i32, i32 addrspace(3)* %202, align 4, !tbaa !10
  %204 = add nsw i32 %203, %201
  br label %205

205:                                              ; preds = %199, %161
  %206 = phi i32 [ %204, %199 ], [ %162, %161 ]
  %207 = icmp ugt i32 %15, 127
  %208 = icmp slt i32 %16, 128
  %209 = select i1 %207, i1 true, i1 %208
  br i1 %209, label %210, label %233

210:                                              ; preds = %205
  %211 = select i1 %23, i32 %206, i32 %17
  %212 = sub nsw i32 %17, %211
  %213 = sext i32 %17 to i64
  %214 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %213
  store i32 %212, i32 addrspace(1)* %214, align 4, !tbaa !10
  br i1 %25, label %215, label %233

215:                                              ; preds = %210
  %216 = icmp eq i32 %34, 0
  %217 = select i1 %216, i32 %24, i32 %211
  %218 = sub nsw i32 %24, %217
  %219 = sext i32 %24 to i64
  %220 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %219
  store i32 %218, i32 addrspace(1)* %220, align 4, !tbaa !10
  br i1 %36, label %221, label %233

221:                                              ; preds = %215
  %222 = icmp eq i32 %45, 0
  %223 = select i1 %222, i32 %35, i32 %217
  %224 = sub nsw i32 %35, %223
  %225 = sext i32 %35 to i64
  %226 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %225
  store i32 %224, i32 addrspace(1)* %226, align 4, !tbaa !10
  br i1 %47, label %227, label %233

227:                                              ; preds = %221
  %228 = icmp eq i32 %56, 0
  %229 = sub i32 %46, %223
  %230 = select i1 %228, i32 0, i32 %229
  %231 = sext i32 %46 to i64
  %232 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %231
  store i32 %230, i32 addrspace(1)* %232, align 4, !tbaa !10
  br label %233

233:                                              ; preds = %210, %215, %221, %227, %205, %3
  ret void
}

; Function Attrs: convergent mustprogress nounwind willreturn
declare void @llvm.amdgcn.s.barrier() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.y() #2

attributes #0 = { convergent mustprogress norecurse nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { convergent mustprogress nounwind willreturn }
attributes #2 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }

!llvm.module.flags = !{!0, !1}
!opencl.ocl.version = !{!2}
!llvm.ident = !{!3}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 1}
!2 = !{i32 2, i32 0}
!3 = !{!"clang version 15.0.0 (http://10.15.3.7/dcutoolkit/driverruntime/llvm-project.git 340750feeda88c9c2ce8ad481b11d9aa7f033d39)"}
!4 = !{i16 1, i16 1025}
!5 = !{}
!6 = !{i32 0, i32 1024}
!7 = !{!8, !8, i64 0}
!8 = !{!"omnipotent char", !9, i64 0}
!9 = !{!"Simple C++ TBAA"}
!10 = !{!11, !11, i64 0}
!11 = !{!"int", !8, i64 0}
!12 = distinct !{!12, !13}
!13 = !{!"llvm.loop.mustprogress"}
