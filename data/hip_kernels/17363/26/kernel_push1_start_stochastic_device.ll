; ModuleID = '../data/hip_kernels/17363/26/main.cu'
source_filename = "../data/hip_kernels/17363/26/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@_ZZ29kernel_push1_start_stochasticPiS_S_S_S_S_S_S_S_iiiiiiS_S_S_PbE9height_fn = internal unnamed_addr addrspace(3) global [356 x i32] undef, align 16

; Function Attrs: convergent mustprogress norecurse nounwind willreturn
define protected amdgpu_kernel void @_Z29kernel_push1_start_stochasticPiS_S_S_S_S_S_S_S_iiiiiiS_S_S_Pb(i32 addrspace(1)* nocapture readonly %0, i32 addrspace(1)* nocapture readonly %1, i32 addrspace(1)* nocapture readonly %2, i32 addrspace(1)* nocapture readonly %3, i32 addrspace(1)* nocapture %4, i32 addrspace(1)* nocapture %5, i32 addrspace(1)* nocapture %6, i32 addrspace(1)* nocapture readonly %7, i32 addrspace(1)* nocapture writeonly %8, i32 %9, i32 %10, i32 %11, i32 %12, i32 %13, i32 %14, i32 addrspace(1)* nocapture readnone %15, i32 addrspace(1)* nocapture readnone %16, i32 addrspace(1)* nocapture readnone %17, i8 addrspace(1)* nocapture readnone %18) local_unnamed_addr #0 {
  %20 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %21 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !4
  %22 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %23 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %24 = getelementptr i8, i8 addrspace(4)* %23, i64 4
  %25 = bitcast i8 addrspace(4)* %24 to i16 addrspace(4)*
  %26 = load i16, i16 addrspace(4)* %25, align 4, !range !5, !invariant.load !6
  %27 = zext i16 %26 to i32
  %28 = and i32 %22, 16777215
  %29 = mul i32 %28, %27
  %30 = add i32 %29, %20
  %31 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %32 = getelementptr i8, i8 addrspace(4)* %23, i64 6
  %33 = bitcast i8 addrspace(4)* %32 to i16 addrspace(4)*
  %34 = load i16, i16 addrspace(4)* %33, align 2, !range !5, !invariant.load !6
  %35 = zext i16 %34 to i32
  %36 = and i32 %31, 16777215
  %37 = mul i32 %36, %35
  %38 = add i32 %37, %21
  %39 = and i32 %38, 16777215
  %40 = and i32 %13, 16777215
  %41 = mul i32 %39, %40
  %42 = add nsw i32 %41, %30
  %43 = mul nuw nsw i32 %21, 34
  %44 = add nuw nsw i32 %20, 34
  %45 = add nuw nsw i32 %44, %43
  %46 = add nuw nsw i32 %45, 1
  %47 = sext i32 %42 to i64
  %48 = getelementptr inbounds i32, i32 addrspace(1)* %7, i64 %47
  %49 = load i32, i32 addrspace(1)* %48, align 4, !tbaa !7, !amdgpu.noclobber !6
  %50 = getelementptr inbounds [356 x i32], [356 x i32] addrspace(3)* @_ZZ29kernel_push1_start_stochasticPiS_S_S_S_S_S_S_S_iiiiiiS_S_S_PbE9height_fn, i32 0, i32 %46
  store i32 %49, i32 addrspace(3)* %50, align 4, !tbaa !7
  %51 = icmp eq i32 %20, 31
  %52 = add nsw i32 %13, -1
  %53 = icmp slt i32 %30, %52
  %54 = select i1 %51, i1 %53, i1 false
  br i1 %54, label %55, label %62

55:                                               ; preds = %19
  %56 = add nsw i32 %42, 1
  %57 = sext i32 %56 to i64
  %58 = getelementptr inbounds i32, i32 addrspace(1)* %7, i64 %57
  %59 = load i32, i32 addrspace(1)* %58, align 4, !tbaa !7, !amdgpu.noclobber !6
  %60 = add nuw nsw i32 %45, 2
  %61 = getelementptr inbounds [356 x i32], [356 x i32] addrspace(3)* @_ZZ29kernel_push1_start_stochasticPiS_S_S_S_S_S_S_S_iiiiiiS_S_S_PbE9height_fn, i32 0, i32 %60
  store i32 %59, i32 addrspace(3)* %61, align 4, !tbaa !7
  br label %62

62:                                               ; preds = %19, %55
  %63 = icmp eq i32 %20, 0
  %64 = icmp sgt i32 %30, 0
  %65 = select i1 %63, i1 %64, i1 false
  br i1 %65, label %66, label %72

66:                                               ; preds = %62
  %67 = add nsw i32 %42, -1
  %68 = sext i32 %67 to i64
  %69 = getelementptr inbounds i32, i32 addrspace(1)* %7, i64 %68
  %70 = load i32, i32 addrspace(1)* %69, align 4, !tbaa !7, !amdgpu.noclobber !6
  %71 = getelementptr inbounds [356 x i32], [356 x i32] addrspace(3)* @_ZZ29kernel_push1_start_stochasticPiS_S_S_S_S_S_S_S_iiiiiiS_S_S_PbE9height_fn, i32 0, i32 %45
  store i32 %70, i32 addrspace(3)* %71, align 4, !tbaa !7
  br label %72

72:                                               ; preds = %62, %66
  %73 = icmp eq i32 %21, 7
  %74 = add nsw i32 %14, -1
  %75 = icmp slt i32 %38, %74
  %76 = select i1 %73, i1 %75, i1 false
  br i1 %76, label %77, label %84

77:                                               ; preds = %72
  %78 = add nsw i32 %42, %13
  %79 = sext i32 %78 to i64
  %80 = getelementptr inbounds i32, i32 addrspace(1)* %7, i64 %79
  %81 = load i32, i32 addrspace(1)* %80, align 4, !tbaa !7, !amdgpu.noclobber !6
  %82 = add nuw nsw i32 %45, 35
  %83 = getelementptr inbounds [356 x i32], [356 x i32] addrspace(3)* @_ZZ29kernel_push1_start_stochasticPiS_S_S_S_S_S_S_S_iiiiiiS_S_S_PbE9height_fn, i32 0, i32 %82
  store i32 %81, i32 addrspace(3)* %83, align 4, !tbaa !7
  br label %84

84:                                               ; preds = %72, %77
  %85 = icmp eq i32 %21, 0
  %86 = icmp sgt i32 %38, 0
  %87 = select i1 %85, i1 %86, i1 false
  br i1 %87, label %88, label %95

88:                                               ; preds = %84
  %89 = sub nsw i32 %42, %13
  %90 = sext i32 %89 to i64
  %91 = getelementptr inbounds i32, i32 addrspace(1)* %7, i64 %90
  %92 = load i32, i32 addrspace(1)* %91, align 4, !tbaa !7, !amdgpu.noclobber !6
  %93 = add nsw i32 %45, -33
  %94 = getelementptr inbounds [356 x i32], [356 x i32] addrspace(3)* @_ZZ29kernel_push1_start_stochasticPiS_S_S_S_S_S_S_S_iiiiiiS_S_S_PbE9height_fn, i32 0, i32 %93
  store i32 %92, i32 addrspace(3)* %94, align 4, !tbaa !7
  br label %95

95:                                               ; preds = %84, %88
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %96 = getelementptr inbounds i32, i32 addrspace(1)* %5, i64 %47
  %97 = load i32, i32 addrspace(1)* %96, align 4, !tbaa !7, !amdgpu.noclobber !6
  %98 = icmp slt i32 %42, %12
  br i1 %98, label %99, label %126

99:                                               ; preds = %95
  %100 = getelementptr inbounds i32, i32 addrspace(1)* %6, i64 %47
  %101 = load i32, i32 addrspace(1)* %100, align 4, !tbaa !7, !amdgpu.noclobber !6
  %102 = icmp eq i32 %101, 1
  br i1 %102, label %103, label %126

103:                                              ; preds = %99
  %104 = add nsw i32 %10, -1
  %105 = icmp slt i32 %30, %104
  %106 = and i1 %105, %64
  br i1 %106, label %107, label %126

107:                                              ; preds = %103
  %108 = add nsw i32 %11, -1
  %109 = icmp slt i32 %38, %108
  %110 = and i1 %109, %86
  br i1 %110, label %111, label %126

111:                                              ; preds = %107
  %112 = getelementptr inbounds i32, i32 addrspace(1)* %4, i64 %47
  %113 = load i32, i32 addrspace(1)* %112, align 4, !tbaa !7, !amdgpu.noclobber !6
  %114 = icmp sgt i32 %113, 0
  %115 = icmp sgt i32 %97, 0
  %116 = select i1 %114, i1 %115, i1 false
  br i1 %116, label %117, label %126

117:                                              ; preds = %111
  %118 = load i32, i32 addrspace(3)* %50, align 4, !tbaa !7
  %119 = icmp eq i32 %118, 1
  br i1 %119, label %120, label %126

120:                                              ; preds = %117
  %121 = tail call i32 @llvm.umin.i32(i32 %113, i32 %97)
  %122 = sub nsw i32 %113, %121
  store i32 %122, i32 addrspace(1)* %112, align 4, !tbaa !7
  %123 = sub nsw i32 0, %121
  %124 = atomicrmw add i32 addrspace(1)* %96, i32 %123 syncscope("agent-one-as") monotonic, align 4
  %125 = sub nsw i32 %97, %121
  br label %126

126:                                              ; preds = %111, %117, %120, %107, %103, %99, %95
  %127 = phi i32 [ %97, %107 ], [ %97, %103 ], [ %97, %99 ], [ %97, %95 ], [ %125, %120 ], [ %97, %117 ], [ %97, %111 ]
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %128 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %47
  %129 = load i32, i32 addrspace(1)* %128, align 4, !tbaa !7
  %130 = icmp sgt i32 %127, 0
  br i1 %130, label %131, label %175

131:                                              ; preds = %126
  %132 = load i32, i32 addrspace(3)* %50, align 4, !tbaa !7
  %133 = getelementptr inbounds [356 x i32], [356 x i32] addrspace(3)* @_ZZ29kernel_push1_start_stochasticPiS_S_S_S_S_S_S_S_iiiiiiS_S_S_PbE9height_fn, i32 0, i32 %45
  %134 = load i32, i32 addrspace(3)* %133, align 4, !tbaa !7
  %135 = add nsw i32 %134, 1
  %136 = icmp eq i32 %132, %135
  %137 = icmp sgt i32 %129, 0
  %138 = select i1 %136, i1 %137, i1 false
  br i1 %138, label %176, label %139

139:                                              ; preds = %131
  %140 = add nuw nsw i32 %45, 2
  %141 = getelementptr inbounds [356 x i32], [356 x i32] addrspace(3)* @_ZZ29kernel_push1_start_stochasticPiS_S_S_S_S_S_S_S_iiiiiiS_S_S_PbE9height_fn, i32 0, i32 %140
  %142 = load i32, i32 addrspace(3)* %141, align 4, !tbaa !7
  %143 = add nsw i32 %142, 1
  %144 = icmp eq i32 %132, %143
  br i1 %144, label %145, label %149

145:                                              ; preds = %139
  %146 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %47
  %147 = load i32, i32 addrspace(1)* %146, align 4, !tbaa !7
  %148 = icmp sgt i32 %147, 0
  br i1 %148, label %176, label %149

149:                                              ; preds = %145, %139
  %150 = add nuw nsw i32 %45, 35
  %151 = getelementptr inbounds [356 x i32], [356 x i32] addrspace(3)* @_ZZ29kernel_push1_start_stochasticPiS_S_S_S_S_S_S_S_iiiiiiS_S_S_PbE9height_fn, i32 0, i32 %150
  %152 = load i32, i32 addrspace(3)* %151, align 4, !tbaa !7
  %153 = add nsw i32 %152, 1
  %154 = icmp eq i32 %132, %153
  br i1 %154, label %155, label %159

155:                                              ; preds = %149
  %156 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %47
  %157 = load i32, i32 addrspace(1)* %156, align 4, !tbaa !7
  %158 = icmp sgt i32 %157, 0
  br i1 %158, label %176, label %159

159:                                              ; preds = %155, %149
  %160 = add nsw i32 %45, -33
  %161 = getelementptr inbounds [356 x i32], [356 x i32] addrspace(3)* @_ZZ29kernel_push1_start_stochasticPiS_S_S_S_S_S_S_S_iiiiiiS_S_S_PbE9height_fn, i32 0, i32 %160
  %162 = load i32, i32 addrspace(3)* %161, align 4, !tbaa !7
  %163 = add nsw i32 %162, 1
  %164 = icmp eq i32 %132, %163
  br i1 %164, label %165, label %169

165:                                              ; preds = %159
  %166 = getelementptr inbounds i32, i32 addrspace(1)* %3, i64 %47
  %167 = load i32, i32 addrspace(1)* %166, align 4, !tbaa !7
  %168 = icmp sgt i32 %167, 0
  br i1 %168, label %176, label %169

169:                                              ; preds = %165, %159
  %170 = icmp eq i32 %132, 1
  br i1 %170, label %171, label %175

171:                                              ; preds = %169
  %172 = getelementptr inbounds i32, i32 addrspace(1)* %4, i64 %47
  %173 = load i32, i32 addrspace(1)* %172, align 4, !tbaa !7
  %174 = icmp sgt i32 %173, 0
  br i1 %174, label %176, label %175

175:                                              ; preds = %171, %169, %126
  br label %176

176:                                              ; preds = %145, %155, %165, %171, %131, %175
  %177 = phi i32 [ 0, %175 ], [ 1, %131 ], [ 1, %171 ], [ 1, %165 ], [ 1, %155 ], [ 1, %145 ]
  %178 = getelementptr inbounds i32, i32 addrspace(1)* %6, i64 %47
  store i32 %177, i32 addrspace(1)* %178, align 4, !tbaa !7
  br i1 %98, label %179, label %233

179:                                              ; preds = %176
  %180 = add nsw i32 %10, -1
  %181 = icmp slt i32 %30, %180
  %182 = and i1 %181, %64
  br i1 %182, label %183, label %233

183:                                              ; preds = %179
  %184 = add nsw i32 %11, -1
  %185 = icmp slt i32 %38, %184
  %186 = and i1 %185, %86
  br i1 %186, label %187, label %233

187:                                              ; preds = %183
  %188 = getelementptr inbounds i32, i32 addrspace(1)* %4, i64 %47
  %189 = load i32, i32 addrspace(1)* %188, align 4, !tbaa !7
  %190 = icmp sgt i32 %189, 0
  br i1 %190, label %230, label %191

191:                                              ; preds = %187
  %192 = icmp sgt i32 %129, 0
  br i1 %192, label %193, label %197

193:                                              ; preds = %191
  %194 = getelementptr inbounds [356 x i32], [356 x i32] addrspace(3)* @_ZZ29kernel_push1_start_stochasticPiS_S_S_S_S_S_S_S_iiiiiiS_S_S_PbE9height_fn, i32 0, i32 %45
  %195 = load i32, i32 addrspace(3)* %194, align 4, !tbaa !7
  %196 = tail call i32 @llvm.smin.i32(i32 %195, i32 %9)
  br label %197

197:                                              ; preds = %193, %191
  %198 = phi i32 [ %9, %191 ], [ %196, %193 ]
  %199 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %47
  %200 = load i32, i32 addrspace(1)* %199, align 4, !tbaa !7
  %201 = icmp sgt i32 %200, 0
  br i1 %201, label %202, label %207

202:                                              ; preds = %197
  %203 = add nuw nsw i32 %45, 2
  %204 = getelementptr inbounds [356 x i32], [356 x i32] addrspace(3)* @_ZZ29kernel_push1_start_stochasticPiS_S_S_S_S_S_S_S_iiiiiiS_S_S_PbE9height_fn, i32 0, i32 %203
  %205 = load i32, i32 addrspace(3)* %204, align 4, !tbaa !7
  %206 = tail call i32 @llvm.smin.i32(i32 %198, i32 %205)
  br label %207

207:                                              ; preds = %202, %197
  %208 = phi i32 [ %198, %197 ], [ %206, %202 ]
  %209 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %47
  %210 = load i32, i32 addrspace(1)* %209, align 4, !tbaa !7
  %211 = icmp sgt i32 %210, 0
  br i1 %211, label %212, label %217

212:                                              ; preds = %207
  %213 = add nuw nsw i32 %45, 35
  %214 = getelementptr inbounds [356 x i32], [356 x i32] addrspace(3)* @_ZZ29kernel_push1_start_stochasticPiS_S_S_S_S_S_S_S_iiiiiiS_S_S_PbE9height_fn, i32 0, i32 %213
  %215 = load i32, i32 addrspace(3)* %214, align 4, !tbaa !7
  %216 = tail call i32 @llvm.smin.i32(i32 %208, i32 %215)
  br label %217

217:                                              ; preds = %212, %207
  %218 = phi i32 [ %208, %207 ], [ %216, %212 ]
  %219 = getelementptr inbounds i32, i32 addrspace(1)* %3, i64 %47
  %220 = load i32, i32 addrspace(1)* %219, align 4, !tbaa !7
  %221 = icmp sgt i32 %220, 0
  br i1 %221, label %222, label %227

222:                                              ; preds = %217
  %223 = add nsw i32 %45, -33
  %224 = getelementptr inbounds [356 x i32], [356 x i32] addrspace(3)* @_ZZ29kernel_push1_start_stochasticPiS_S_S_S_S_S_S_S_iiiiiiS_S_S_PbE9height_fn, i32 0, i32 %223
  %225 = load i32, i32 addrspace(3)* %224, align 4, !tbaa !7
  %226 = tail call i32 @llvm.smin.i32(i32 %218, i32 %225)
  br label %227

227:                                              ; preds = %222, %217
  %228 = phi i32 [ %218, %217 ], [ %226, %222 ]
  %229 = add nsw i32 %228, 1
  br label %230

230:                                              ; preds = %187, %227
  %231 = phi i32 [ %229, %227 ], [ 1, %187 ]
  %232 = getelementptr inbounds i32, i32 addrspace(1)* %8, i64 %47
  store i32 %231, i32 addrspace(1)* %232, align 4, !tbaa !7
  br label %233

233:                                              ; preds = %230, %183, %179, %176
  ret void
}

; Function Attrs: convergent mustprogress nounwind willreturn
declare void @llvm.amdgcn.s.barrier() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.y() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #2

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.umin.i32(i32, i32) #3

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.y() #2

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.smin.i32(i32, i32) #4

attributes #0 = { convergent mustprogress norecurse nounwind willreturn "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { convergent mustprogress nounwind willreturn }
attributes #2 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }
attributes #3 = { mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn }
attributes #4 = { nocallback nofree nosync nounwind readnone speculatable willreturn }

!llvm.module.flags = !{!0, !1}
!opencl.ocl.version = !{!2}
!llvm.ident = !{!3}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 1}
!2 = !{i32 2, i32 0}
!3 = !{!"clang version 15.0.0 (http://10.15.3.7/dcutoolkit/driverruntime/llvm-project.git 340750feeda88c9c2ce8ad481b11d9aa7f033d39)"}
!4 = !{i32 0, i32 1024}
!5 = !{i16 1, i16 1025}
!6 = !{}
!7 = !{!8, !8, i64 0}
!8 = !{!"int", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
